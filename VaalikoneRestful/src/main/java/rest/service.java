package rest;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
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
	
//	@PUT
//	@Path("/updatefish")
//	@Produces(MediaType.APPLICATION_JSON)
//	@Consumes(MediaType.APPLICATION_JSON)
//	public List<candidate> updateCanditate(candidate candidate) {
//		EntityManager em=emf.createEntityManager();
//		em.getTransaction().begin();
//		candidate f=em.find(candidate.class, candidate.getId()); //select * from fish where id=fish.getId()
//		if (f!=null) {
//			em.merge(candidate);//The actual update line
//		}
//		em.getTransaction().commit();
//		//Calling the method readFish() of this service
//		List<candidate> list=readCandidate();		
//		return list;
//	}	
	
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
