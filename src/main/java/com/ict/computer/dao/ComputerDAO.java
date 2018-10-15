package com.ict.computer.dao;

import java.util.List;

import com.ict.computer.vo.ComputerInfo;

public interface ComputerDAO {
	
	public List<ComputerInfo> selectComputerInfoList(ComputerInfo ci);

	public Integer insertComputerInfo(ComputerInfo ci);
	
	public Integer deleteComputerInfo(List<Integer> deleteNo);
	
	public Integer updateComputerInfo(ComputerInfo ci);
	
	public String selectImg(ComputerInfo ci);
	
	public List<ComputerInfo> selectRecent();

	public Integer deleteImg(ComputerInfo ci);
	

	

}
