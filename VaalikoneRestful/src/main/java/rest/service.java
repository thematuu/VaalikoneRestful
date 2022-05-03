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
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


import dao.JpaDao;
import data.ehdokas;

@Path("/service")
public class service {

    @GET
    @Path("/getall")
    @Produces(MediaType.APPLICATION_JSON)
    public List<ehdokas> getAll(){
              return JpaDao.getEhdokas();
    }

    
   @POST
   @Path("/edit")
   @Produces(MediaType.APPLICATION_JSON)
   @Consumes(MediaType.APPLICATION_JSON)
    public boolean editCandidate(ehdokas ehdokas) {
		return JpaDao.editCandidate(ehdokas);
    }

    @DELETE
    @Path("/delete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public boolean deleteBook(@PathParam("id") int id) {
        return JpaDao.deleteEhdokas(id);
    }
}
