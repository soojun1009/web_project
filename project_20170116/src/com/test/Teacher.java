package com.test;

//컬럼에 맞는 강사 자료형 선언 클래스
public class Teacher {

	private String teacher_id, teacher_name, teacher_phone, availablesub;
	private int teacher_ssn;

	private String course_id, coursename, course_start, course_end, classroom_name, subject_id, sub_name, subject_start, sub_name_id,
			subject_end, bookname, student_id;
	
	
	private int accommodate, decision;

	private int attendance_score, writing_score, practice_score, grade;
	private String exam_date, exam_name;
	
	private int attendance, writing, practice;
	
	private String count_student;


	public String getCount_student() {
		return count_student;
	}

	public void setCount_student(String count_student) {
		this.count_student = count_student;
	}

	public String getStudent_id() {
		return student_id;
	}

	public String getAvailablesub() {
		return availablesub;
	}

	public void setAvailablesub(String availablesub) {
		this.availablesub = availablesub;
	}

	public String getSub_name_id() {
		return sub_name_id;
	}

	public void setSub_name_id(String sub_name_id) {
		this.sub_name_id = sub_name_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	
	public int getAttendance() {
		return attendance;
	}


	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}

	public int getWriting() {
		return writing;
	}

	public void setWriting(int writing) {
		this.writing = writing;
	}

	public int getPractice() {
		return practice;
	}

	public void setPractice(int practice) {
		this.practice = practice;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getExam_name() {
		return exam_name;
	}

	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}

	public int getAttendance_score() {
		return attendance_score;
	}

	public void setAttendance_score(int attendance_score) {
		this.attendance_score = attendance_score;
	}

	public int getWriting_score() {
		return writing_score;
	}

	public void setWriting_score(int writing_score) {
		this.writing_score = writing_score;
	}

	public int getPractice_score() {
		return practice_score;
	}

	public void setPractice_score(int practice_score) {
		this.practice_score = practice_score;
	}

	public String getExam_date() {
		return exam_date;
	}

	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_name() {
		return teacher_name;
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

	public String getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

	public String getSubject_start() {
		return subject_start;
	}

	public void setSubject_start(String subject_start) {
		this.subject_start = subject_start;
	}

	public String getSubject_end() {
		return subject_end;
	}

	public void setSubject_end(String subject_end) {
		this.subject_end = subject_end;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public int getDecision() {
		return decision;
	}

	public void setDecision(int decision) {
		this.decision = decision;
	}

	public int getAccommodate() {
		return accommodate;
	}

	public void setAccommodate(int accommodate) {
		this.accommodate = accommodate;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getTeacher_phone() {
		return teacher_phone;
	}

	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}

	public int getTeacher_ssn() {
		return teacher_ssn;
	}

	public void setTeacher_ssn(int teacher_ssn) {
		this.teacher_ssn = teacher_ssn;
	}

}
