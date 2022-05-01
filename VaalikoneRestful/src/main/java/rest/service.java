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
	
	public void init() {
		jpaDao = new jpaDao("jdbc:mysql://localhost:3306/db_vaalikone", "root", "root");
	}


    @GET
    @Path("/getall")
    @Produces(MediaType.APPLICATION_JSON)
    public List<ehdokas> getAll(){
        return jpaDao.getEhdokas();
    }

//    @PUT
//    @Path("/edit/{id}")
//    public boolean editCandidate(@PathParam("id") int id) {
//        return jpaDao.updateEhdokas(id);
//    }
}
