	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>后台管理系统</title>
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">垃圾分类管理界面</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <c:forEach items="${user.elements }" var ="ele">
	<c:if test="${ele.eleno eq 'checkData' }">
      <li class="layui-nav-item"><a id="1111">前台图片管理</a></li>
      <li class="layui-nav-item"><a id="dataCheck">数据审核</a></li>
          	</c:if>
    </c:forEach>     
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="login.jsp">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">垃圾种类</a>
          <dl class="layui-nav-child">         
            <dd class="layui-this"><a id="link1">湿垃圾</a></dd>
            <dd><a id="link2">干垃圾</a></dd>
            <dd><a id="link3">可回收物</a></dd>
            <dd><a id="link4">有害垃圾</a></dd>
             <dd><a id="link0">全部</a></dd>
          </dl>
        </li>
        <c:forEach items="${user.elements }" var ="ele">
	<c:if test="${ele.eleno eq 'userAccount' }">
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">账号管理</a>
          <dl class="layui-nav-child">
               <dd><a id="userAccount">账号汇总</a></dd>
               <dd><a id="userAuthority">权限详情</a></dd>
          </dl>
        </li>
        	</c:if>
    </c:forEach>
      </ul>
    </div>
  </div>
  
    <!-- 内容主体区域 -->
   <div class="layui-body"> 
   <iframe  src="selByType.jsp?tid=3" id="forward"  width="1200" height="570" scrolling="no" frameborder="0">   
    </iframe>
  </div> 
 </div>
<script src="layui/layui.js"></script>
<script src="js/jquery-1.9.1.js"></script>
<script>
layui.use('element', function(){
var element = layui.element;
});
$("#link0").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","selByType.jsp?tid=0");
})

$("#link1").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","selByType.jsp?tid=3");
})

$("#link2").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","selByType.jsp?tid=4");
})

$("#link3").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","selByType.jsp?tid=1");
})

$("#link4").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","selByType.jsp?tid=2");
})

$("#userAccount").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","userAccount.jsp");
})

$("#userAuthority").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","authorityMessage.jsp");
})

$("#dataCheck").click(function(){
	$("Iframe").removeAttr("src");
	$("Iframe").attr("src","dataCheck.jsp");
})
</script>
</body>
</html>