package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.mysql.jdbc.PreparedStatement;

import data.ehdokas;

public class jpaDao {
	private static Connection conn;
	private String url;
	private String user;
	private String pass;
    private static EntityManagerFactory emf;
    
    public jpaDao(String url, String user, String pass) {
		this.url=url;
		this.user=user;
		this.pass=pass;
	}
    
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
    
    private static EntityManager getEntityManager() {
        if (emf==null) {
            emf=Persistence.createEntityManagerFactory("jpaehdokas");
        }
        return emf.createEntityManager();
    }
    
    
    public static List<ehdokas> getEhdokas(){
        EntityManager em=getEntityManager();
        List<ehdokas> list=em.createQuery("select a from ehdokas a").getResultList();
        em.close();
        return list;
    }

    public static void updateEhdokas(int id) {
        
        
    }
}