package com.library.web.member;

//잘못 만들어진 코드, -> VO는 불변 객체로, 생성자를 통한 값 할당이 이루어 져야 하며 Setter없이 getter만 가져 값의 불변성을 보장해야 한다. 이 경우는 Bean이나 DTO 사용이 맞았을 것 같다.
//가 나의 생각이었으나 이 Member 클래스의 경우에는 VO 사용이 가능하다고 생각한다, Member 객체는 로그인 시 DB에서 검색한 유저 정보를 가져와 해당 이용자의 정보를 저장 하고 활용할 뿐.
//현재의 프로그램에서 이 정보를 수정하는 작업은 존재하지 않기 때문, 하지만 추후에 이용자의 교번이 바뀐다던지, 비밀번호를 바꾼다던지 하는 작업이 추가된다면 VO를 사용하지 않는것이 맞게 될 것이다.
public class MemberVO {
	private String empno;
	private String nm;
	private String pwd;
	private String role;
	
	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
}
