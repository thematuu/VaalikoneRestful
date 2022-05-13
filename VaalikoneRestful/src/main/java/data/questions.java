package data;
/**
 * Questions object
 *
 */
public class questions {
	private int id;
	private String question;

	public questions(String id, String question) {
		// TODO Auto-generated constructor stub
		setId(id);
		this.question = question;
	}

	public questions() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setId(String id) {
		try {
			this.id = Integer.parseInt(id);
		} catch (NumberFormatException | NullPointerException e) {
			// Do nothing - the value of id won't be changed
		}
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
}
