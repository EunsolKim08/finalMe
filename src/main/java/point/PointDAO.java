package point;

import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class PointDAO extends JDBConnect {
	
	//부모의 인자생성자를 호출한다. 이때 application 내장객체를 매개변수로 전달한다.
	
	public PointDAO() {
		System.out.println("PointDAO() 생성자 호출");
	}
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM member";
		
		
        try {
        	stmt = con.createStatement();
        	rs = stmt.executeQuery(query);
        	rs.next();
        	totalCount = rs.getInt(1);
        	System.out.println("member테이블 id수 출력"+totalCount);
        }
        catch (Exception e) {
        	System.out.println("게시물 카운트 중 예외발생");
        	e.printStackTrace();
        }
        return totalCount;
	}

}
