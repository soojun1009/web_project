package com.test;

public class Sysop {
	
	// 수강생ID, 수강생이름, 수강생주민번호, 등록날짜, 수강생전화번호, 수강회수
	private String student_id, student_name,  register_date , student_phone ,count_history;
	private int student_ssn;
	private String course_id, coursename, course_start, course_end , classroom_name ;
	private int accommodate, count_student;
	private String fail_date, decision;

	public String getFail_date() {
		return fail_date;
	}

	public void setFail_date(String fail_date) {
		this.fail_date = fail_date;
	}

	public String getDecision() {
		return decision;
	}

	public void setDecision(String decision) {
		this.decision = decision;
	}

	public String getCourse_id() {
		return course_id;
	}

	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getCourse_start() {
		return course_start;
	}

	public void setCourse_start(String course_start) {
		this.course_start = course_start;
	}

	public String getCourse_end() {
		return course_end;
	}

	public void setCourse_end(String course_end) {
		this.course_end = course_end;
	}

	public String getClassroom_name() {
		return classroom_name;
	}

	public void setClassroom_name(String classroom_name) {
		this.classroom_name = classroom_name;
	}

	public int getCount_student() {
		return count_student;
	}

	public void setCount_student(int count_student) {
		this.count_student = count_student;
	}

	public int getAccommodate() {
		return accommodate;
	}

	public void setAccommodate(int accommodate) {
		this.accommodate = accommodate;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public int getStudent_ssn() {
		return student_ssn;
	}

	public void setStudent_ssn(int student_ssn) {
		this.student_ssn = student_ssn;
	}

	public String getRegister_date() {
		return register_date;
	}

	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}

	public String getStudent_phone() {
		return student_phone;
	}

	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}

	public String getCount_history() {
		return count_history;
	}

	public void setCount_history(String count_history) {
		this.count_history = count_history;
	}
	

}
