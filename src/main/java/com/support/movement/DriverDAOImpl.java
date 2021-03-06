package com.support.movement;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;




// Repository를 붙임으로써 DAO 클래스 임을 지정하게 되고, bean 태그로 자동 등록된다.
@Repository
public class DriverDAOImpl implements DriverDAO{
	
	// SqlSessionTemplate 객체를 생성해 속변 sqlSession 에 저장
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public DriverDTO getDriverDTO(String id) {
		DriverDTO driverDTO = this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriverDTO",id);
		return driverDTO;
	}
	@Override
	public CarDTO getDriverCarInfo(String id) {
		CarDTO carDTO =  this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriverCarInfo",id);
		return carDTO;
	}
	@Override
	public int getDriveListAllCnt(DriveSearchDTO driveSearchDTO) {
		int driveListAllCnt = this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriveListAllCnt",driveSearchDTO);
		return driveListAllCnt;
	}
	@Override
	public List<Map<String, String>> getDriveList(DriveSearchDTO driveSearchDTO) {
		 List<Map<String, String>> driveList =  this.sqlSession.selectList("com.support.movement.DriverDAO.getDriveList",driveSearchDTO);
			return driveList;
	}
	
	@Override
	public int getDriverUserReresveListAllCnt(ReserveSearchDTO reserveSearchDTO) {
		int reserveListAllCnt = this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriverUserReresveListAllCnt",reserveSearchDTO);
		return reserveListAllCnt;
	}
	
	@Override
	public List<Map<String, String>> getDriverUserReresveList(ReserveSearchDTO reserveSearchDTO) {
		List<Map<String, String>> reserveList =  this.sqlSession.selectList("com.support.movement.DriverDAO.getDriverUserReresveList",reserveSearchDTO);
		return reserveList;
	}
	@Override
	public ReviewDTO getDriverGrade(int reserve_apply_car_number) {
		ReviewDTO reviewDTO = this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriverGrade",reserve_apply_car_number);
		return reviewDTO;
		
	}
	@Override
	public List<Map<String, String>> getQnaList(QnaSearchDTO qnaSearchDTO) {
		List<Map<String, String>> qnaList= this.sqlSession.selectList("com.support.movement.UserDAO.getQnaList",qnaSearchDTO);
		return qnaList;
	}
	@Override
	public DriveHistoryDTO getDriveReg(int reserve_apply_car_number) {
		DriveHistoryDTO driveHistoryDTO = this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriveReg",reserve_apply_car_number);
		return driveHistoryDTO;
	}
	@Override
	public int getDriveChangeStatus(DriveHistoryDTO driveHistoryDTO) {
		int driveChangeStatus = this.sqlSession.update("com.support.movement.DriverDAO.getDriveChangeStatus",driveHistoryDTO);
		return driveChangeStatus;
	}
	@Override
	public int getDriveAcceptStatus(DriveHistoryDTO driveHistoryDTO) {
		int driveAcceptStatus = this.sqlSession.update("com.support.movement.DriverDAO.getDriveAcceptStatus",driveHistoryDTO);
		return driveAcceptStatus;
	}
	@Override
	public int insertDriveHistory(DriveHistoryDTO driveHistoryDTO) {
		int insertDriveHistoryCnt = this.sqlSession.update("com.support.movement.DriverDAO.insertDriveHistory",driveHistoryDTO);
		return insertDriveHistoryCnt;
	}
	@Override
	public int updateCarDistance(DriveHistoryDTO driveHistoryDTO) {
		int carDistance = this.sqlSession.update("com.support.movement.DriverDAO.updateCarDistance",driveHistoryDTO);
		return carDistance;
	}
}
