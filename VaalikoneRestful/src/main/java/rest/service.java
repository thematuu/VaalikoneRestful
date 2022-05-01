package rest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import dao.Dao;
import dao.jpaDao;
import data.ehdokas;



@Path("/service")
public class service {
	
	private jpaDao jpaDao = null;
	ehdokas ehdokas;


    @GET
    @Path("/getall")
    @Produces(MediaType.APPLICATION_JSON)
    public List<ehdokas> getAll(){
        return jpaDao.getEhdokas();
    }
    
    @GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEhdokas/{id}")
	public data.ehdokas getEhdokas(@PathParam("id") int number) {
		List<ehdokas> list=(List<data.ehdokas>) getEhdokas(number);
		try {
			return list.get(number);
		}
		catch(IndexOutOfBoundsException e) {
			return null;
		}
	}
    
   @PUT
   @Path("/edit/{id}")
   @Produces(MediaType.APPLICATION_JSON)
   @Consumes(MediaType.APPLICATION_JSON)
    public boolean editCandidate(@FormParam ("id")int id,String etunimi, String sukunimi, String puolue) {
	   	ehdokas ehdokas2 = new ehdokas();
	   	ehdokas2.setId(id);
	   	ehdokas2.setEtunimi(etunimi);
	   	ehdokas2.setSukunimi(sukunimi);
	   	ehdokas2.setPuolue(puolue);
		return jpaDao.editCandidate(ehdokas);
    }
}
