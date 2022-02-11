package point;

import java.util.Map;
import javax.servlet.ServletContext;
import org.springframework.jdbc.core.JdbcTemplate;




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
	
	public String printId(Map<String, Object> map) {
		
	}
	
	
	

}
