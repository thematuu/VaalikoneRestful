package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import data.ehdokas;

public class JpaDao {
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
