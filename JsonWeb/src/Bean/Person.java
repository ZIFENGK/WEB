package Bean;

import java.io.Serializable;

public class Person  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6310420258828860007L;
	private int id;
	private String name;
	private String password;
	private String  sg;
	private  String  tz;
	
	
	public String getSg() {
		return sg;
	}
	public void setSg(String sg) {
		this.sg = sg;
	}
	public String getTz() {
		return tz;
	}
	public void setTz(String tz) {
		this.tz = tz;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
