package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import data.candidate;

public class jpaDao {
	
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("VaalikoneRestful");
	

	public jpaDao(String url, String user, String pass) {
		this.url=url;
		this.user=user;
		this.pass=pass;
	}
	
	@SuppressWarnings("deprecation")
	public boolean getConnection() {
		try {
	        if (conn == null || conn.isClosed()) {
	            try {
	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
	                throw new SQLException(e);
	            }
	            conn = DriverManager.getConnection(url, user, pass);
	        }
	        return true;
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
//	public List<candidate> showCandidates() {
//		List<candidate> list=new ArrayList<>();
//		try {
//			Statement stmt=conn.createStatement();
//			ResultSet RS=stmt.executeQuery("SELECT * FROM ehdokas");
//			while (RS.next()){
//				candidate f=new candidate();
//				f.setId(RS.getInt("id"));
//				f.setCandidateFirstName(RS.getString("etunimi"));
//				f.setCandidateLastName(RS.getString("sukunimi"));
//				f.setCandidateParty(RS.getString("puolue"));
//				list.add(f);
//			}
//			return list;
//		}
//		catch(SQLException e) {
//			return null;
//		}
//	}
	
	public List<candidate> showCandidates() {
	List<candidate> list=new ArrayList<>();
	
		EntityManager em=emf.createEntityManager();
		em.getTransaction().begin();
		list = em.createQuery("select e from ehdokas e").getResultList();		
		em.getTransaction().commit();
	
		return list;
}
	
	

}
