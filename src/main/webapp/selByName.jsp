<%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>后台管理系统</title>
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body class="layui-layout-body">
  <div class="layui-body">
   　<form action="" onsubmit="false" method="post">
 <div class="layui-form-item">
    <label class="layui-form-label">查询</label>
    <div class="layui-input-inline">
      <input id="search" type="text" name="title"  autocomplete="off" placeholder="请输入想要查找的物品" class="layui-input">  
      <input id="hiddenText" type="text" style="display:none" />
    </div>
    <button id="submit" type="button" class="layui-btn">提交</button>   
     <button  style="position:relative; left:450px;" type="button" class="layui-btn" onclick="add()">添加</button>
  </div>
       </form> 
		<table id="demo" lay-filter="test"></table>
    </div>
    <script type="text/html" id="toolbarDemo">
     <a class="layui-btn layui-btn-xs" lay-event="save">保存</a>
     <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="js/jquery-1.7.2.js"></script>
<script src="layui/layui.js"></script>
<script>
url = window.location.search;
var name= url.substring(url.lastIndexOf('=') + 1, url.length);
var total;
var curr;
function selCount(){
	$.post("selCountByName?name="+name,
			function(data){
		data = eval("("+data+")")
		total=data.total;
			})
}
window.onload=selCount;

layui.use('element', function(){
var element = layui.element;
layui.use([ 'layer', 'form', 'element' ], function() {
	var layer = layui.layer, form = layui.form, element = layui.element
});
var NowPage;
layui.use('table', function(){
	  var table = layui.table;
	 var tableIn=table.render({
		id:'xlh'
	    ,elem: '#demo'
	    ,height:'full-100'
	    ,url: "selByName?name="+name //数据接口
	    ,page:true
	    ,limit:50
	    ,request: {
	    pageName: 'curr' //页码的参数名称，默认：page
	    ,limitName: 'nums' //每页数据量的参数名，默认：limit
	      },
	      done: function(res, curr, count){
	    	 NowPage=curr;
			
		 }
	    ,parseData:function(res){
	    	return{
	    		"code":0
	    		,"msg":""
	    		,"count":total
	    		,"data":res
	    	}
	    }
	 ,cols: [[ //表头 
	      {field: 'no', title: 'No',width:70,align: 'center', sort: true}
	      ,{field: 'gname', title: '垃圾名称',align: 'center',edit:'text'}
	      ,{field: 'tname', title: '垃圾类别', align: 'center', event: 'change'}
	      ,{ title: '操作', align: 'center',toolbar :'#toolbarDemo'} 
	    ]]
	  });
	 table.on('tool(test)',function(obj){
			var data = obj.data;
			 if(obj.event === 'change'){
		    	  layer.prompt({
		    	        formType: 2
		    	        ,title: '修改垃圾名为 ['+ data.gname +'] 的类别'
		    	        ,value: data.tname
		    	      }, function(value, index){
		    	        layer.close(index);
		    	        
		    	        //这里一般是发送修改的Ajax请求
		    	        
		    	        //同步更新表格和缓存对应的值
		    	        obj.update({
		    	          tname: $("#xx").find("option:selected").text()
		    	        });
		    	      });
		    	  $(".layui-layer-content").html("<div><select id=\"xx\" style=\"position: relative; left: 80px; top: 7px;\" name=\'tname\' lay-verify=\'\' lay-search=\'\'> <option value=\"1\">可回收物</option> <option value=\"2\">有害垃圾</option> <option value=\"3\">湿垃圾</option><option value=\"4\">干垃圾</option></select></div>")
		    	  $("#xx").val(data.tid);
		    	 
		    }		
			 var layEvent = obj.event;
				console.log(layEvent);
				switch(obj.event){
			    case 'save':
			    	layer.confirm('您确认要保存吗？', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							layer.close(layer.index); 
							obj.update({
								gname:data.gname
				    	        });
							$.get("updGarbage",
									{"name":data.gname,"tname":data.tname,"count":data.count,"id":data.id},
									"json"
							);
						});
			    break;
			    case 'del':
			    	layer.confirm('您确认要删除吗？', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							
							layer.close(layer.index);
							$.post("delGarbage",
									{"name":data.gname},
									"json"
							);
							tableIn.reload({
                            page: {
							 curr:NowPage 
									  }
									});
						});
			    break;
				}
		});
	
	
	});
});
/* function  searchByName(){
	var name=$("#search").val();
	console.log(name);
	window.location.href="selByName.jsp?name="+name;	
}*/
/*  $(function(){ 
	$(document).keydown(function(event){ 
	if(event.keyCode==13){ 
	$("#submit").click(); 
	} 
	});
})   */
$('#search').bind('keypress',function(event){
	var search = $(this).val();		
	if(event.keyCode == '13'&&search!="")
	{
		$("#submit").click();
	}
	else{
		alert("请输入要查询的内容");
	}
});

	$("#submit").click(function(){ 
		var x=$("#search").val();
		if(x!=""){
		window.location.href="selByName.jsp?name="+x;
		}
		else if(event.keyCode == '13'&&search==""){
			alert("请输入要查询的内容");
			$('#search').focus();
		}
		}); 	
		function add(){
			layer.open({
				  type: 2,
				  area: ['500px', '300px'],
				  fixed: false, //不固定
				  maxmin: false,
				  content: 'addGarbage.jsp',
		});
		}
		
		function GetValue(obj){
			setTimeout(function(){  //使用  setTimeout（）设置延时更新 防止有时候数据还没刷新到数据库
				window.location.href="selByName.jsp?name="+obj;
				},500);
			
		}

</script>
</body>
</html> --%>