package com.eBookManagementSytem.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBookManagementSytem.models.booking;
import com.eBookManagementSytem.repos.bookingRepository;

import jakarta.transaction.Transactional;


@Service
@Transactional
public class BookingService {
	
    @Autowired
    private bookingRepository bookRepository;
    
    public booking findByadharno(String adhar) {
    	return bookRepository.findByaadhar(adhar);
    }

    public String addbooking(booking book) {
        bookRepository.save(book);
        return "okkk";
    }



}
