package com.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import Bean.Person;

import com.google.gson.Gson;

public class ajaxTest  extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6491691910288598352L;
	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		System.out.println("进入程序");
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
        //测试list<Map<String,Object>>
        List<Map<String, Object>> maps=new ArrayList<Map<String,Object>>();
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("id",11);
        map.put("name","king");
        map.put("ah","足球");
        map.put("tz","52kg");
        map.put("sg","175");
        Map<String, Object> map2=new HashMap<String, Object>();
        map2.put("id",112);
        map2.put("name","goo");
        map2.put("ah","台球");
        map2.put("tz","58kg");
        map2.put("sg","175");
        maps.add(map); 
        maps.add(map2);
        
        Gson gson=new Gson();
        String json=gson.toJson(maps);
        System.out.println("返回数据"+json);
        //设置编码
        response.setCharacterEncoding("utf-8");
        //写入到前台
        response.getWriter().write(json);
	}

}
