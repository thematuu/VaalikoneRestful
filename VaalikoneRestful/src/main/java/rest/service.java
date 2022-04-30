package rest;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import dao.jpaDao;
import data.candidate;

@Path("/service")
public class service {
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("VaalikoneRestful");
	
	private static final long serialVersionUID = 1L;
	private jpaDao jpaDao = null;
	
	public service() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void init() {
		jpaDao = new jpaDao("jdbc:mysql://localhost:3306/db_vaalikone", "root", "root");
	}
	
	
	
	@GET
	@Path("/getallcandidates")
	@Produces(MediaType.APPLICATION_JSON)
	public List<candidate> getAllCandidates() {
		List<candidate> list = null;
		if (jpaDao.getConnection()) {
			list = jpaDao.showCandidates();
		} else {
			System.out.println("No connection to the database!");
		}
		
		return list;
	}
	
//	@GET
//	@Path("/getallcandidates")
//	@Produces(MediaType.APPLICATION_JSON)
//	public List<candidate> showCandidates() {
//		List<candidate> list=new ArrayList<>();
//		
//			EntityManager em=emf.createEntityManager();
//			em.getTransaction().begin();
//			list = em.createQuery("select e from ehdokas e").getResultList();		
//			em.getTransaction().commit();
//		
//			return list;
//	}
}
