package com.car.myapp.manager.dto;

public class QnADto {
	private int num;
	private String question;
	private String answer;
	
	public QnADto() {
		// TODO Auto-generated constructor stub
	}

	public QnADto(int num, String question, String answer) {
		super();
		this.num = num;
		this.question = question;
		this.answer = answer;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
