package com.support.movement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


// 깃허브 테스트합니다.
// 기섷브 테스트 2

// 깃 허브테스트343332432432141234
// 가상 URL 주소로 접속하면 호출되는 메소드를 소유한 컨트롤러 클래스 선언
// @Controller 를 붙임으로써 컨트롤러 클래스임을 지정한다.
@Controller
public class DriverController {
	// 속성변수 loginService 선언하고, LoginService라는 인터페이스를 구현한 클래스를 객체화하여 저장
	// *****************************************************
	// @Autowired 이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	//  이 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	// LoginService라는 인터페이스를 구현한 클래스의 이름을 몰라도 관계없다. 1개 존재하기만 하면 된다.

	@Autowired
	private DriverService driverService;

	//**********************************
	// 운전자가 로그인하면 이동하는 페이지
	//**********************************
	@RequestMapping(value="/driverMainPage.do")
	public ModelAndView driverMain(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session,QnaSearchDTO qnaSearchDTO) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();

		qnaSearchDTO.setSelectPageNo(1);
		qnaSearchDTO.setQuestion_group_no(1);
		
		List<Map<String,String>> qnaList = this.driverService.getQnaList(qnaSearchDTO);
		//------------------------------------------------------------------
		// ModelAndView 객체에  검색 개수, 게시판 검색 목록 저장하기
		// ModelAndView 객체에 addObject 메소드로 저장된 것은
		// 추후 HttpServletRequest 객체에 setAttribute 메소드 호출로 다시 재저장 된다
		mav.addObject("qnaList", qnaList);

		mav.setViewName("driverMainPage.jsp");
		return mav;
	}

	//**********************************
	// Driver가 차량정보 누르면 차량정보 form양식으로 이동
	//**********************************

	@RequestMapping(value="/driverCarInfo.do")
	public ModelAndView driverCarInfo(

			HttpSession session) {

		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();

		CarDTO carDTO = this.driverService.getDriverCarInfo(id);

		mav.addObject("carDTO",carDTO);
		mav.setViewName("driverCarInfoUpDelForm.jsp");
		return mav;
	}

	//**********************************
	// Driver가 주행기록 누르면 신청 form양식으로 이동
	//**********************************
	@RequestMapping(
			value="/driveHistory.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView driverHistory(
			HttpSession session, HttpServletResponse response,
			DriveSearchDTO driveSearchDTO
			){
		String id = (String) session.getAttribute("id");
		if(driveSearchDTO.getSelectPageNo()==0){
			driveSearchDTO.setSelectPageNo(1);
			
		}
		driveSearchDTO.setId(id);
		List<Map<String,String>> driveList = new ArrayList<Map<String,String>>();

		ModelAndView mav = new ModelAndView();

		int driveListAllCnt = 0;


		try {
			driveListAllCnt = this.driverService.getDriveListAllCnt(driveSearchDTO);
			int lastPageNo = driveListAllCnt / 5;
			if( driveListAllCnt % 5>0) {
				lastPageNo++;
			}
			if( lastPageNo < driveSearchDTO.getSelectPageNo() ){

				
				driveSearchDTO.setSelectPageNo(1);
			}
			System.out.println(driveListAllCnt);
			if(driveListAllCnt>0) {
				driveList= this.driverService.getDriveList(driveSearchDTO);
			}
		
			mav.addObject("driveSearchDTO",driveSearchDTO);
			mav.addObject("driveListAllCnt",driveListAllCnt);
			mav.addObject("driveList",driveList);
		} catch (Exception e) {

		}


		mav.setViewName("driveListForm.jsp");
		return mav;
	}
	//**********************************
	// Driver가 주행기록에서 리뷰 버튼 누르면 리뷰form양식으로 이동
	//**********************************
	/*
	@RequestMapping(value="/reviewRegForm.do")
	public ModelAndView reviewRegForm(
			HttpSession session, String reserve_apply_car_number ) {

		ModelAndView mav = new ModelAndView();
		System.out.println("reserve_apply_car_number:" + reserve_apply_car_number);
		ReviewDTO reviewDTO = this.driverService.getReviewDTO(reserve_apply_car_number);
		mav.addObject("reviewDTO",reviewDTO);
		System.out.println("userReservationDT : " + reviewDTO.getDriver_name());
		mav.setViewName("reviewForm.jsp");
		return mav;

	}
	 */


	//**********************************
	// 운전자가 예약현황을 볼 수 있는 페이지 
	//**********************************
	@RequestMapping(
			value="/driverReservationSituation.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView driverReservationSituation(
			HttpSession session, HttpServletResponse response,
			ReserveSearchDTO reserveSearchDTO
			){
		if(reserveSearchDTO.getSelectPageNo()==0) {
			reserveSearchDTO.setSelectPageNo(1);
		}
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");

		reserveSearchDTO.setId(id);
		int reserveListAllCnt = 0;

		List<Map<String,String>> reserveList = new ArrayList<Map<String,String>>();
		reserveListAllCnt = this.driverService.getDriverUserReresveListAllCnt(reserveSearchDTO);	
		int lastPageNo = reserveListAllCnt / 5;
		if( reserveListAllCnt % 5>0) {
			lastPageNo++;
		}
		if( lastPageNo < reserveSearchDTO.getSelectPageNo() ){

			
			reserveSearchDTO.setSelectPageNo(1);
		}
		if(reserveListAllCnt>0) {
			reserveList = this.driverService.getDriverUserReresveList(reserveSearchDTO);
		}
		mav.addObject("reserveSearchDTO",reserveSearchDTO);
		mav.addObject("reserveListAllCnt", reserveListAllCnt);
		mav.addObject("reserveList", reserveList);
		mav.setViewName("driverUserReserveForm.jsp");
		return mav;
	}

	//**********************************
	// 운전자가 자기 회원정보를 볼 수 있는 페이지 
	//**********************************
	@RequestMapping(value="/driverUpDelForm2.do")
	public ModelAndView driverUpDelForm2(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("driverUpDelForm2.jsp");

		try {
			String id = (String) session.getAttribute("id");
			System.out.println(id);
			DriverDTO driverDTO = this.driverService.getDriverDTO(id); 

			mav.addObject("driverDTO",driverDTO);


		}catch (Exception e) {
			System.out.println("driverUpDelForm2을 불러오는 도중 오류");
		}
		return mav;
	}

	@RequestMapping(value="/driverGradeForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView driverGradeForm( 
			@RequestParam(value="reserve_apply_car_number") int reserve_apply_car_number, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("driverGradeForm.jsp"); 
		try { 
			System.out.println(reserve_apply_car_number);
			System.out.println("g하이");
			
			ReviewDTO reviewDTO = this.driverService.getDriverGrade(reserve_apply_car_number);
			mav.addObject("reviewDTO",reviewDTO);
		}catch(Exception e){ 
			System.out.println("UserController.reviewRegForm(~) 메소드 예외 발생"); 
		} 
		return mav; 
	} 
	
	@RequestMapping(value="/driveRegForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView driveRegForm( 
			@RequestParam(value="reserve_apply_car_number") int reserve_apply_car_number, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("driveRegForm.jsp"); 
		try { 
			System.out.println(reserve_apply_car_number);
			System.out.println("g하이");
			
			DriveHistoryDTO driveHistoryDTO = this.driverService.getDriveReg(reserve_apply_car_number);
			mav.addObject("driveHistoryDTO",driveHistoryDTO);
		}catch(Exception e){ 
			System.out.println("DriverController.driveRegForm(~) 메소드 예외 발생"); 
		} 
		return mav; 
	} 
	
	@RequestMapping(
			value="/driveHistoryRegProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int reviewRegProc(
			DriveHistoryDTO driveHistoryDTO,
			HttpSession session
			) {
		// 메소드 첫 줄에 도스창 찍는 명령어 안되면 매개변수 쪽으로 들어오다가 오류 발생 한 것
		System.out.println("driveHistory 메소드 시작. driveHistoryDTO 이상없음");


		int reviewRegCnt = 0;
		try {
			System.out.println(driveHistoryDTO.getReserve_apply_car_number());
			System.out.println(driveHistoryDTO.getDrive_distance());
			System.out.println(driveHistoryDTO.getDrive_start_time());
			System.out.println(driveHistoryDTO.getDrive_finish_time());
			reviewRegCnt = this.driverService.insertDriveHistory(driveHistoryDTO);
			System.out.println("에러 테스트3");

		} catch(Exception e) {
			System.out.println("reviewRegProc 메소드에서 에러발생!");
			reviewRegCnt = -1;
		}
		//
		return reviewRegCnt;
	}
}
