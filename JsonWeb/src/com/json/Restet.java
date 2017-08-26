package com.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import Bean.Person;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class Restet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5474520719331397976L;

	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		   String sz=req.getParameter("jsonlist");
		   System.out.println(sz);
		   List<Person> list=new ArrayList<Person>();
		   Gson gson=new Gson();
		   list=gson.fromJson(sz,new TypeToken<List<Person>>() {
			          }.getType());
		   System.out.println("前台传入的jsonlist》》》"+list.size());
	       String personList=gson.toJson(list);
	        req.setAttribute("personList",personList);
	       
			RequestDispatcher rd =req.getRequestDispatcher("sy.jsp");
			rd.forward(req,res);
	        
	}
	

}
