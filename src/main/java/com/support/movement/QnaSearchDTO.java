package com.support.movement;

public class QnaSearchDTO {
	private int selectPageNo;
	private String keyword;
	private int question_group_no;
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getQuestion_group_no() {
		return question_group_no;
	}
	public void setQuestion_group_no(int question_group_no) {
		this.question_group_no = question_group_no;
	}
	
}
