<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logsin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style>
  td{width:80px;height: 20px;}
  </style>
  <body>
  <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
  <script>
  $(document).ready(function(){
  
 var a = new Array();
  a.push(12);
  a.push(23);
  var k=$("#sz");
  k.attr("value",a);
});
 function  ajax(){
   $.ajax({  
    type: "POST",  
    url:"ajaxss",  
    async: false, 
    dataType:"json", 
    error: function(data) {  
        alert("Connection error");  
    },  
    success: function(data) {  
    // alert(data);
   // var k=eval("("+data+")");
  //  var k= $.parsejson(data);
  //var k=data;
   // alert(data[0].id);
   //alert(data[0].name);
   var tb=$("#tb");
     for(var i=0; i<data.length;i++){
     var tt="<tr><td>"+data[i].id+"</td><td>"+data[i].name+"</td><td>"+data[i].ah+"</td><td>"+data[i].sg+"</td>"+"</td><td>"+data[i].tz+"</td></tr>";
       tb.append(tt);
     }
    }  
    });
  }
  </script>
  <h2>${personList} </h2>
  <form action="logsin" method="post">
     <input type="hidden" value="" name="sz" id="sz">
   <input type="submit" value="提交">
   </form>
  <form action="rege" method="post" id="yourformid">
  <input type="hidden" name="jsonlist"  value=${personList}  >
  <input type="text" name="jsonlist11"  value="" >
  <input type="submit" value="再次提交">
  <input type="button"  onclick="ajax()"     value="ajax测试">
  </form>
  <table id="tb">
  <tr><td >人员id</td><td>姓名</td><td>爱好</td><td>身高</td><td>体重</td></tr>
  </table>
  
  </body>
</html>
