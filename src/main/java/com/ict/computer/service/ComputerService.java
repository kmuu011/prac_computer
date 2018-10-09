package com.ict.computer.service;

import java.util.List;

import com.ict.computer.vo.ComputerInfo;

public interface ComputerService {
	
	public List<ComputerInfo> getComputerInfoList(ComputerInfo ci);
	
	public Integer getInsertResult(ComputerInfo ci);
}
