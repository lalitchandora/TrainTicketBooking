package com.eBookManagementSytem.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eBookManagementSytem.models.booking;
import com.eBookManagementSytem.models.details;
import com.eBookManagementSytem.services.BookingService;
import com.eBookManagementSytem.services.DetailsService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DetailsController {
	@Autowired
	private DetailsService detail;
	 @GetMapping("/details")

	    public String getAllDetails(Model model) {

	    	  List<details> details = detail.getdetails();

	    	  model.addAttribute("details", details);

	          try {

	              ObjectMapper objectMapper = new ObjectMapper();

	              String usersJson = objectMapper.writeValueAsString(details);

	              System.out.println(usersJson);

	              System.out.println(details);

	          } catch (Exception e) {

	              e.printStackTrace();

	          }       

	          return "ticketdetails";

	    }
//		@Autowired

//		@PostMapping("/details")
//		public String saveBooking(@ModelAttribute("booking") booking booking, RedirectAttributes redirectAttributes) {
//			// Save the booking data into the database using the booking service
//			DetailsService.getdetails();
//			
//			// Add a success message to be displayed on the redirected page
//			redirectAttributes.addFlashAttribute("message", "Booking saved successfully.");
//			
//			// Redirect to a success page or any other page you prefer
//			return "redirect:/ticketdetails";
//		}
}
