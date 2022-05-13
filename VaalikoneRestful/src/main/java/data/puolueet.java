package data;
/**
 * Party object for JPA
 *
 */
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class puolueet implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String puolue;
    
    public puolueet() {
    	
	}
    
	public puolueet(String puolue) {
		this.puolue = puolue;
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
        }
        catch(NumberFormatException e) {
            this.id=0;
        }
    }
	public String getPuolue() {
		return puolue;
	}
	public void setPuolue(String puolue) {
		this.puolue = puolue;
	}
	
    public String toString() {
        return this.id+": " +this.puolue;
    }

}

