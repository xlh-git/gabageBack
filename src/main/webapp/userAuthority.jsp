<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<title>Insert title here</title>
</head>
<body>

	<form class="layui-form">
	     <div class="layui-form-item">
    <div class="layui-input-block">
      <input type="checkbox" name="authority" value='1' title="垃圾管理">
      <input type="checkbox" name="authority" value='2' title="数据审核和管理">
      <input type="checkbox" name="authority" value='3' title="用户管理">
    </div>
  </div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" onclick="change()" lay-submit=""
						lay-filter="*">立即提交</button>
				</div>
			</div>
		</form>
</body>
<script src="js/jquery-1.9.1.js"></script>
	<script src="layui/layui.js"></script>
<script type="text/javascript">
value = window.location.search;
value=value.substring(value.lastIndexOf('=') + 1, value.length);
var x=value.split(',')
/* <c:forEach items="${user.elements }" var ="ele">
$("input[name='authority'][value=${ele.id}]").attr("checked",true);
</c:forEach> */
 $(function(){
	 for(i in x){	
	var value=x[i]-1
		 $("input[name='authority']").eq(value).prop("checked",true);
			}
/* $.post("selAuthorityByrid",{"rid":rid},
		function(data){
	data = eval("("+data+")")
	
})	 */
}); 
 
layui.use(['form'],function(){
	   var form=layui.form;
	   form.render();
	   form.on('submit(*)', function(data) {
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	});
	function change() {
		obj = document.getElementsByName("authority");
	    check_val = [];
	    for(k in obj){
	        if(obj[k].checked)
	            check_val.push(obj[k].value);
	    }
		alert(check_val); 
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}
	</script>
</html>