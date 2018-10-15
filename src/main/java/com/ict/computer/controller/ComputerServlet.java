package com.ict.computer.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.beanutils.BeanUtils;

import com.ict.computer.service.ComputerService;
import com.ict.computer.util.GetFiles;
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
	public List<ComputerInfo> getComputerInfoList(){
		return cs.getComputerInfoList(null);
	}
	
	@RequestMapping(value="/computerinfoR", method=RequestMethod.GET)
	@ResponseBody
	public List<ComputerInfo> getRecent(){
		return cs.getRecent();
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
	
	
	@RequestMapping(value="/computerinfoTest", method=RequestMethod.POST)
	@ResponseBody
	public Integer insertCITest(HttpServletRequest request) {
		ComputerInfo ci = new ComputerInfo();
		
		try {
			BeanUtils.populate(ci, GetFiles.parseReqeust(request));
			System.out.println(ci);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return cs.getInsertResult(ci);
	}
	
	@RequestMapping(value="/computerinfoTest", method=RequestMethod.PUT)
	@ResponseBody
	public Integer updateCITest(HttpServletRequest request) {
		ComputerInfo ci = new ComputerInfo();
		
		try {
			BeanUtils.populate(ci, GetFiles.parseReqeust(request));
			System.out.println(ci);
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return cs.getUpdateResult(ci);
	}
	
	
	

}
