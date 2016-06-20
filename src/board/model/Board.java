/*
 * 자바의 클래스 중 로직을 작성하기 위함이 아니라 단지 
 * 데이터를 담기 위한 용도로 정의하는 클래스를 가리켜 VO, DTO 라 한다
 * 이 용어는 어디서 근거하는가? 일반적인 어플리케이션 설계에서 사용되는 
 * 범용어이다!! 
 * VO (Value Oject)  
 * DTO (Data Transfer Object)
 * */
package board.model;
public class Board {
	private int board_id;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}










