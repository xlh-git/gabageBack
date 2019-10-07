<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>后台管理系统</title>
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>
 <div  style="display:none"  class="layui-btn-group" id="add" >
    <button type="button" title="添加" class="layui-btn layui-btn-sm layui-icon layui-icon-add-circle" lay-event="add">添加</button>
  <button type="button"  title="刷新" class="layui-btn layui-btn-sm layui-icon layui-icon-refresh-3" lay-event="flush">刷新</button>
</div>
  <div>  
  <table id="demo" lay-filter="test"></table>
  </div>
  	<script type="text/html" id="usertoolbar">
     <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
</script>
<script src="js/jquery-1.9.1.js"></script>
<script src="layui/layui.js"></script>
<script>
layui.use(['layer', 'form','table', 'element'],function(){
	var layer = layui.layer; 
	var form = layui.form;
	var element = layui.element;
	var table =layui.table;	
	var tableIn = table.render({
		id:'xlh'
	    ,elem: '#demo'
	    ,height:'full-200'
	    ,url: "selAllUser" //数据接口
	    ,defaultToolbar:['filter', 'exports']
	    ,toolbar:"#add"
	    ,page:false
	    ,parseData:function(res){
	    	return{
	    		"code":0
	    		,"msg":""
	    		,"data":res
	    	}
	    }
	 ,cols: [[ //表头 
			{title : '序号',type:'numbers',width:100,fixed:'left'}
		   ,{field: 'username', title: '账户名',align: 'center'}
	      ,{field: 'password', title: '密码', align: 'center'}
	      ,{field: 'name',title:'权限',align: 'center',sort:true} 
	      ,{ title: '操作', align: 'center',toolbar :'#usertoolbar'} 
	    ]]
	  });
	
	window.GetValue=function(obj){
		setTimeout(function(){  //使用  setTimeout（）设置延时更新 防止有时候数据还没刷新到数据库
			table.reload('xlh', {
				  url: "selAllUser"
				  ,where: {} //设定异步数据接口的额外参数
				});
			},500);
	}
	
	
	table.on('toolbar(test)', function(obj){
		  switch(obj.event){
		    case 'add':
		    	layer.open({
					type : 2,
					area : [ '450px', '350px' ],
					fixed : false, //不固定
					maxmin : false,
					content : 'useradd.jsp',
					shade:false
				});
		    break;
		    case 'flush':
		    	tableIn.reload({
				});	
		    break;	  
		  };
		});			
	table.on('tool(test)',function(obj){
		var data=obj.data
		 var layEvent = obj.event;	
	/* 	  if(obj.event === 'change'){
			  layer.open({
					type : 2,
					area : ['450px', '350px' ],
					fixed : false, //不固定
					maxmin : false,
					title:"修改用户权限",
					content :'userAuthority.jsp',
					shade:false
				});	 
	    } */
/* 		  else if(obj.event=='save'){
			  layer.confirm('您确认要保存吗？', {
				  btn: ['确定','取消'] //按钮
			  }, function(){
			layer.msg('保存成功',{time:1*500,icon: 1});
			  })
		  } */
		if(obj.event=='del'){
			  layer.confirm('您确认要删除吗？', {
				  btn: ['确定','取消'] //按钮
			  }, function(){		
				  $.post("delUserByUsername",
							{"username":data.username},
							function(data){
								layer.msg(""+data.delUser,{time:1*500,icon: 1});
								tableIn.reload({
						});
							},
							"json"
					);
			  })
		  }
	})
	
	
	});

</script>
</body>
</html>