package com.green.menu.vo;

public class MenuVo {
	
	private String menu_idx;
	private String menu_title;
	
	public MenuVo () {}

	public MenuVo(String menu_idx, String menu_title) {
		super();
		this.menu_idx = menu_idx;
		this.menu_title = menu_title;
	}

	public String getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(String menu_idx) {
		this.menu_idx = menu_idx;
	}

	public String getMenu_title() {
		return menu_title;
	}

	public void setMenu_title(String menu_title) {
		this.menu_title = menu_title;
	}

	@Override
	public String toString() {
		return "MenuVo [menu_idx=" + menu_idx + ", menu_title=" + menu_title + "]";
	}
	
	

}
