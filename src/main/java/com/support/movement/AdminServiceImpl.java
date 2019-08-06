package com.support.movement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


// 서비스 클래스인 LoginServiceImpl 클래스 선언
// 서브스 클래스에는 @Service 와 @Transcational를 붙인다.
// @Service => 서비스 클래스 임을 지정하고 bean 태그로 자동 등록된다.
// @Transactional => 서비스 클래스의 메소드 내부에서 일어나느 ㄴ모든 작업에는 트랜잭션이 걸린다.
@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	// 속성변수 loginDAO 선언하고, LoginDAO 라는 인터페이스를
	// 구현한 클래스를 객체화 하여 저장
	// **********************************************************
	// Autowired이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	// 이 인터페이를 구현한 클래스를 객체화하여 저장
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public int getAcceptListAllCnt(String id,DriverSearchDTO driverSearchDTO) {
		int acceptPermit = this.adminDAO.getAcceptPermit(id);
		if(acceptPermit==1) {
			int acceptListAllCnt = this.adminDAO.getAcceptListAllCnt(driverSearchDTO);
			return acceptListAllCnt;
		}
		else {
			return 0;
		}
	}

	@Override
	public List<Map<String, String>> getAcceptList(String id,DriverSearchDTO driverSearchDTO) {

		List<Map<String, String>> acceptList = this.adminDAO.getAcceptList(driverSearchDTO);
		return acceptList;

	}

	@Override
	public int getAcceptDriverCnt(int driver_no) {
		int acceptDriverCnt = this.adminDAO.getAcceptDriverCnt(driver_no);
		return acceptDriverCnt;
	}

	@Override
	public int getDriverRegCnt(DriverDTO driverDTO) {
		int driverRegCnt = this.adminDAO.getDriverRegCnt(driverDTO);
		return driverRegCnt;
	}

	@Override
	public int getDriverUpDelListAllCnt(String id,DriverSearchDTO driverSearchDTO) {
		int acceptPermit = this.adminDAO.getAcceptPermit(id);
		if(acceptPermit==1) {
			System.out.println("ㅇ기도?");
			int upDelListAllCnt = this.adminDAO.getDriverUpDelListAllCnt(driverSearchDTO);
			return upDelListAllCnt;
		}
		else {
			return 0;
		}
	}

	@Override
	public List<Map<String, String>> getDriverUpDelList(String id,DriverSearchDTO driverSearchDTO) {
		List<Map<String, String>> upDelList = this.adminDAO.getDriverUpDelList(driverSearchDTO);
		return upDelList;

	}

	@Override
	public DriverDTO getDriverDTO(int driver_no) {
		DriverDTO driverDTO = this.adminDAO.getDriverDTO(driver_no);
		return driverDTO;
	}

	@Override
	public int getDriverUpCnt(DriverDTO driverDTO) {
		int driverUpCnt = this.adminDAO.getDriverUpCnt(driverDTO);
		return driverUpCnt;
	}

	@Override
	public int getDriverDelCnt(DriverDTO driverDTO) {
		int carDriverDelCnt = this.adminDAO.getCarDriverDelCnt(driverDTO);
		int driverDelCnt = this.adminDAO.getDriverDelCnt(driverDTO);
		return driverDelCnt;
	}

	@Override
	public int getUserRegCnt(UserDTO userDTO) {
		int userRegCnt = this.adminDAO.getUserRegCnt(userDTO);
		return userRegCnt;
	}

	@Override
	public int getUserUpDelListAllCnt(String id,UserSearchDTO userSearchDTO) {
		int acceptPermit = this.adminDAO.getAcceptPermit(id);
		if(acceptPermit==1) {
			int upDelListAllCnt = this.adminDAO.getUserUpDelListAllCnt(userSearchDTO);
			return upDelListAllCnt;
		}
		else {
			return 0;
		}
	}

	@Override
	public List<Map<String, String>> getUserUpDelList(String id,UserSearchDTO userSearchDTO) {
		List<Map<String, String>> upDelList = this.adminDAO.getUserUpDelList(userSearchDTO);
		return upDelList;
	}

	@Override
	public UserDTO getUserDTO(int user_no) {
		UserDTO userDTO = this.adminDAO.getUserDTO(user_no);
		return userDTO;
	}

	@Override
	public int getUserUpCnt(UserDTO userDTO) {
		int userUpCnt = this.adminDAO.getUserUpCnt(userDTO);
		return userUpCnt;
	}

	@Override
	public int getUserDelCnt(UserDTO userDTO) {
		int userDelCnt = this.adminDAO.getUserDelCnt(userDTO);
		return userDelCnt;
	}

	@Override
	public List<Map<String, String>> getDriverList() {
		List<Map<String, String>> driverList = this.adminDAO.getDriverList();
		return driverList;
	}

	@Override
	public int getCarRegCnt(CarDTO carDTO) {
		int checkCarNumber = this.adminDAO.getCheckCarNumber(carDTO);
		if(checkCarNumber>=1) {
			return -2;
		}
		int carRegCnt = this.adminDAO.getCarRegCnt(carDTO);
		return carRegCnt;
	}

	@Override
	public int getCarListAllCnt(CarSearchDTO carSearchDTO) {
		int carRegCnt = this.adminDAO.getCarListAllCnt(carSearchDTO);
		return carRegCnt;
	}

	@Override
	public List<Map<String, String>> getCarList(CarSearchDTO carSearchDTO) {
		List<Map<String, String>> carList = this.adminDAO.getCarList(carSearchDTO);
		return carList;
	}

	@Override
	public CarDTO getCarDTO(int car_info_no) {
		CarDTO carDTO = this.adminDAO.getCarDTO(car_info_no);
		return carDTO;
	}

	@Override
	public int getCarUpdateCnt(CarDTO carDTO) {
		int checkCarNumber = this.adminDAO.getCheckUpdateCarNumber(carDTO);
		if(checkCarNumber>=1) {
			return -2;
		}
		int carUpdateCnt = this.adminDAO.getCarUpdateCnt(carDTO);
		return carUpdateCnt;
	}

	@Override
	public int getCarDeleteCnt(int car_info_no) {
		int carDeleteCnt = this.adminDAO.getCarDeleteCnt(car_info_no);
		return carDeleteCnt;
	}

	@Override
	public int getCarMaintanceRegCnt(CarMaintanceDTO carMaintanceDTO) {
		int carMaintanceRegCnt = this.adminDAO.getCarMaintanceRegCnt(carMaintanceDTO);
		return carMaintanceRegCnt;
	}

	@Override
	public int getCarMaintanceListAllCnt(CarSearchDTO carSearchDTO) {
		int carMaintanceListAllCnt = this.adminDAO.getCarMaintanceListAllCnt(carSearchDTO);
		return carMaintanceListAllCnt;
	}

	@Override
	public List<Map<String, String>> getCarMaintanceList(CarSearchDTO carSearchDTO) {
		List<Map<String, String>> carMaintanceList = this.adminDAO.getCarMaintanceList(carSearchDTO);
		return carMaintanceList;
	}

	@Override
	public CarMaintanceDTO getCarMaintanceDTO(int car_maintance_info_no) {
		CarMaintanceDTO carMaintanceDTO = this.adminDAO.getCarMaintanceDTO(car_maintance_info_no);
		return carMaintanceDTO;
	}

	@Override
	public int getCarMaintanceUpdateCnt(CarMaintanceDTO carMaintanceDTO) {
		int carMaintanceUpdateCnt = this.adminDAO.getCarMaintanceUpdateCnt(carMaintanceDTO);
		return carMaintanceUpdateCnt;
	}

	@Override
	public int getCarMaintancDeleteCnt(int car_maintance_info_no) {
		int carMaintanceDeleteCnt = this.adminDAO.getCarMaintancDeleteCnt(car_maintance_info_no);
		return carMaintanceDeleteCnt;
	}

	// QnA 게시판 목록 가져오는 메소드
	@Override
	public List<Map<String, String>> getQnaList(int question_group_no) {
		List<Map<String,String>> qnaList = this.adminDAO.getQnaList(question_group_no);
		return qnaList;
	}


	// QnA 게시판 글 입력 후 성공여부 확인하는 메소드
	@Override
	public int insertQna(QnaDTO qnaDTO) {

		int qnaRegCnt = this.adminDAO.insertQna(qnaDTO);
		return qnaRegCnt;
	}


	@Override
	public QnaDTO getQnaDTO(int question_no) {

		QnaDTO qnaDTO = this.adminDAO.getQnaDTO(  question_no );
		return qnaDTO;
	}

	@Override
	public int updateQna(QnaDTO qnaDTO) {

		// 수정할 [게시판] 글을 지금 누군가 삭제했다면 -1 리턴
		int boardCnt = this.adminDAO.getBoardCnt(qnaDTO);
		if(boardCnt == 0) { return -1;}

		int updateCnt = this.adminDAO.updateQna(qnaDTO);
		// System.out.println(updateCnt); 오류 확인시 코드
		// 게시판 수정 명령 후 수정한 적용 행의 개수 리턴하기
		return updateCnt;
	}

	@Override
	public int deleteQna(QnaDTO qnaDTO) {
		// 수정할 [게시판] 글을 지금 누군가 삭제했다면 -1 리턴
		int boardCnt = this.adminDAO.getBoardCnt(qnaDTO);
		if(boardCnt == 0) { return -1;}

		int deleteCnt = this.adminDAO.deleteQna(qnaDTO);
		return deleteCnt;
	}

	@Override
	public int getAdminDiscontentListAllCnt(DiscontentSearchDTO discontentSearchDTO) {
		int adminDiscontentListAllCnt = this.adminDAO.getAdminDiscontentListAllCnt(discontentSearchDTO);
		return adminDiscontentListAllCnt;
	}

	@Override
	public List<Map<String, String>> getAdminDiscontentList(DiscontentSearchDTO discontentSearchDTO) {
		List<Map<String,String>> adminDiscontentList = this.adminDAO.getAdminDiscontentList(discontentSearchDTO);
		// System.out.println("서비스까지 오나");
		return adminDiscontentList;
	}

	@Override
	public DiscontentDTO getDiscontentDTO(int adminDiscontent_no) {
		int readcountUpCnt = this.adminDAO.getReadcountUp(adminDiscontent_no);

		DiscontentDTO discontentDTO = this.adminDAO.getDiscontentDTO(adminDiscontent_no);
		return discontentDTO;
	}

	@Override
	public int insertAdminDiscontent(DiscontentDTO discontentDTO) {

		String discontent_no = discontentDTO.getDiscontent_no();
		
		if( discontent_no != null && discontent_no.length() > 0 ) {
			// 출력 순서 번호를 1증가 시키고 수정행의 적용 개수를 리턴
			// 새롭게 게시판 글이 입력된 후 이후의 글들은 출력 순서 번호를 1씩 증가
			int updatePrint_noCnt = this.adminDAO.updatePrint_no(discontentDTO);
		}
		
		// 한개 게시판 글 입력 후 입력 적용 행의 개수 리턴하기
		int DiscontentRegCnt = this.adminDAO.insertAdminDiscontent(discontentDTO);
		return DiscontentRegCnt;
	}

	@Override
	public int getDiscontentUpCnt(DiscontentDTO discontentDTO) {
		int deleteCnt = this.adminDAO.getDiscontentCnt(discontentDTO);
		
		if(deleteCnt ==0) {
			return -1;
		}
		else {
			int discontentUpCnt = this.adminDAO.getDiscontentUpCnt(discontentDTO);
			return discontentUpCnt;
		}
	}

	@Override
	public int getDiscontentDelCnt(DiscontentDTO discontentDTO) {
		int deleteCnt = this.adminDAO.getDiscontentCnt(discontentDTO);
		if(deleteCnt ==0) {
			return -1;
		}
		else {
			int discontentDelCnt = this.adminDAO.getDiscontentDelCnt(discontentDTO);
			return discontentDelCnt;
		}
	}

	@Override
	public int getGroupCnt(Map<String, String> paramsMap) {
		int groupCnt = this.adminDAO.getGroupCnt(paramsMap);
		return groupCnt;
	}

	@Override
	public int getRefuseDriverCnt(int driver_no) {
		int refuseDriverCnt = this.adminDAO.getRefuseDriverCnt(driver_no);
		return refuseDriverCnt;
	}

	@Override
	public List<Map<String, String>> getCarList() {
		 List<Map<String, String>> carList = this.adminDAO.getCarList();
		 return carList;
	}

	
	//************************************************************************************
	// 통꼐
	//************************************************************************************
	@Override
	public List<Map<String, String>> getCarCount() {
		List<Map<String, String>> carCount = this.adminDAO.getCarCount();
		return carCount;
	}

	@Override
	public int getCarMainTanceCnt() {
		int carMainTanceCnt = this.adminDAO.getCarMainTanceCnt();
		return carMainTanceCnt;
	}

	@Override
	public List<Map<String, String>> getRepairStatus(String repairYear) {
		List<Map<String, String>> repairStatus = this.adminDAO.getRepairStatus(repairYear);
		return repairStatus;
	}

	@Override
	public List<Map<String, String>> getCarSelectList(String repairYear) {
		List<Map<String, String>> getCarSelectList = this.adminDAO.getCarSelectList(repairYear);
				return getCarSelectList;
	}

	@Override
	public List<Map<String, String>> getCarTypeStatus(String carTypeYear) {
		List<Map<String, String>> carTypeStatus = this.adminDAO.getCarTypeStatus(carTypeYear);
				return carTypeStatus;
	}

	@Override
	public List<Map<String, String>> getRepairCodeStatus(String car_number) {
		List<Map<String, String>> repairCodeStatus = this.adminDAO.getRepairCodeStatus(car_number);
				return repairCodeStatus;
	}

	@Override
	public List<Map<String, String>> getCarInfoList(Map<String, String> sort) {
		List<Map<String, String>> carInfoList = this.adminDAO.getCarInfoList(sort);
				return carInfoList;
	}

	@Override
	public List<Map<String, String>> getDriverTotalCount() {
		List<Map<String, String>> driverTotalCount = this.adminDAO.getDriverTotalCount();
				return driverTotalCount;
	}

	@Override
	public int getDriveCount() {
		int driveCount = this.adminDAO.getDriveCount();
		return driveCount;
	}

	@Override
	public List<Map<String, String>> getDriveHistoryStatus(String driveYear) {
		List<Map<String, String>> driveHistoryStatus = this.adminDAO.getDriveHistoryStatus(driveYear);
				return driveHistoryStatus;
	}

	@Override
	public List<Map<String, String>> getDriverGenderCount(String driverYear) {
		List<Map<String, String>> driverGenderCount = this.adminDAO.getDriverGenderCount(driverYear);
				return driverGenderCount;
	}

	@Override
	public List<Map<String, String>> getDriverReserveStatics(String reserveYear) {
		List<Map<String, String>> driverReserveStatics = this.adminDAO.getDriverReserveStatics(reserveYear);
				return driverReserveStatics;
	}

	@Override
	public List<Map<String, String>> getStatusDriverList(Map<String, String> sort) {
		List<Map<String, String>> statusDriverList = this.adminDAO.getStatusDriverList(sort);
				return statusDriverList;
	}

	@Override
	public List<Map<String, String>> getUserTotalCount() {
		List<Map<String, String>> userTotalCount = this.adminDAO.getUserTotalCount();
				return userTotalCount;
	}

	@Override
	public int getUserReserveCount() {
		int userReserveCount = this.adminDAO.getUserReserveCount();
		return userReserveCount;
	}

	@Override
	public List<Map<String, String>> getUserReserveStatus(String reserveYear) {
		List<Map<String, String>> userReserveStatus = this.adminDAO.getUserReserveStatus(reserveYear);
				return userReserveStatus;
	}

	@Override
	public List<Map<String, String>> getUserGenderCount(String userYear) {
		List<Map<String, String>> userGenderCount = this.adminDAO.getUserGenderCount(userYear);
				return userGenderCount;
	}

	@Override
	public List<Map<String, String>> getUserReserveStatics(String userReserveYear) {
		List<Map<String, String>> userReserveStatics = this.adminDAO.getUserReserveStatics(userReserveYear);
				return userReserveStatics;
	}

	@Override
	public List<Map<String, String>> getStatusUserList(Map<String, String> sort) {
		List<Map<String, String>> statusUserList = this.adminDAO.getStatusUserList(sort);
				return statusUserList;
	}

	@Override
	public List<Map<String, String>> getCarRepairInfoList() {
		List<Map<String, String>> carRepairInfoList = this.adminDAO.getCarRepairInfoList();
				return carRepairInfoList;
	}

	@Override
	public List<Map<String, String>> getDriverAcceptList() {
		List<Map<String, String>> driverAcceptList = this.adminDAO.getDriverAcceptList();
				return driverAcceptList;
	}

	@Override
	public List<Map<String, String>> getReservationStatus() {
		List<Map<String, String>> reservationStatus = this.adminDAO.getReservationStatus();
				return reservationStatus;
	}

	@Override
	public List<Map<String, String>> getUserCarTypeStatus(String userCarTypeYear) {
		List<Map<String, String>> userCarTypeStatus = this.adminDAO.getUserCarTypeStatus(userCarTypeYear);
				return userCarTypeStatus;
	}

	@Override
	public List<Map<String, String>> getRegCarTypeStatus(String regCarTypeYear) {
		List<Map<String, String>> regCarTypeStatus = this.adminDAO.getRegCarTypeStatus(regCarTypeYear);
		return regCarTypeStatus;
	}

	@Override
	public List<Map<String, String>> getUserGenderStatus(String userGenderYear) {
		List<Map<String, String>> userGenderStatus = this.adminDAO.getUserGenderStatus(userGenderYear);
		return userGenderStatus;
	}

	@Override
	public List<Map<String, String>> getDriverGenderStatus(String driverGenderYear) {
		List<Map<String, String>> driverGenderStatus = this.adminDAO.getDriverGenderStatus(driverGenderYear);
		return driverGenderStatus;
	}

}
