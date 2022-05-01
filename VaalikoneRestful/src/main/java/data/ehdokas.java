package data;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ehdokas implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String etunimi;
    private String sukunimi;
    private String puolue;
    
    public ehdokas() {
    	
	}
    
	public ehdokas(String etunimi, String sukunimi, String puolue) {
		this.etunimi = etunimi;
		this.sukunimi = sukunimi;
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
	public String getEtunimi() {
		return etunimi;
	}
	public void setEtunimi(String etunimi) {
		this.etunimi = etunimi;
	}
	public String getSukunimi() {
		return sukunimi;
	}
	public void setSukunimi(String sukunimi) {
		this.sukunimi = sukunimi;
	}
	public String getPuolue() {
		return puolue;
	}
	public void setPuolue(String puolue) {
		this.puolue = puolue;
	}
	
    public String toString() {
        return this.id+": "+this.etunimi+" "+this.sukunimi +" "+this.puolue;
    }
}