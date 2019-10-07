<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <select id="tname" name='tname' lay-verify='' lay-search=''>
        <option value="1" >可回收物</option>
        <option value="2">有害垃圾</option>
        <option value="3">干垃圾</option>
        <option value="4">湿垃圾</option>
    </select>
</body>
<script src="js/jquery-1.7.2.js"></script>
	<script src="layui/layui.js"></script>
	<script type="text/javascript">
 $("#tname").val(3); 
 </script>
</html>