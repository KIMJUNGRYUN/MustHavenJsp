package membership;
import common.JDBConnect;

//DAO 데이터베이스 Member 연결을 위한 객체
public class MemberDAO extends JDBConnect {
	
	//생성자로 DB 연결
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw); //jdbconnct 부모생성자 사용
		
	}
	
	//Member 에서 id/pw 와 일치하는 회원 반환
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,  uid);
			psmt.setString(2,  upass);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
