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

    public static boolean editCandidate(ehdokas ehdokas) {
    	EntityManager em=getEntityManager();
    	if (em!=null) {
    		em.getTransaction().begin();
    		em.merge(ehdokas);
    		em.getTransaction().commit();
    		return true;
    	}
    	return false;
    }
    
}