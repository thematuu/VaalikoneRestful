package data;
/**
 * Answer object
 *
 */
public class answers {
	private int id;
	private String answer;
	private int eid;
	private int kid;
	
	public answers(String id, String answer) {
		// TODO Auto-generated constructor stub
		setId(id);
		this.answer=answer;
	}
	public answers() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public void setEid(String eid) {
		try {
		this.eid = Integer.parseInt(eid);
		}
		catch(NumberFormatException | NullPointerException e) {
			//Do nothing - the value of id won't be changed
		}
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}

	public void setId(String id) {
		try {
			this.id = Integer.parseInt(id);
		}
		catch(NumberFormatException | NullPointerException e) {
			//Do nothing - the value of id won't be changed
		}
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}