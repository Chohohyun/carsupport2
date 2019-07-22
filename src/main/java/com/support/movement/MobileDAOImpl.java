package com.support.movement;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MobileDAOImpl implements MobileDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getLogin(Map<String, String> login) {
		int loginResult = this.sqlSession.selectOne("com.support.movement.MobileDAO.getLogin", login);
		return loginResult;
	}
	
	@Override
	public String getDriverId(Map<String, String> login) {
		String loginResult = this.sqlSession.selectOne("com.support.movement.MobileDAO.getDriverId", login);
		return loginResult;
	}
	
	@Override
	public List<Map<String, String>> getReserveList(Map<String,String> selectcode) {
		List<Map<String, String>> reserveList = this.sqlSession.selectList("com.support.movement.MobileDAO.getReserveList", selectcode);
		return reserveList;
	}
	
	
	
	@Override
	public List<MobileBoardDTO> getBoardList(){
	
		List<MobileBoardDTO> MobileBoardList = this.sqlSession.selectList("com.support.movement.MobileDAO.getBoardList");
		return MobileBoardList;
	}
	@Override
	public int UpdateCode(Map<String, String> update_code) {
		int reserveAcceptCode = this.sqlSession.update("com.support.movement.MobileDAO.UpdateCode",update_code);
		return reserveAcceptCode;
		
	}
	
	@Override
	public int acceptListCode(Map<String, String> update_code) {
		int acceptListCode = this.sqlSession.update("com.support.movement.MobileDAO.acceptListCode",update_code);
		return acceptListCode;
	}
	
	@Override
	public String getReserveCnt(Map<String, String> update_code) {
		String reserveCnt =  this.sqlSession.selectOne("com.support.movement.MobileDAO.getReserveCnt", update_code);
		return reserveCnt;
	}
	
	
	@Override
	public int DeleteCode(Map<String, String> delete_code) {
		int reserveDenyCode = this.sqlSession.update("com.support.movement.MobileDAO.DeleteCode",delete_code);
		return reserveDenyCode;
	}

	@Override
	public List<MobileLoginDTO> getLoginList() {
		List<MobileLoginDTO> MobileLoginList = this.sqlSession.selectList("com.support.movement.MobileDAO.getLoginList");
		return MobileLoginList;
	}
	
	@Override
	public UserDTO getUserDTO(String select_num) {
		UserDTO userDTO =  this.sqlSession.selectOne("com.support.movement.MobileDAO.getUserDTO", select_num);
		return userDTO;
	}
	
	@Override
	public String getPhoneNum(String select_num) {
		String phone =  this.sqlSession.selectOne("com.support.movement.MobileDAO.getPhoneNum", select_num);
		return phone;
	}
	/*
	@Override
	public PhoneDTO getPhoneDTO(String select_num) {
		PhoneDTO phoneDTO = this.sqlSession.selectOne("com.support.movement.MobileDAO.getPhoneDTO", select_num);
		return phoneDTO;
	}*/
}
