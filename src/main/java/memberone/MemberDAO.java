package memberone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	DataSource dataSource;
	
//	public MemberDAO() {
//		try{
//			InitialContext initContext = new InitialContext();
//			Context envContext = (Context)initContext.lookup("java:/comp/env");
//			dataSource = (DataSource) envContext.lookup("java:comp/env/jdbc/myOracle");
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	// singletion적용
	private static MemberDAO instance = null; // 맴버필드
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if(instance == null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}
	
	private Connection getConnection() {


		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myOracle");
			conn = ds.getConnection();
		}catch(Exception e) {
			System.err.println("Connection 생성실패");
			e.printStackTrace();
		}
		return conn;
	}
	
	public boolean idCheck(String id) {

		boolean result = true;   // 사용불가
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next())result = false;  // 아이디가 있으면 사용가능으로 바꾼다.
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)try {conn.close();}catch(SQLException e) {}
		}
		return result;
	}
	
	public Vector<ZipCodeVO> zipcodeRead(String dong){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();
		try {
			conn = getConnection();
			String strQuery = "select * from zipcode where dong like '" + dong + "%'";
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ZipCodeVO tempZipcode = new ZipCodeVO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setSido(rs.getString("sido"));
				tempZipcode.setGugun(rs.getString("gugun"));
				tempZipcode.setDong(rs.getString("dong"));
				tempZipcode.setRi(rs.getString("ri"));
				tempZipcode.setBunji(rs.getString("bunji"));
				vecList.addElement(tempZipcode);
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null)try {conn.close();}catch(SQLException sqle3) {}
		}
		return vecList;
	}
	
	public boolean  memberInsert(MemberVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			conn = getConnection();
			String strQuery = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone1());
			pstmt.setString(5, vo.getPhone2());
			pstmt.setString(6, vo.getPhone3());
			pstmt.setInt(7, vo.getAge());
			pstmt.setString(8, vo.getGender());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getZipcode());
			pstmt.setString(11, vo.getAddress1());
			pstmt.setString(12, vo.getAddress2());
			pstmt.setString(13, vo.getProfile());
			int count = pstmt.executeUpdate();
			if(count > 0)flag = true;
		}catch(Exception ex) {
			System.out.println("Exception" + ex);
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null)try {conn.close();}catch(SQLException sqle3) {}
		}
		return flag;
	}
	
	// 로그인처리
	public int loginCheck(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1; // id가 존재하지 않는 경우
		try {
			conn = getConnection();
			String strQuery = "select pass from member where id = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPass = rs.getString("pass");
				if(pass.equals(dbPass)) check = 1;
				else					check = 0;
			}
		}catch(Exception e) {
			System.out.println("Exception" + e);
		}
			finally {
				if(rs != null)try {rs.close();}catch(SQLException sqle1) {}
				if(pstmt != null)try {pstmt.close();}catch(SQLException sqle2) {}
				if(conn != null)try {conn.close();}catch(SQLException sqle3) {}
		}
		return check;
	}

	// 회원정보수정하기 위해서 회원가입한 정보중 id에 해당하는 정보를 가져오는 메서드
	public MemberVO getMember(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPass(rs.getString("pass"));
				vo.setName(rs.getString("name"));
				vo.setPhone1(rs.getString("Phone1"));
				vo.setPhone2(rs.getString("Phone2"));
				vo.setPhone3(rs.getString("Phone3"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress1(rs.getString("Address1"));
				vo.setAddress2(rs.getString("Address2"));
				vo.setProfile(rs.getString("Profile"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null)try {conn.close();}catch(SQLException sqle3) {}
		}
		return vo;
	}
	
	// 회원정보 업데이트 메서드 id 아이디와 성별은 변경불가능
	public void updateMember(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE member \r\n"
					+ "SET pass=?, name=?, phone1=?, phone2=?, phone3=?, age=?, email=?, zipcode=?, address1=?, address2=?, profile=? \r\n"
					+ "WHERE id=?");
			pstmt.setString(1, vo.getPass());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone1());
			pstmt.setString(4, vo.getPhone2());
			pstmt.setString(5, vo.getPhone3());
			pstmt.setInt(6, vo.getAge());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getZipcode());
			pstmt.setString(9, vo.getAddress1());
			pstmt.setString(10, vo.getAddress2());
			pstmt.setString(11, vo.getProfile());
			pstmt.setString(12, vo.getId());
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)try {conn.close();}catch(SQLException e) {}
		}
	}
	
	// 결과를 받아 rsult로 return해준다.
	public int deleteMember(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = "";  // db에 저장된 비밀번호
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select pass from member where id=? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbPass = rs.getString("pass");
				if(dbPass.equals(pass)) {
					pstmt = conn.prepareStatement("delete from member where id = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1; // 회원탈퇴 성공
				}else {
					result = 0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!= null)try {rs.close();}catch(SQLException e) {}
			if(pstmt!= null)try {pstmt.close();}catch(SQLException e) {}
			if(conn!= null)try {conn.close();}catch(SQLException e) {}
		}
		return result;
	}
	
	
	
	

}
