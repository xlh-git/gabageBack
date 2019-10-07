<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>
  <div>  
  <table id="demo" lay-filter="test"></table>
  </div>
</body>


<script src="js/jquery-1.9.1.js"></script>
<script src="layui/layui.js"></script>
<script type="text/javascript">
var x=[];

layui.use(['layer', 'form','table', 'element'],function(){
	var value;
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
	      ,{field: 'name',title:'用户身份',align: 'center',sort:true}
	      ,{field:'message',title:'权限修改',align:'center',event:'change'} 
	    ]]
	  });
	
	table.on('tool(test)',function(obj){
		var data=obj.data
		 var layEvent = obj.event;	
		  if(obj.event === 'change'){
			  $.post("selAuthorityByrid",{"rid":data.rid},
					  function(data)
					  {
				  data = eval("("+data+")")
				  value=data.eid
					layer.open({
						type : 2,
						area : ['450px', '350px' ],
						fixed : false, //不固定
						maxmin : false,
						title:"修改用户权限",
						content :'userAuthority.jsp?value='+value,
						shade:false,
						yes: function(index, layero){
						    //do something
						    layer.close(index);
						}
					}); 
					  })				  
	    }
	})
	
})

</script>
</html>