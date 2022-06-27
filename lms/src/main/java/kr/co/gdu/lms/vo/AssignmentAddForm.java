package kr.co.gdu.lms.vo;

import java.util.List;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AssignmentAddForm {
	private int educationNo;
	private String assignmentExamTitle;
	private String assignmentExamContent;
	private String assignmentDeadLine;
	private List<MultipartFile> assignmentFileList;
	private String loginId ;
	
	
}
