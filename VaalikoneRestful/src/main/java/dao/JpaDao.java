package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import data.ehdokas;
/**
 * Model in MVC
 *
 */
public class JpaDao {
    private static EntityManagerFactory emf;
    private static EntityManager getEntityManager() {
        if (emf==null) {
            emf=Persistence.createEntityManagerFactory("jpaehdokas");
        }
        return emf.createEntityManager();
    }
    
    /**
	 * creates a list of all candidates from the database
	 *
	 */
    public static List<ehdokas> getEhdokas(){
        EntityManager em=getEntityManager();
        List<ehdokas> list=em.createQuery("select a from ehdokas a").getResultList();
        em.close();
        return list;
    }
    /**
	 * creates a list of all parties from the database
	 *
	 */
    public static List<ehdokas> getPuolue(){
        EntityManager em=getEntityManager();
        List<ehdokas> list=em.createQuery("select a from puolueet a").getResultList();
        em.close();
        return list;
    }
    /**
	 * adds a candidate to the database
	 *
	 */
    public static boolean addEhdokas(ehdokas ehdokas) {
        EntityManager em=getEntityManager();
        if (em!=null) {
            em.getTransaction().begin();
            em.persist(ehdokas);
            em.getTransaction().commit();
            em.close();
            return true;
        }
        return false;
    }
    /**
	 * deletes a candidate from the database
	 *
	 */
    public static boolean deleteEhdokas(int id) {
        EntityManager em=getEntityManager();
        ehdokas e=em.find(ehdokas.class, id);
        if (e!=null) {
            em.getTransaction().begin();
            em.remove(e);
            em.getTransaction().commit();
            em.close();
            return true;
        }
        return false;
    }
    /**
	 * edits a candidate in the database
	 *
	 */
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
