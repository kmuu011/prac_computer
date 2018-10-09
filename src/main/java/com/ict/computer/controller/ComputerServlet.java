package com.ict.computer.controller;

import java.util.List;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.computer.service.ComputerService;
import com.ict.computer.vo.ComputerInfo;

@Controller
public class ComputerServlet {
	
	@Autowired
	ComputerService cs;
	
	@RequestMapping(value="/computerinfoMD", method=RequestMethod.GET)
	@ResponseBody
	public ComputerInfo getComputerInfoMetaData(ComputerInfo ci) {
		return ci;
	}
	
	@RequestMapping(value="/computerinfo", method=RequestMethod.GET)
	@ResponseBody
	public List<ComputerInfo> getComputerInfoList(@ModelAttribute ComputerInfo ci){
		
		return cs.getComputerInfoList(null);
	}
	
	@RequestMapping(value="/computerinfo", method=RequestMethod.POST)
	@ResponseBody
	public Integer computerInfoInsert(@RequestBody ComputerInfo ci){
		System.out.println(ci);
		return cs.getInsertResult(ci);
	}
	
	
	
	
	
	

}
