package kr.co.gdu.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.lms.vo.Login;
import kr.co.gdu.lms.vo.Manager;
import kr.co.gdu.lms.vo.MemberForm;
import kr.co.gdu.lms.vo.Student;
import kr.co.gdu.lms.vo.Teacher;

@Mapper
public interface LoginMapper {
	// 로그인 시 login_active 가져오는 메서드
	int selectLoginActive(Login login);
	
	// 계정 복구 시 active 1로 바꾸는 메서드
	int updateActiveByMember(String loginId);
	
	// 비활성화 계정 중 로그인 안한지 3개월 이상 6개월 미만인 회원 로그인 아이디 출력
	List<Map<String, Object>> selectRecoveryMemberList();
	
	// 마지막 로그인 날짜 3개월 지난 사람 active 업데이트 해주는 메서드
	int updateActiveByDormantMember(String loginId);
	
	// 마지막 로그인 날짜 3개월 지난 사람 리스트
	List<String> selectMemberIdListByLastLoginDate();
	
	// 휴먼계정 아이디 출력
	List<Map<String,Object>> selectDormantMemberId();
	
	// 해당 아이디가 비밀번호 변경한 최근 날짜 출력
	String selectPwRecordDate(String loginId);
	
	// 비밀번호 변경이력 업데이트
	int updatePwRecord(String updateDate);
	
	// 마지막 로그인 날짜로부터 며칠이 지났는지
	int selectDiffDay(String loginId);
	
	// 회원가입 거절
	int updateAddMemberActiveDenied(String loginId);
	
	// 회원가입 승인
	int updateAddMemberActive(String loginId);
	
	// 매니저 회원가입 승인리스트
	List<Manager> selectAddManagerList();
	
	// 강사 회원가입 승인리스트
	List<Teacher> selectAddTeacherList();
	
	// 학생 회원가입 승인리스트
	List<Student> selectAddStudentList();

	// 바꾸는 비밀번호와 비밀번호 변경 이력 비교
	String lastLoginPwCheck(Login login);
	
	// 학생, 강사, 매니저 비밀번호 변경 이력 테이블 삽입
	int insertPwRecord(Login login);
	
	// 학생, 강사, 매니저 비밀번호 변경
	int updatePw(Login login);
	
	// 학생, 매니저, 강사 비밀번호 찾기(확인)
	int selectAllLoginPw(Map<String, Object> map);

	// 학생, 매니저, 강사 아이디 찾기
	String selectAllLoginId(Map<String, Object> map);
	
	// 로그인 - 로그인 아이디와 비밀번호 확인하고 맞다면 해당 level 출력 
	Login loginAndSelectLevel(Login loginTest);
		
	// 로그인 - 마지막 로그인날짜 업데이트
	int updateLastLoginDate(String loginId);
	
	// id 중복 체크 위해 id 개수 받기
	int selectIdCnt(String id);
	
	// email 중복 체크 위해 email 개수 받기
	int selectEmailCnt(Map<String, Object> map);
	
	// 매니저 회원가입
	int insertMember(MemberForm addMemberForm);
	
	// 회원가입시 로그인 테이블에도 추가
	int insertLogin(MemberForm addMemberForm);
	
	// 로그인시 레벨받기
	int selectLevelByLoginId(String loginId);
	
	// 과목 리스트 데이터 받아오기
	List<Map<String,Object>> selectLectureList();
	
}
