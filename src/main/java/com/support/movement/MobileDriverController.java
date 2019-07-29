package com.support.movement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MobileDriverController {
	
	@Autowired
	private MobileService mobileService;
	//String check="예약";
	// ====================================================
	// ID, PASS 로그인 시도 및 성공여부 및 DriverID 전달
	// ====================================================
	@RequestMapping(value="/MobileLogin.do")
	public @ResponseBody Map<String,String> login(
			String id, String pwd, HttpSession session
	) {
		session.invalidate();
		System.out.println("로그인");
		Map<String,String> login = new HashMap<String,String>();
		login.put("id", id);
		login.put("pwd", pwd);
		
		
		int loginCnt = mobileService.getLogin(login);
		System.out.println("loginCnt"+ loginCnt);
		
		Map<String,String> loginResult = new HashMap<String,String>();
		
		if(loginCnt==1) {
			String loginCount = toString().valueOf(loginCnt);
			
			loginResult.put("loginCnt", loginCount );
			
			String driver_id = mobileService.getDriverId(login);
			System.out.println("driver_id"+ driver_id);
			loginResult.put("driver_no", driver_id );
			return loginResult;
		}
		else {
			loginResult.put("loginCnt", "0" );
			loginResult.put("driver_no", "-1" );
			return loginResult;
		}
	}
	
	// ====================================================
	// driver_no 받아서 신청현황 리스트 넘기기
	// ====================================================
	@RequestMapping(value="/reserveList.do")
	public @ResponseBody List<Map<String,String>> reserveList(
			String driver_no, String status_code
	) {
		System.out.println("신청현황리스트");
		System.out.println("driver_no"+ driver_no);
		List<Map<String,String>> reserveList = new ArrayList<Map<String,String>>();
		Map<String,String> selectcode = new HashMap<String,String>();
		selectcode.put("driver_no", driver_no);
		selectcode.put("status_code", status_code);
		reserveList = mobileService.getReserveList(selectcode);

		return reserveList;
		
	}
	
	// ====================================================
	// 신청현황 리스트의 승인을 눌러 예약상태코드를 2로 변경하여 예약현황으로 이동
	// 신청현황 거절을 눌러 상태코드 3 으로 전송하여 리스트에서 제외
	// 예약현황에서 예약상태코드를 4 로 전송하여 리스트에서 제외
	// ====================================================
	List<Map<String,String>> resultArr = new ArrayList<Map<String,String>>();
	Map<String,String> cansleResult = new HashMap<String,String>();
	
	@RequestMapping(value="/reserveChangeCode.do")
	@ResponseBody 
	public List<Map<String,String>> androidList(
			String parameter, String select_num, String driver_no, HttpSession session
	) {
		// parameter 상태코드 , select_num 선택목록
		System.out.println(parameter+""+select_num);
		System.out.println("driver_no: " + driver_no);
		//System.out.println("check" + check);
		// 예약상태코드가 2 ,3 ,4일 경우 중복여부를 확인하여 (이미 상태코드가 2,4일경우) 중복 일경우 리턴
		if(parameter.equals("2") ||  parameter.equals("3") || parameter.equals("4") ) {
			int reserveRegCnt = mobileService.getReserveRegCnt(parameter, select_num);
			System.out.println("중복체크");
			System.out.println("reserveRegCnt" + reserveRegCnt);
			if(reserveRegCnt>0) {
				System.out.println("중복임");
				cansleResult.put("reserve", "true");
				cansleResult.put("phone_num", "0");
				resultArr.add(cansleResult);
				return resultArr; 
			}
		}
		
		System.out.println("중복아님");
		String phone_num;
		ModelAndView mav = new ModelAndView();
		Map<String,String> update_code = new HashMap<String,String>();
		update_code.put("parameter", parameter);
		update_code.put("select_num", select_num);
		update_code.put("driver_no", driver_no);
		//**********************************************
		// 예약 상태 코드 업데이트
		//**********************************************
		String phone = mobileService.UpdateCode(update_code);
		System.out.println("phone_num :" + phone);
		
		
		// 예약상태코드가 2이고 중복여부를 확인하여 중복일아닐경우
		// 정상예약상태일경우
		if(parameter.equals("2")) {
				
			// 예약시간 가져오기
			String reservedate = mobileService.getReserveDate(update_code);
			System.out.println("reservedate :" + reservedate);
			// 중복된 예약시간 존재 개수 가져오기
			int dupletimeRegCnt = mobileService.getDupleTimeRegCnt(reservedate);
			System.out.println("dupletimeRegCnt" + dupletimeRegCnt);
			// 중복된 예약시간 존재하면
			if(dupletimeRegCnt>0) {
				List<Map<String,String>> reserveNoArr = new ArrayList<Map<String,String>>();
				// 본인한테 요청되고 시간이 같은 상태코드가 1인 예약그룹 넘버 가져오기  (예약한 것 이외의 동일시간 선택번호)
				update_code.put("reservedate", reservedate);
				reserveNoArr = mobileService.getReserveNo(update_code);
				reserveNoArr.add(update_code);
				System.out.println("reserveNoArr" + reserveNoArr);
				// 예약상태코드 3으로 업데이트 및 카운트-1 업데이트
				int updateCnt = mobileService.UpdateDenyCode(reserveNoArr);
				System.out.println(updateCnt);
				
				//해당 예약번호의 상태코드가 1이고 카운트 0 일경우 전화번호 리턴 아닐경우 존재개수 0 리턴
				//차량대수에 맞춰서 신청가능한데 예약버튼으로 인하여 나머지 것들 중에서 전화번호 필요한 경우가 있는지 확인 필요?
				int reserveCntZero = mobileService.getReserveCntZero(update_code);
				System.out.println("카운트 0 또는 전화번호 :" + reserveCntZero);
				if(reserveCntZero!=0) {
					phone = toString().valueOf(reserveCntZero);
					cansleResult.put("phone_num", phone );
					cansleResult.put("reserve", "false");
					resultArr.add(cansleResult);
					return resultArr;
				}
				else {
					cansleResult.put("phone_num", "1");
					cansleResult.put("reserve", "false");
					resultArr.add(cansleResult);
					return resultArr;
				}
			}
				
				// 예약카운트가 0인 존재개수 가져오기
				//int reserveCntZero = mobileService.getReserveCntZero();
				// 만약 카운트 0인 예약넘버가 있으면
				/*if(reserveCntZero>0) {
					// 예약카운트 0인 예약넘버 가져오기
					update_code.put("zeroCnt", "0");
					List<Map<String,String>> cntZeroReserveNo = new ArrayList<Map<String,String>>();
					cntZeroReserveNo = mobileService.getCntZeroReserveNo(update_code);
					System.out.println("카운트0인 예약번호 : " +  cntZeroReserveNo);
					// 카운트 0이고 본인에게 요청되고 요청 시간이 같은 예약번호그룹의 상태코드를 4로 업데이트
					int canSleCnt = 0;
					update_code.put("parameter", "4");
					cntZeroReserveNo.add(update_code);
					canSleCnt = mobileService.updateCancleAccepListCode(cntZeroReserveNo);
					System.out.println("카운트0인 예약번호 상태코드 4: 업데이트완료");
					if(canSleCnt>0) {
						// 예약상태코드가 4고 본인에게 요청되고 예약시간이 같고 카운트가0인 예약 유저의 휴대폰 번호를 가져오기 
						
						resultArr = mobileService.getUserPhoneArr(cntZeroReserveNo);
						System.out.println("resultArr" + resultArr);	
						return resultArr;
					}
					else {
						System.out.println("폰넘버 가져오기 실패");
					}
					
				}
				else {
					System.out.println("상태코드 4 업데이트 실패");
				}
			}*/
			cansleResult.put("phone_num", "1");
			cansleResult.put("reserve", "false");
			resultArr.add(cansleResult);
			//return null;
		}
		
		// 예약상태코드가 3이고 해당차량 모든 운전자가 거절한 경우
		// 고객폰번호를 리턴
		if(parameter.equals("3")) {
			if(phone!=null && phone.length()>10) {
				cansleResult.put("phone_num", phone);
				cansleResult.put("reserve", "false");
				resultArr.add(cansleResult);
			}
			// 예약상태코드가 3이고 해당차량 1명의 운전자가  예약거절할경우
			else {
				cansleResult.put("phone_num", "2");
				cansleResult.put("reserve", "false");
				resultArr.add(cansleResult);
			}
		}
		
		// 약상태코드가 4이고 예약을 한 후 예약취소를 할 경우
		// 다른 사용자도 예약 못하게 true 리턴
		if(parameter.equals("4")) {
			cansleResult.put("phone_num", phone);
			cansleResult.put("reserve", "false");
			resultArr.add(cansleResult);
		}

		//--------------------------------------------------------------------
		return resultArr;
	}
	
	
	//===================================================
	// 네비 안내시작 버튼 클릭시 start_time 기록
	//===================================================
	@RequestMapping(value="/startTime.do")
	public @ResponseBody Map<String,String> startTime(
			String parameter, String select_num, String start_time
	) {
		System.out.println("주행안내시작");
		
		Map<String,String> update_code = new HashMap<String,String>();
		update_code.put("parameter", parameter);
		update_code.put("select_num", select_num);
		update_code.put("start_time", start_time);
		
		// 예약상태여부 체크하기
		if(parameter.equals("2")) {	
			String item = mobileService.getCodeStatus(update_code);
			if(item.equals("4")) {
				update_code.put("code", "4");
				return update_code; 
			}
		}

		String items = mobileService.UpdateCode(update_code);
		update_code.put("code", "2");
		return update_code;
	}

	// ====================================================		
	// 주행완료 시 완료 버튼을 누르면 상태코드 5로 변경하여 DB 기록
	// 네비 주행종료 버튼 클릭시 endtime 기록
	// ====================================================
	@SuppressWarnings("unused")
	@RequestMapping(value="/DriveFinishCode.do")
	public @ResponseBody String deleteList(
			String parameter, String select_num, String endtime, String distance1, String distance2
	) {
		System.out.println("주행완료 실행");
		Map<String,String> delete_code = new HashMap<String,String>();
		System.out.println("endtime : " + endtime);
		System.out.println("parameter : " + parameter);
		System.out.println("end_driver: " + select_num);
		
		System.out.println("Distance1 : 현재위치에서 출발위치까지 거리 " + distance1 +"M 입니다.");
		System.out.println("Distance2 : 출발지부터 도착지까지 거리 " + distance2 +"M 입니다.");
		int distance = Integer.parseInt(distance1)+Integer.parseInt(distance2);
		String drive_distance = String.valueOf(distance);
		System.out.println("총거리 : " + drive_distance);
		
		delete_code.put("parameter", parameter);
		delete_code.put("select_num", select_num);
		delete_code.put("endtime", endtime);
		delete_code.put("drive_distance", drive_distance );
		
		int items = mobileService.DeleteCode(delete_code);
	
		return null;
	}
	
	
	
	
	// ====================================================
	// 예약테이블에서 컬럼값을 모바일로 전달
	// ====================================================
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/reserveListForm.do",produces="application/json;charset=utf-8")
    public @ResponseBody JSONObject json( ){
	
	
        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        List<MobileBoardDTO> items =mobileService.getBoardList( );
       
        JSONArray jArray = new JSONArray(); // json배열
        for(int i=0; i<items.size(); i++){
            MobileBoardDTO dto = items.get(i);
            JSONObject row = new JSONObject();
            // json객체.put("변수명",값)
            row.put("reserve_apply_car_number", dto.getReserve_apply_car_number());
            row.put("reservetion_date", dto.getReservetion_date());
            row.put("start_point_longitude", dto.getStart_point_longitude());
            row.put("start_point_latitude", dto.getStart_point_latitude());
            row.put("end_point_longitude", dto.getEnd_point_longitude());
            row.put("end_point_latitude", dto.getEnd_point_latitude());
            row.put("car_number", dto.getCar_number());
            row.put("driver_no", dto.getDriver_no());
            row.put("user_no", dto.getUser_no());
            row.put("start_road_addr",dto.getStart_road_addr());
            row.put("start_detail_addr",dto.getStart_detail_addr());
            row.put("end_road_addr",dto.getEnd_road_addr());
            row.put("end_detail_addrr",dto.getEnd_detail_addr());
            row.put("reserve_count",dto.getReserve_count());
            row.put("reserve_status_code", dto.getReserve_status_code());
            row.put("drive_start_time", dto.getDrive_start_time());
            row.put("drive_finish_time", dto.getDrive_finish_time());
            row.put("drive_distance", dto.getDrive_distance());
            
            
         
            // 배열에 추가
            // json배열.add(인덱스,json객체)
            jArray.add(i,row);
            
            
        }
        // json객체에 배열을 넣음
        jsonMain.put("sendData", jArray);
        System.out.println("items"+ items);
        return jsonMain;
    }
	/*
	// ====================================================
	// ID, PASS 로그인 정보 모바일로 전달
	// ====================================================
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/loginListForm.do",produces="application/json;charset=utf-8")
    public @ResponseBody JSONObject json1( ){
	
	
        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        List<MobileLoginDTO> items =mobileService.getLoginList( );
        System.out.println(items.get(0).getDriver_id());
       
        JSONArray jArray = new JSONArray(); // json배열
        for(int i=0; i<items.size(); i++){
            MobileLoginDTO dto = items.get(i);
            JSONObject row = new JSONObject();
            // json객체.put("변수명",값)
            row.put("driver_id", dto.getDriver_id());
            row.put("driver_pwd", dto.getDriver_pwd());
            row.put("driver_no", dto.getDriver_no());
            
         
            // 배열에 추가
            // json배열.add(인덱스,json객체)
            jArray.add(i,row);
            
            
        }
        // json객체에 배열을 넣음
        jsonMain.put("sendData", jArray);
        System.out.println("items"+ items);
        return jsonMain;
    }
    */
    
}



