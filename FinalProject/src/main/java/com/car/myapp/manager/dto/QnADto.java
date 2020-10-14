package com.car.myapp.manager.dto;

public class QnADto {
	private int qna_num;
	private String question;
	private String answer;
	private int category;
	
	public QnADto() {
		// TODO Auto-generated constructor stub
	}

	public QnADto(int qna_num, String question, String answer, int category) {
		super();
		this.qna_num = qna_num;
		this.question = question;
		this.answer = answer;
		this.category = category;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

}
