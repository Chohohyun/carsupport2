package com.support.movement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class MobileServiceImpl implements MobileService {
	@Autowired
	private MobileDAO mobileDAO;
	
	@Override
	public int getLogin(Map<String, String> login) {
		int loginResult = this.mobileDAO.getLogin(login);
		return loginResult;
	}
	
	@Override
	public String getDriverId(Map<String, String> login) {
		String loginResult = this.mobileDAO.getDriverId(login);
		return loginResult;
	}
	
	@Override
	public List<Map<String, String>> getReserveList(Map<String,String> selectcode) {
		List<Map<String, String>> reserveList = this.mobileDAO.getReserveList(selectcode);
		return reserveList;
	}
	
	@Override
	public List<MobileBoardDTO> getBoardList(){
		 List<MobileBoardDTO> boardList = this.mobileDAO.getBoardList();
		 return boardList;
	}
	
	@Override
	public int getReserveRegCnt(String parameter, String select_num) {
		Map<String, String> seachRegCnt = new HashMap<String, String>();
		seachRegCnt.put("select_num", select_num);
		seachRegCnt.put("parameter", parameter);
		int reserveRegCnt = this.mobileDAO.getReserveRegCnt(seachRegCnt);
		return reserveRegCnt;
	}
	
	@Override
	public String UpdateCode(Map<String, String> update_code) {
		String reserve_state_code = update_code.get("parameter");
		if( reserve_state_code.equals("2") || reserve_state_code.equals("4") ) {
			if(reserve_state_code.equals("2")) {
				System.out.println("예약 승인");
			}
			else {
				System.out.println("예약 취소");
			}
					
			String acceptListCodeCnt = "0";
			int updateCode = this.mobileDAO.UpdateCode(update_code);
			if (updateCode>0) {
				int acceptListCode = this.mobileDAO.acceptListCode(update_code);
				acceptListCodeCnt = toString().valueOf(acceptListCode);
			}
			if(reserve_state_code.equals("4")) {
				String select_num = update_code.get("select_num");
				System.out.println("select_num" + select_num);
				
				String phone_num = this.mobileDAO.getPhoneNum(select_num);
				System.out.println("예약취소 phone :" + phone_num);
				return phone_num;
			}
			return acceptListCodeCnt;
		}
		else {
			System.out.println("예약 거절");
			int acceptListCode = 0;
			int updateCode = 0;
			String acceptListCodeCnt = "0";
			updateCode = this.mobileDAO.UpdateCode(update_code);
			if (updateCode>0) {
				
				acceptListCode = this.mobileDAO.acceptListCode(update_code);
				System.out.println("거절 acceptListCode : " + acceptListCode);
				String reserveCnt = this.mobileDAO.getReserveCnt(update_code);
				System.out.println("거절 reserveCnt : " + reserveCnt);
				
			
				if(reserveCnt.equals("0")) {
					update_code.put("parameter", "4");
					updateCode = this.mobileDAO.UpdateCode(update_code);
					acceptListCode = this.mobileDAO.acceptListCode(update_code);
					String select_num = update_code.get("select_num");
					String phone_num = this.mobileDAO.getPhoneNum(select_num);
					
					System.out.println("예약 거절 phone :" + phone_num);
					return phone_num;
				}
			}
			return acceptListCodeCnt;
		}
	}
	// 상태코드2 일때 예약시간 가져오기
	@Override
	public String getReserveDate(Map<String, String> update_code) {
		String reserveDate = this.mobileDAO.getReserveDate(update_code);
		return reserveDate;
	}
	// 중복된 시간에 본인에게 요청된 신청 존재 개수 가져오기
	@Override
	public int getDupleTimeRegCnt(String reservedate) {
		int dupleTimeRegCnt = this.mobileDAO.getDupleTimeRegCnt(reservedate);
		return dupleTimeRegCnt;
	}
	// 동일시간 요청된 예약 번호 가져오기
	@Override
	public List<Map<String, String>> getReserveNo(Map<String,String> update_code) {
		List<Map<String, String>> reserveNoArr = this.mobileDAO.getReserveNo(update_code);
		return reserveNoArr;
	}
	// 상태코드가 2일때 같은 요청시간인 나머지 거절 코드 3 업데이트
	@Override
	public int UpdateDenyCode(List<Map<String, String>> reserveNoArr) {
		int updateCnt =  this.mobileDAO.UpdateDenyCode(reserveNoArr);
		return updateCnt;
	}

	@Override
	public int DeleteCode(Map<String, String> delete_code) {
		int acceptListCode = 0;
		int deleteCode = 0;
		deleteCode = this.mobileDAO.DeleteCode(delete_code);
		if(deleteCode>0) {
			acceptListCode = this.mobileDAO.acceptListCode(delete_code);
		}		
		return acceptListCode;
	}

	@Override
	public List<MobileLoginDTO> getLoginList() {
		List<MobileLoginDTO> loginList = this.mobileDAO.getLoginList();
		return loginList;
	}
	
	@Override
	public UserDTO getUserDTO(String select_num) {
		UserDTO userDTO = this.mobileDAO.getUserDTO(select_num);
		return userDTO;
	}

	@Override
	public String getCodeStatus(String parameter_code) {
		String codeStatus = this.mobileDAO.getCodeStatus(parameter_code);
		return codeStatus;
	}

/*	@Override
	public PhoneDTO getPhoneDTO(String select_num) {
		PhoneDTO phoneDTO = this.mobileDAO.getPhoneDTO(select_num);
		return phoneDTO;
	}
	*/
	
}
