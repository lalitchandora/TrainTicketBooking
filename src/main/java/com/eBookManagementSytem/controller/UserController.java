package com.eBookManagementSytem.controller;

import java.io.IOException;

import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eBookManagementSytem.models.Users;
import com.eBookManagementSytem.models.Addflight;
import com.eBookManagementSytem.services.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	

	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		model.addAttribute("newUser", new Users());
		return "registration";
	}

//	@PostMapping("/register")
//	public String registerUser(@ModelAttribute("newUser") Users user, HttpServletRequest request) {
//
//		String userType = request.getParameter("userType");
//		userService.registerUser(user);
//		return "redirect:/login";
//		
//	}
	
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute("newUser") Users user, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    userService.registerUser(user);
	    
	    // Set success message in flash attributes
	    redirectAttributes.addFlashAttribute("status", "success");
	    redirectAttributes.addFlashAttribute("message", "Account created successfully!");

	    return "redirect:/login";
	}


	@GetMapping("/login")
	public String showLoginForm() {
		return "login";
	}

	
	@PostMapping("/login")
	public String loginUser(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws ServletException, IOException {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    boolean loginSuccess = userService.loginUser(username, password);
	    if (loginSuccess) {
	    	HttpSession session = request.getSession();
	        session.setAttribute("loggedInUser", username);
	        return "redirect:/flights";
	    } else {
	        redirectAttributes.addFlashAttribute("status", "failed");
	        return "redirect:/login";
	    }
	}
	
	
	
	
	@GetMapping("/adminlogin")
	public String showAdminLoginForm() {
		return "adminlogin";
	}

	
	@PostMapping("/adminlogin")
	public String loginAdmin(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes, HttpSession session) throws ServletException, IOException {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    boolean loginSuccess2 = userService.loginAdmin(username, password);
	    if (loginSuccess2) {
	        session.setAttribute("loggedInAdmin", username);
	        return "redirect:/addflight";
	    } else {
	        redirectAttributes.addFlashAttribute("status", "failed");
	        return "redirect:/adminlogin";
	    }
	}

	@GetMapping("/ticketdetails")
	public String ticketdetails() {
		return "ticketdetails";
	}

	@GetMapping("/CustomerDetails")
	public String customerdetails() {
		return "CustomerDetails";
	}



	@GetMapping("/addflight")
    public String addflight() {
        return "addflight";
    }
	
	@PostMapping("/addflight")
	public String addflight(@ModelAttribute("newflight") Addflight addflight, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    userService.addflight(addflight);
	    
	    // Set success message in flash attributes
	    redirectAttributes.addFlashAttribute("status", "success");
	    redirectAttributes.addFlashAttribute("message", "Flight Added successfully!");

	    return "redirect:/addflight";
	}
	
	
	@GetMapping("/booking")
    public String booking() {
        return "booking";
    }
	
	@GetMapping("/flights")
    public String flights() {
        return "flights";
    }
	

	@GetMapping("/index")
	public String indexPage(HttpSession session,Model model) {
		
 
        
        List<Users> users = userService.getUsers();
        model.addAttribute("users", users);
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String usersJson = objectMapper.writeValueAsString(users);
            System.out.println(usersJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

		// Check if the user is logged in
		if (session.getAttribute("loggedInUser") != null) {
			return "index";
		} else {
			return "redirect:/index";
		}
	}
	

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		String userType = (String) session.getAttribute("userType");

		if (userType != null && userType.equals("user")) {

			session.removeAttribute("loggedInUser");
			System.out.println("User logged out successfully!!");
		} 

		return "redirect:/";
	}
	

}

