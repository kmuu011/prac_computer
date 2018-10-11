package com.ict.computer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
		System.out.println(ci);
		return cs.getComputerInfoList(null);
	}
	
	@RequestMapping(value="/computerinfo/{cino}", method=RequestMethod.GET)
	@ResponseBody
	public List<ComputerInfo> getComputerInfo(@PathVariable Integer cino){
		ComputerInfo ci = new ComputerInfo();
		ci.setCino(cino);
		return cs.getComputerInfoList(ci);
	}
	
	@RequestMapping(value="/computerinfo", method=RequestMethod.POST)
	@ResponseBody
	public Integer computerInfoInsert(@RequestBody ComputerInfo ci){
		System.out.println(ci);
		return cs.getInsertResult(ci);
	}
	
	@RequestMapping(value="/computerinfoD", method=RequestMethod.POST)
	@ResponseBody
	public Integer computerInfoDelete(@RequestBody List<Integer> deleteNo) {
		System.out.println(deleteNo);
		return cs.getDeleteResult(deleteNo);
	}
	
	
	@RequestMapping(value="/computerSearch", method=RequestMethod.POST)
	@ResponseBody
	public List<ComputerInfo> searchComputerInfo(@RequestBody ComputerInfo ci){
			System.out.println(ci);
		return cs.getComputerInfoList(ci);
	}
	
	@RequestMapping(value="/computerinfo", method=RequestMethod.PUT)
	@ResponseBody
	public Integer updateComputerInfo(@RequestBody ComputerInfo ci) {
		
		System.out.println(ci);
		return cs.getUpdateResult(ci);
	}
	
	
	

}
