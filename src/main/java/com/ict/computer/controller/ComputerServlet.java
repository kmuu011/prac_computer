package com.ict.computer.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.computer.vo.ComputerInfo;

@Controller
public class ComputerServlet {
	
	@RequestMapping(value="/computerinfo", method=RequestMethod.GET)
	public @ResponseBody List<ComputerInfo> getComputerInfoList(@ModelAttribute ComputerInfo ci){
		
		return null;
	}
	
	
	

}
