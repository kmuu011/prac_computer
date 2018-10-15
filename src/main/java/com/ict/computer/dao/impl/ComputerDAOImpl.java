package com.ict.computer.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.computer.dao.ComputerDAO;
import com.ict.computer.vo.ComputerInfo;

@Repository
public class ComputerDAOImpl implements ComputerDAO{
	
	@Autowired
	private SqlSession ss;

	@Override
	public List<ComputerInfo> selectComputerInfoList(ComputerInfo ci) {
		return ss.selectList("SQL.COMPUTER.selectComputerInfoList", ci);
	}

	@Override
	public Integer insertComputerInfo(ComputerInfo ci) {
		return ss.insert("SQL.COMPUTER.insertComputerInfo", ci);
	}

	@Override
	public Integer deleteComputerInfo(List<Integer> deleteNo) {
		Integer result = 0;
		for(int cino:deleteNo) {
			result += ss.delete("SQL.COMPUTER.deleteComputerInfo",cino);
		}
		return result;
	}

	@Override
	public Integer updateComputerInfo(ComputerInfo ci) {
		
		return ss.update("SQL.COMPUTER.updateComputerInfo",ci);
	}

	@Override
	public String selectImg(ComputerInfo ci) {
		return ss.selectOne("SQL.COMPUTER.selectImg", ci);
	}

	@Override
	public List<ComputerInfo> selectRecent() {
		return ss.selectList("SQL.COMPUTER.selectRecent");
	}

	@Override
	public Integer deleteImg(ComputerInfo ci) {
		return ss.update("SQL.COMPUTER.updateComputerInfo", ci);
	}


}
