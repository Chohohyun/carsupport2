package com.support.movement;

import java.util.List;
import java.util.Map;

public interface UserDAO {

	int getReservationAlreadyCnt(UserReservationDTO userReservationDTO);

	int getPossibleCarCnt(UserReservationDTO userReservationDTO);

	int getReservationCheck(UserReservationDTO userReservationDTO);

	String getUserNo(String userId);

	int getUserRevListAllCnt(String id);

	List<Map<String, String>> getUserRevList(String id);

	int getUserUtilDetailListAllCnt(UtilizationSearchDTO utilizationSearchDTO);

	List<Map<String, String>> getUserUtilDetailList(UtilizationSearchDTO utilizationSearchDTO);

	UserDTO getUserDTO(String id);

	List<Map<String, String>> getDiscontentList(DiscontentSearchDTO discontentSearchDTO);

	int getDiscontentListAllCnt(DiscontentSearchDTO discontentSearchDTO);

	int insertDiscontent(DiscontentDTO discontentDTO);

	DiscontentDTO getDiscontentDTO(int discontent_no);

	int getReadcountUp(int discontent_no);

	int getDiscontentCnt(DiscontentDTO discontentDTO);

	int getDiscontentDelCnt(DiscontentDTO discontentDTO);

	int getDiscontentUpCnt(DiscontentDTO discontentDTO);

	int getDriverAcceptList(List<String> driverList);


	List<String> getDriverList(UserReservationDTO userReservationDTO);

	int getCancelReservation(Map<String, String> paramsMap);

	int getCancelAcceptList(Map<String, String> paramsMap);

	Map<String, String> getReserveInfo(int reserve_apply_car_number);

	int getReviewRegCnt(ReviewDTO reviewDTO);

	ReviewDTO getReviewInfo(int reserve_apply_car_number);

	int getReviewUpCnt(ReviewDTO reviewDTO);

	int getReviewCnt(ReviewDTO reviewDTO);

	int getReviewDelCnt(ReviewDTO reviewDTO);

	QnaDTO getQnaDTO(int question_no);

	int getQnaListAllCnt(QnaSearchDTO qnaSearchDTO);

	List<Map<String, String>> getQnaList(QnaSearchDTO qnaSearchDTO);

	int getReservationWaitCnt(UserReservationDTO userReservationDTO);

	int getUserReserveChk(UserReservationDTO userReservationDTO);


}
