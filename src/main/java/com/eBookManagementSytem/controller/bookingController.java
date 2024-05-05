package com.eBookManagementSytem.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import com.eBookManagementSytem.models.booking;
import com.eBookManagementSytem.services.BookingService;

@Controller
public class bookingController {

	@Autowired
	private BookingService bookingService;

	@PostMapping("/booking")
	public String saveBooking(@ModelAttribute("booking") booking booking, RedirectAttributes redirectAttributes) {
		// Save the booking data into the database using the booking service
		bookingService.addbooking(booking);
//		System.out.println("zalllllll ata khara kharchhhhhhh");

		// Add a success message to be displayed on the redirected page
		redirectAttributes.addFlashAttribute("message", "Booking saved successfully.");

		// Redirect to a success page or any other page you prefer
		//return "redirect:/success";
		return "flights";
	}

}
