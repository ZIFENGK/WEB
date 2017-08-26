package com.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import com.google.gson.Gson;

import Bean.Person;



public class Longsin extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5474520719331397976L;

	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		   String sz=req.getParameter("sz");
		   System.out.println("前台传入的数组》》》"+sz);
	        List<Person> list=new ArrayList<Person>();
	        Person person=new Person();
	        person.setId(1);
	        person.setName("dd");
	        person.setPassword("1234");
	        Person person2=new Person();
	        person2.setId(2);
	        person2.setName("cc");
	        person2.setPassword("13546");
	        list.add(person);
	        list.add(person2);
	        Gson gson=new Gson();
	        String personList=gson.toJson(list);
	        req.setAttribute("personList",personList);
	       
			RequestDispatcher rd =req.getRequestDispatcher("logsin.jsp");
			rd.forward(req,res);
	        
	}
	

}
