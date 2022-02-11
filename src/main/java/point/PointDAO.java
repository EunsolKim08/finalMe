package point;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;




public class PointDAO {
	
	//부모의 인자생성자를 호출한다. 이때 application 내장객체를 매개변수로 전달한다.
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
	 point가 5000만큼 차감되고 해당 id의 item에 sticker가 등록됨.
	 */
	public void buySticker(final PointDTO dto) {
		String sql = " UPDATE point SET point = point - 10000 "
				
				+ " WHERE id=?";
		
			template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps ) throws
			SQLException{
				ps.setString(1, dto.getId());
			}
		});
			System.out.println("buyTicket()실행 완료");
	}
	
	public int selectPoint(final PointDTO dto) {
		String sql = " SELECT point FROM point "
				
				+ " WHERE id=? ";
		
			template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps ) throws
			SQLException{
				ps.setString(1, dto.getId());
			}
		});
			System.out.println("selectPoint실행 완료");
			System.out.println("11111");
			
			return 0;
			
	}
	
	public void ad
		
	
	

}
