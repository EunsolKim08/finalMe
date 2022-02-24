package mybatis;

import lombok.Data;

@Data
public class BoardVO {
	
	private String id;
	private String name;
	private String title;
	private String contents;
	private java.sql.Date postdate;

}
