<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.9.1.js"></script>
<script src="layui/layui.js"></script>
</head>
<body>

	<div class="login.css" id="LAY-user-login">
		<div class="login-main">
			<div class="login-box login-header">
				<h2>用户登录</h2>
			</div>
			<div class="login-box login-body layui-form">
				<form class="layui-form" action="login" method="post">
					<div class="layui-form-item">
						<label class="login-icon layui-icon layui-icon-username"></label>
						<input type="text" name="username" id="username" lay-verify="required" placeholder="用户名"
							class="layui-input">
					</div>
					<div class="layui-form-item">
						<label class="login-icon layui-icon layui-icon-password"></label>
						<input type="password" name="password" lay-verify="required" placeholder="密码"
							class="layui-input">
					</div>
					<div class="layui-form-item">
						<button class="layui-btn layui-btn-fluid" id="login" lay-submit=""
							 lay-filter="*">立即登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<%-- <%
     String x=(String) session.getAttribute("error"); // JSP片段中定义变量
%> --%>
</body>
<script type="text/javascript">
url = window.location.search;
var istrue= url.substring(url.lastIndexOf('=') + 1, url.length);
<%-- var x = '<%=x%>' ; --%>
if(istrue==1){
	alert("账号或者密码错误");	
}

	layui.use([ 'layer', 'form' ], function() {
		var layer = layui.layer;
		var form = layui.form;
		/* form.on('submit(*)', function(data){		
			  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			}); */
	});
</script>
</html>