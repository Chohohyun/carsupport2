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
public class DriverServiceImpl implements DriverService{
	// 속성변수 loginDAO 선언하고, LoginDAO 라는 인터페이스를
	// 구현한 클래스를 객체화 하여 저장
	// **********************************************************
	// Autowired이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	// 이 인터페이를 구현한 클래스를 객체화하여 저장
	@Autowired
	private DriverDAO driverDAO;

	
	@Override
	public DriverDTO getDriverDTO(String id) {
		DriverDTO driverDTO = this.driverDAO.getDriverDTO(id);
		return driverDTO;
	}

	@Override
	public CarDTO getDriverCarInfo(String id) {
		CarDTO carDTO =  this.driverDAO.getDriverCarInfo(id);
		return carDTO;
	}

	@Override
	public int getDriveListAllCnt(DriveSearchDTO driveSearchDTO) {
		int driveListAllCnt = this.driverDAO.getDriveListAllCnt(driveSearchDTO);
		return driveListAllCnt;
	}

	@Override
	public List<Map<String, String>> getDriveList(DriveSearchDTO driveSearchDTO) {
		List<Map<String, String>> driveList = this.driverDAO.getDriveList(driveSearchDTO);
		return driveList;
	}
	
	@Override
	public int getDriverUserReresveListAllCnt(ReserveSearchDTO reserveSearchDTO) {
		int reserveListAllCnt = this.driverDAO.getDriverUserReresveListAllCnt(reserveSearchDTO);
		return reserveListAllCnt;
	}
	
	@Override
	public List<Map<String, String>> getDriverUserReresveList(ReserveSearchDTO reserveSearchDTO) {
		List<Map<String, String>> reserveList = this.driverDAO.getDriverUserReresveList(reserveSearchDTO);
		return reserveList;
	}

	@Override
	public ReviewDTO getDriverGrade(int reserve_apply_car_number) {
		ReviewDTO reviewDTO = this.driverDAO.getDriverGrade(reserve_apply_car_number);
		return reviewDTO;
		
	}

	@Override
	public List<Map<String, String>> getQnaList(QnaSearchDTO qnaSearchDTO) {
		List<Map<String, String>> qnaList = this.driverDAO.getQnaList(qnaSearchDTO);
		
		return qnaList;
	}

	@Override
	public DriveHistoryDTO getDriveReg(int reserve_apply_car_number) {
		DriveHistoryDTO driveHistoryDTO = this.driverDAO.getDriveReg(reserve_apply_car_number);
		return driveHistoryDTO;
	}

	@Override
	public int insertDriveHistory(DriveHistoryDTO driveHistoryDTO) {
		System.out.println("1");
		int driveChangeStatusCnt = this.driverDAO.getDriveChangeStatus(driveHistoryDTO);
		System.out.println("2");
		int driveAcceptStatusCnt = this.driverDAO.getDriveAcceptStatus(driveHistoryDTO);
		System.out.println("3");
		int carDistance = this.driverDAO.updateCarDistance(driveHistoryDTO);
		int insertDriveHistoryCnt = this.driverDAO.insertDriveHistory(driveHistoryDTO);
		return insertDriveHistoryCnt;
	}

}
