package point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import item.ItemDAO;
import item.ItemDTO;




public class PointDAO {
	@Autowired
	JdbcTemplate template;
	
	public PointDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("PointDAO() 생성자 호출");
	}
	
	public int selectCount(Map<String, Object> map) {
		String sql = "SELECT COUNT(*) FROM member";
		System.out.println(template.queryForObject(sql, Integer.class));
		return template.queryForObject(sql, Integer.class);
	}
	
	/*
	 buySticker() : 스티커를 구매했을때 호출되는 함수.
	 해당 아이디가 가진 포인트(밥알)이 10000밥알 이상일때만 스티커가 구매가능하다.
	 (밥알이 만개미만일 시에는 구매를 실패함. 
	 나중에 int의 return 0과 1로 구매실패한거띄워도 될듯)
	  
	  구매완료시 해당 id의 item에 temOName에 등록됨.
	 */
	public void buySticker(final PointDTO pdto, final ItemDTO idto) {
		final ItemDAO idao = new ItemDAO();
		
		if(getTotalPoint(pdto.getId())>=10000) {
			String sql = " UPDATE point SET point = point - 10000 "
					
				+ " WHERE id=?";
			template.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps ) throws
				SQLException{
					ps.setString(1, pdto.getId());
					idto.setId(pdto.getId());
					idto.setTemOname("pr");
					idao.getItem(idto);
					//idao.getItem2(idto);
				}
				});
			getTotalPoint(pdto.getId());
			System.out.println(getTotalPoint(pdto.getId()));
			System.out.println("buyTicket()실행 완료");
		}
		else {
			System.out.println(" buyTicket()오류 :포인트 잔액 부족");
		}
		
		
			
	}
	public void buySticker2(final PointDTO pdto, final ItemDTO idto) {
		final ItemDAO idao = new ItemDAO();
		
		if(getTotalPoint(pdto.getId())>=10000) {
			String sql = " UPDATE point SET point = point - 10000 "
					
				+ " WHERE id=?";
		
		try {
			template.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps ) throws
				SQLException{
					ps.setString(1, pdto.getId());
					idto.setId(pdto.getId());
					idto.setTemOname("pr");
					idao.getItem(idto);
					//idao.getItem2(idto);
				}
				});
			
		}catch(Exception e) {
			System.out.println(" buyTicket()오류 :haveItem테이블에 id 비존재");
		}
			
			getTotalPoint(pdto.getId());
			System.out.println(getTotalPoint(pdto.getId()));
			System.out.println("buyTicket()실행 완료");
		}
		else {
			System.out.println(" buyTicket()오류 :포인트 잔액 부족");
		}
		
		
			
	}
	
	
	/*
	 포인트 테이블 해당아이디가 가진 토탈 포인트(밥알)을 가져온다.
	 */
	public int getTotalPoint(String id) {
		String sql2 = "select point from point "
				+ " WHERE id= '"+id+"'";
	 
		System.out.println(sql2);
		//쿼리문에서 count(*)을 통해 반환되는 값을 정수형태로 가져온다.
		System.out.println("포인트는: "+template.queryForObject(sql2, Integer.class));
		
		return template.queryForObject(sql2, Integer.class);
	}
	
	
	
	
	
	
}
