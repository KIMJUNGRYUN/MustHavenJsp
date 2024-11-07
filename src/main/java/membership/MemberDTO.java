package membership;

//DTO VO 는 테이블에 있는 데이터를 자바 객체로 가져오기 위함
public class MemberDTO{
	//DB member 테이블 열이름과 같음
	private String id;
	private String pass;
	private String name;
	private String regidate; //DB날짜 데이터를 문자열로 반환
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	
}