package item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import point.JdbcTemplateConst;

public class ItemDAO {
	
	@Autowired
	JdbcTemplate template;
	
	public ItemDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("ItemDAO 생성자 호출");
	}
	
	public void getItem(String id, String temOname) {
		try {
			String sql = " INSERT INTO haveItem (id, temOname )"
					+" VALUES ('"+id+"', '"+temOname+"');";
			System.out.println("사용자계정 getItem() 실행완료1 ");
		}catch(Exception e) {
			System.out.print("사용자계정 getItem() 오류발생1 ");
			e.printStackTrace();
		}
	}
	public void getItem(final ItemDTO idto) {
		try {
			String sql = " INSERT INTO haveItem (id, temOname )"
					+" VALUES ('"+idto.getId()+"', '"+idto.getTemOname()+"');";
			System.out.println(sql);
			System.out.println("사용자계정 getItem() 실행완료2 ");
		}catch(Exception e) {
			System.out.print("사용자계정 getItem() 오류발생2");
			e.printStackTrace();
		}
	}

}
