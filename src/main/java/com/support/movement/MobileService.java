package com.support.movement;

import java.util.List;
import java.util.Map;

public interface MobileService {
	
	List<MobileBoardDTO> getBoardList();
	
	List<MobileLoginDTO> getLoginList();

	String UpdateCode(Map<String, String> update_code);

	int DeleteCode(Map<String, String> delete_code);

	UserDTO getUserDTO(String select_num);

	//PhoneDTO getPhoneDTO(String select_num);

	int getLogin(Map<String, String> login);

	String getDriverId(Map<String, String> login);

	List<Map<String, String>> getReserveList(Map<String, String> selectcode);
	
}