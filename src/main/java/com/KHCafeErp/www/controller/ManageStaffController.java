package com.KHCafeErp.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.OrderBase;
import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.ManageStaffService;


@Controller
public class ManageStaffController {

@Autowired ManageStaffService manageStaffservice;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


	@RequestMapping(value="/manageStaff/staff" ,method=RequestMethod.GET)
	public void Stafflist(Model model,Staff staff) {
		List<Staff> staffList = manageStaffservice.getStaffList(staff);
			model.addAttribute("staffList", staffList);
		
	}
	
	
	
	
	
}
