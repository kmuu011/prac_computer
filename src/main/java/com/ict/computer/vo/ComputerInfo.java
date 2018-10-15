package com.ict.computer.vo;

import org.apache.ibatis.type.Alias;

@Alias("ci")
public class ComputerInfo {
	
	private Integer cino;
	private String ciname;
	private String cipower;
	private String cicpu;
	private String cimb;
	private String ciram;
	private String civga;
	private String cihdd;
	private String cissd;
	private String ciodd;
	private String cicase;
	private String ciimg;
	
	
	public ComputerInfo() {	}
	
	public Integer getCino() {
		return cino;
	}
	public void setCino(Integer cino) {
		this.cino = cino;
	}
	public String getCiname() {
		return ciname;
	}
	public void setCiname(String ciname) {
		this.ciname = ciname;
	}
	public String getCipower() {
		return cipower;
	}
	public void setCipower(String cipower) {
		this.cipower = cipower;
	}
	public String getCicpu() {
		return cicpu;
	}
	public void setCicpu(String cicpu) {
		this.cicpu = cicpu;
	}
	public String getCimb() {
		return cimb;
	}
	public void setCimb(String cimb) {
		this.cimb = cimb;
	}
	public String getCiram() {
		return ciram;
	}
	public void setCiram(String ciram) {
		this.ciram = ciram;
	}
	public String getCivga() {
		return civga;
	}
	public void setCivga(String civga) {
		this.civga = civga;
	}
	public String getCihdd() {
		return cihdd;
	}
	public void setCihdd(String cihdd) {
		this.cihdd = cihdd;
	}
	public String getCissd() {
		return cissd;
	}
	public void setCissd(String cissd) {
		this.cissd = cissd;
	}
	public String getCiodd() {
		return ciodd;
	}
	public void setCiodd(String ciodd) {
		this.ciodd = ciodd;
	}
	public String getCicase() {
		return cicase;
	}
	public void setCicase(String cicase) {
		this.cicase = cicase;
	}

	public String getCiimg() {
		return ciimg;
	}

	public void setCiimg(String ciimg) {
		this.ciimg = ciimg;
	}

	@Override
	public String toString() {
		return "ComputerInfo [cino=" + cino + ", ciname=" + ciname + ", cipower=" + cipower + ", cicpu=" + cicpu
				+ ", cimb=" + cimb + ", ciram=" + ciram + ", civga=" + civga + ", cihdd=" + cihdd + ", cissd=" + cissd
				+ ", ciodd=" + ciodd + ", cicase=" + cicase + ", ciimg=" + ciimg + "]";
	}
	
	
	
	
	

}
