package kr.co.gdu.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.lms.log.CF;
import kr.co.gdu.lms.service.LectureSerivce;
import kr.co.gdu.lms.service.LoginService;
import kr.co.gdu.lms.service.MemberService;
import kr.co.gdu.lms.vo.Dept;
import kr.co.gdu.lms.vo.Login;
import kr.co.gdu.lms.vo.Manager;
import kr.co.gdu.lms.vo.Position;
import kr.co.gdu.lms.vo.Student;
import kr.co.gdu.lms.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
   @Autowired private MemberService memberService;
   @Autowired private LoginService loginService;
   @Autowired private LectureSerivce lectureSerivce;
   
   @PostMapping("/loginCheck/modifyEmploymentByStudent")
   public String modifyEmploymentByStudent(@RequestParam(name="lectureName") String lectureName
		   								, @RequestParam(name = "employment") List<String> employment
		   								, @RequestParam(name="employmentCurrentPage") int employmentCurrentPage) {
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.post lectureName : " + lectureName + CF.RS);
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.post employment : " + employment + CF.RS);
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.post employmentCurrentPage : " + employmentCurrentPage + CF.RS);
	   String[] changeLectureName = lectureName.split(",");
	   memberService.modifyEmploymentByStudent(employment);
	   return "redirect:/loginCheck/getEmploymentList?employmentCurrentPage="+employmentCurrentPage+"&lectureName="+changeLectureName[0];
   }
   
   @GetMapping("/loginCheck/modifyEmploymentByStudent")
   public String modifyEmploymentByStudent(Model model
		   								, Student student
				   						, @RequestParam(name = "lectureName", defaultValue = "") String lectureName
		   								, @RequestParam(name="employmentCurrentPage", defaultValue = "1") int employmentCurrentPage
		   								, @RequestParam(name="employmentRowPerPage", defaultValue = "10") int employmentRowPerPage) {
	   
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.get lectureName : " + lectureName + CF.RS);
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.get employmentCurrentPage : " + employmentCurrentPage + CF.RS);
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.get employmentRowPerPage : " + employmentRowPerPage + CF.RS);
	   
	   List<String> lectureNameList = lectureSerivce.getLectureNameList();
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.get lectureNameList : " + lectureNameList + CF.RS);
	   
	   Map<String, Object> paramMap = new HashMap<String, Object>();
	   paramMap.put("lectureName", lectureName);
	   paramMap.put("employmentCurrentPage", employmentCurrentPage);
	   paramMap.put("employmentRowPerPage", employmentRowPerPage);
	   
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.get paramMap : " + paramMap + CF.RS);
	   
	   List<Object> employmentList = memberService.getEmploymentList(paramMap);
	   
	   log.debug(CF.LCH + "MemberController.modifyEmploymentByStudent.get employmentList : " + employmentList + CF.RS);
	   
	   model.addAttribute("lectureName", lectureName);
	   model.addAttribute("lectureNameList", lectureNameList);
	   model.addAttribute("employmentList", employmentList.get(0));
	   model.addAttribute("employmentCurrentPage", employmentCurrentPage);
	   model.addAttribute("employmentLastPage", employmentList.get(1));
	   
	   
	   return "member/modifyEmploymentByStudent";
   }

   @GetMapping("/loginCheck/getEmploymentList")
   public String getEmploymentList(Model model
		   						, @RequestParam(name = "lectureName", defaultValue = "") String lectureName
   								, @RequestParam(name="employmentCurrentPage", defaultValue = "1") int employmentCurrentPage
   								, @RequestParam(name="employmentRowPerPage", defaultValue = "10") int employmentRowPerPage) {
	   
	   log.debug(CF.LCH + "MemberController.getEmploymentList.get lectureName : " + lectureName + CF.RS);
	   log.debug(CF.LCH + "MemberController.getEmploymentList.get employmentCurrentPage : " + employmentCurrentPage + CF.RS);
	   log.debug(CF.LCH + "MemberController.getEmploymentList.get employmentRowPerPage : " + employmentRowPerPage + CF.RS);
	   
	   List<String> lectureNameList = lectureSerivce.getLectureNameList();
	   log.debug(CF.LCH + "MemberController.getEmploymentList.get lectureNameList : " + lectureNameList + CF.RS);
	   
	   Map<String, Object> paramMap = new HashMap<String, Object>();
	   paramMap.put("lectureName", lectureName);
	   paramMap.put("employmentCurrentPage", employmentCurrentPage);
	   paramMap.put("employmentRowPerPage", employmentRowPerPage);
	   
	   log.debug(CF.LCH + "MemberController.getEmploymentList.get paramMap : " + paramMap + CF.RS);
	   
	   List<Object> employmentList = memberService.getEmploymentList(paramMap);
	   
	   log.debug(CF.LCH + "MemberController.getEmploymentList.get employmentList : " + employmentList + CF.RS);
	   
	   model.addAttribute("lectureName", lectureName);
	   model.addAttribute("lectureNameList", lectureNameList);
	   model.addAttribute("employmentList", employmentList.get(0));
	   model.addAttribute("employmentCurrentPage", employmentCurrentPage);
	   model.addAttribute("employmentLastPage", employmentList.get(1));
	   
	   return "member/getEmploymentList";
   }
   
   // ?????? ??????
   @GetMapping("/loginCheck/getMemberList")
   public String getMemberList(Model model
		   						,@RequestParam (name="msg") String msg) {
	   // msg ??????
	   log.debug(CF.GDH + "MemberController.getMemberList msg : " + msg + CF.RS);
       
	   // msg ????????? ??????
	   model.addAttribute("msg", msg);
	   
	   // msg???????????? ??????????????????
	   if("student".equals(msg)) {
		   List<Student> studentList = memberService.getStudentList();
		   log.debug(CF.GDH+"MemberController.getMemberList studentList : " + studentList + CF.RS);
		   model.addAttribute("studentList", studentList);
	   } else if("teacher".equals(msg)) {
		   List<Teacher> teacherList = memberService.getTeacherList();
		   log.debug(CF.GDH+"MemberController.getMemberList teacherList : " + teacherList + CF.RS);
		   model.addAttribute("teacherList", teacherList);
	   } else if("manager".equals(msg)) {
		   List<Manager> managerList = memberService.getManagerList();
	       log.debug(CF.GDH+"MemberController.getMemberList managerList : " + managerList + CF.RS);
	       model.addAttribute("managerList", managerList);
	   }
       
       return "member/getMemberList";
   }

   // ???????????? ????????????
   @GetMapping("/loginCheck/getMemberOne")
   public String getMemberOne(Model model, @RequestParam(name="loginId") String loginId) {
	  // ????????? ?????????Id ?????????
	  log.debug(CF.GDH + "MemberController.getMemberOne loginId : " + loginId + CF.RS);
	   
	  // ?????? ????????????
      int level = loginService.getLevelByLoginId(loginId);
      log.debug(CF.GDH + "MemberController.getMemberOne level : " + level + CF.RS);
      
      // ?????????VO??? ??????
      Login login = new Login();
      login.setLevel(level);
      login.setLoginId(loginId);
      
      Map<String, Object> returnMap = new HashMap<String, Object>();
   
      // ???????????????????????? ?????? ????????? ????????????
      returnMap = memberService.getMemberOne(login);
      log.debug(CF.GDH + "MemberController.getMemberOne returnMap : " + returnMap + CF.RS);
      
      // ????????? ????????? jsp??? ?????????
      model.addAttribute("level", level);
      model.addAttribute("member", returnMap.get("member"));
      model.addAttribute("memberFile", returnMap.get("memberFile"));
      return "member/getMemberOne";
   }

   // ???????????? ?????????
   @GetMapping("/loginCheck/modifyMember")
   public String modifyMember(Model model, HttpSession session) {
      
      // ????????? ?????? ?????????ID ????????????
      String loginId = (String) session.getAttribute("sessionId");
      log.debug(CF.GDH + "MemberController.modifyStudent loginId : " + loginId + CF.RS);
      
      // ?????? ????????????
      int level = (int)session.getAttribute("sessionLv");
      log.debug(CF.GDH + "MemberController.modifyStudent level : " + level + CF.RS);
      
      Login login = new Login();
      
      login.setLoginId(loginId);
      login.setLevel(level);
      
      // ?????? ?????? Map ??????
      Map<String, Object> returnMap = new HashMap<String, Object>();
      
      if(level==3) { // ??????????????? ?????????
         // ????????? ?????? ?????? ????????? ????????????
         List<Dept> deptList = memberService.getDeptList();
         List<Position> positionList = memberService.getPositions();
         log.debug(CF.PSH+"MemberController.modifyManager :"+deptList+CF.RS);
          log.debug(CF.PSH+"MemberController.modifyManager :"+positionList+CF.RS);
         
         // ????????? ???????????? ????????? ??????
         model.addAttribute("deptList", deptList);
         model.addAttribute("positionList", positionList);
      } 
      
      // ????????? ???????????? ???????????? ?????? ???????????? ???????????? returnMap??? ??????
      returnMap = memberService.getMemberOne(login);
      log.debug(CF.GDH + "MemberController.modifyStudent.Get returnMap : " + returnMap + CF.RS);
               
      // returnMap??? ?????? ??????????????? ??????????????? ????????? ??????
      model.addAttribute("member", returnMap.get("member"));
      model.addAttribute("memberFile", returnMap.get("memberFile"));
      return "member/modifyMember";
   }
   
   // ???????????? ????????????
   @PostMapping("/loginCheck/modifyMember")
   public String modifyMember(HttpSession session
								, Student student
								, Teacher teacher
								, Manager manager
								, @RequestParam(name="incomeAddress") String incomeAddress
								, @RequestParam(name="writtenAddress", defaultValue = "none") String writtenAddress) {
	   
	   // ????????? ???????????? ?????????
	   log.debug(CF.GDH + "MemberController.modifyStudent.Post student : " + student + CF.RS);
	   log.debug(CF.GDH + "MemberController.modifyTeacher.Post teacher : " + teacher + CF.RS);
	   log.debug(CF.GDH + "MemberController.modifyManager.Post manager : " + manager + CF.RS);
	   log.debug(CF.GDH + "MemberController.modifyStudent.Post incomeAddress : " + incomeAddress + CF.RS);
	   log.debug(CF.GDH + "MemberController.modifyStudent.Post writtenAddress : " + writtenAddress + CF.RS);
	   
	   // ????????? ?????? ?????? ????????????
	   int level = (int) session.getAttribute("sessionLv");
	   
	   // ????????? ?????? ????????? ????????????
	   String loginId = (String) session.getAttribute("sessionId");
	   log.debug(CF.GDH + "MemberController.modifyStudent.Post loginId : " + loginId + CF.RS);
	   
	   if(level == 1) {
		  // student??? ????????? ????????????
		  student.setLoginId(loginId);

		  if(writtenAddress.equals("none")) {
	    	  student.setAddress(incomeAddress);
	    	  log.debug(CF.GDH + "MemberController.modifyStudent.Post student.setAddress(incomeAddress) : " + student + CF.RS);
	      } else {
	    	  student.setAddress(writtenAddress);
	    	  log.debug(CF.GDH + "MemberController.modifyStudent.Post student.setAddress(writtenAddress) : " + student + CF.RS);
	      }
	      
	      // ????????? ??????
	      int row = memberService.modifyStudent(student);
	      
	      if(row==1) {
	    	  log.debug(CF.GDH + "MemberController.modifyStudent.Post modifyStudent : ????????????"+ CF.RS);
	    	  return "redirect:/loginCheck/getMemberOne?loginId="+loginId;
	      } else { 
	    	  log.debug(CF.GDH + "MemberController.modifyStudent.Post modifyStudent : ????????????"+ CF.RS);
	    	  return "redirect:/loginCheck/modifyStudent?loginId="+loginId;
	      }
	   } else if(level == 2) {
		  // teacher??? ????????? ????????????
		  teacher.setLoginId(loginId);
	      
	      if(writtenAddress.equals("none")) {
	    	  teacher.setAddress(incomeAddress);
	    	  log.debug(CF.GDH + "MemberController.modifyTeacher.Post teacher.setAddress(incomeAddress) : " + teacher + CF.RS);
	      } else {
	    	  teacher.setAddress(writtenAddress);
	    	  log.debug(CF.GDH + "MemberController.modifyTeacher.Post teacher.setAddress(writtenAddress) : " + teacher + CF.RS);
	      }
	      
	      // ????????? ??????
	      int row = memberService.modifyTeacher(teacher);
	      
	      if(row==1) {
	    	  log.debug(CF.GDH + "MemberController.modifyTeacher.Post modifyTeacher : ????????????"+ CF.RS);
	    	  return "redirect:/loginCheck/getMemberOne?loginId="+loginId;
	      } else { 
	    	  log.debug(CF.GDH + "MemberController.modifyTeacher.Post modifyTeacher : ????????????"+ CF.RS);
	    	  return "redirect:/loginCheck/modifyTeacher?loginId="+loginId;
	      }
	   } else if(level == 3) {
		  // manager??? ????????? ????????????
		  manager.setLoginId(loginId);
		
		if(writtenAddress.equals("none")) {
			manager.setAddress(incomeAddress);
			log.debug(CF.GDH + "MemberController.modifyManager.Post manager.setAddress(incomeAddress) : " + manager + CF.RS);
		} else {
			manager.setAddress(writtenAddress);
			log.debug(CF.GDH + "MemberController.modifyManager.Post manager.setAddress(writtenAddress) : " + manager + CF.RS);
		}
		
		// ????????? ??????
		int row = memberService.modifyManager(manager);
		
		if(row==1) {
			log.debug(CF.GDH + "MemberController.modifyManager.Post modifyManager : ????????????"+ CF.RS);
			return "redirect:/loginCheck/getMemberOne?loginId="+loginId;
		} else { 
			log.debug(CF.GDH + "MemberController.modifyManager.Post modifyManager : ????????????"+ CF.RS);
			return "redirect:/loginCheck/modifyManager?loginId="+loginId;
		}
	  } else {
		  return "redirect:/loginCheck/main";
	  }
   }
   
   // ???????????? ?????? ???
   @GetMapping("/loginCheck/pwCheck")
   public String pwCheck(Model model
		   				, HttpSession session
		   				, @RequestParam(name="msg") String msg) {
	   
	   // ????????? ?????? ?????????Id ????????????
	   String loginId = (String) session.getAttribute("sessionId");
	   log.debug(CF.GDH + "MemberController.pwCheck.Get loginId : " + loginId + CF.RS);
	   
	   // ????????? loginId??? msg ????????? ?????????
	   model.addAttribute("loginId", loginId);
	   model.addAttribute("msg", msg);
	   
	   if("modifyPwCheck".equals(msg)) {
		   return "member/pwCheck";
	   } else if("removePwCheck".equals(msg)) {
		   return "member/pwCheck";
	   } else {
		   return "member/pwCheck";
	   }
	   
   }
   
   // ???????????? ?????? ??????
   @PostMapping("/loginCheck/pwCheck")
   public String pwCheck(Model model
		   				 , HttpSession session
		   				 , Login login
		   				 , @RequestParam(name = "loginId") String loginId
						 , @RequestParam(name = "loginPw") String loginPw
		   				 , @RequestParam(name="msg") String msg) {
	   
	   log.debug("MemberController.pwCheck loginId:" + loginId);
	   log.debug("MemberController.pwCheck loginPw:" + loginPw);
	   
	   // ????????? ????????? Id, Pw ??????
	   login.setLoginId(loginId);
	   login.setLoginPw(loginPw);
	   
	   // ?????? ????????? ?????? loginId??? msg ??????
	   model.addAttribute("loginId", loginId);
	   model.addAttribute("msg", msg);
	   
	   // ??????????????? ??????????????? ??????
	   int row = memberService.getPwCheck(login);
	   log.debug("memberService.getPwCheck row:" + row);
	   
	   if("modifyPwCheck".equals(msg)) {
	       if (row == 1) {
	    	   log.debug("???????????? ??????: ???????????? ?????? ????????? ??????");	
	    	   return "redirect:/loginCheck/modifyMember";
	       } else {
	    	   log.debug("???????????? ??????: ???????????? ?????? ????????? ??????");	
	          return "member/pwCheck";
	       }
	   } else if("removePwCheck".equals(msg)) {
		   // ?????? ????????????
		   int level = (int)session.getAttribute("sessionLv");
		   log.debug(CF.GDH + "MemberController.removePwCheck level : " + level + CF.RS);
		      
		   // ???????????? ???????????? ??????
		   if (row == 1) {
		      if(level == 1) {
		     	 memberService.removeStudent(login);
		      } else if(level == 2) {
		       	 memberService.removeTeacher(login);
		      } else if(level == 3) {
		       	 memberService.removeManager(login);
              }
	             return "redirect:/login";
		   } else {
		       return "/member/pwCheck";
		   }
	   } else {
		   if(row == 1) {
			   return "member/modifyPw";
		   } else {
			   return "member/pwCheck";
		   }
	   }
   }
   
   // ?????? ???????????? ?????? ??????
   @PostMapping("/loginCheck/modifyPw")
   public String modifyPw(@RequestParam(name = "loginId") String loginId
		   					,@RequestParam(name = "loginPw") String loginPw) {
	   
	   // ????????? ?????? ??????
	   Login login =  new Login();
	   login.setLoginId(loginId);
	   login.setLoginPw(loginPw);
	   
	   // ??????????????? ???????????? ??????
	   int row = memberService.modifyPw(login);
	   if(row == 1) {
		   return "redirect:/loginCheck/getMemberOne?loginId="+loginId;
	   } else {
		   return "redirect:/loginCheck/modifyPw?";
	   }
   }
   
   // ?????? ?????? ?????? ???
   @GetMapping("/loginCheck/modifyMemberFile")
   public String modifyMemberFile(Model model, @RequestParam(name = "memberFileName") String memberFileName) {
      log.debug(CF.GDH + "MemberController.modifyStudent.Post memberFileName : " + memberFileName + CF.RS);
      model.addAttribute("memberFileName", memberFileName);

      return "member/modifyMemberFile";
   }
   
   // ?????? ?????? ?????? ??????
   @PostMapping("/loginCheck/modifyMemberFile") 
   public String modifyMemberFile (HttpSession session
                           , HttpServletRequest request
                           , @RequestParam(name="deleteMemberFileName") String memberFileName
                           , @RequestParam(name="insertMemberFile") MultipartFile insertMemberFile) {
      
         log.debug(CF.GDH + "MemberController.modifyMemberFile.Post deleteMemberFileName : " + memberFileName + CF.RS);
         log.debug(CF.GDH + "MemberController.modifyMemberFile.Post insertMemberFile : " + insertMemberFile + CF.RS);
      
         //???????????? ?????? ????????? ????????????
         String loginId = (String) session.getAttribute("sessionId");
         
         // ?????? ?????? ????????????
         String path = request.getServletContext().getRealPath("/file/memberPhoto/");
         log.debug(CF.GDH + "MemberController.modifyMemberFile.Post path : " + path + CF.RS);
         
         // 1) ???????????? ????????????
         // 2) DB?????? ???????????? ??? ??????
         int row = memberService.modifyMemberFile(loginId, memberFileName, insertMemberFile, path);
         
         if(row == 1) { 
            return "redirect:/loginCheck/main"; 
         } else { 
            return "redirect:/loginCheck/getStudentOne"; }
   }
   
}
