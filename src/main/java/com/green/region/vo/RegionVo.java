package com.green.region.vo;

public class RegionVo {

	private int    region_idx;
	private String region_name; // 지역이름 (시군구 제외)
	
	public RegionVo() {}
	
	public RegionVo(int region_idx, String region_name) {
		super();
		this.region_idx = region_idx;
		this.region_name = region_name;
	}

	public int getRegion_idx() {
		return region_idx;
	}

	public void setRegion_idx(int region_idx) {
		this.region_idx = region_idx;
	}

	public String getRegion_name() {
		return region_name;
	}

	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}

	@Override
	public String toString() {
		return "RegionVo [region_idx=" + region_idx + ", region_name=" + region_name + "]";
	}

	
	
	
}

