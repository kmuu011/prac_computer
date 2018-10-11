package com.ict.computer.vo;

public class TestVo {
	private String tname;
	private String tfile;
	
	
	public TestVo() {}
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTfile() {
		return tfile;
	}
	public void setTfile(String tfile) {
		this.tfile = tfile;
	}

	@Override
	public String toString() {
		return "TestVo [tname=" + tname + ", tfile=" + tfile + "]";
	}
	
	
	
	

}
