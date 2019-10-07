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
	<table id="demo" id="test" lay-filter="test"></table>
</body>

<script src="js/jquery-1.9.1.js"></script>
	<script src="layui/layui.js"></script>
		<script type="text/html" id="toolbarDemo">
     <button id='save' class="layui-btn layui-btn-xs" lay-event="isread">已读</button>
     <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
</script>

<script type="text/html" id="headTool">
 <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="allRead">一键已读</button>
    <button class="layui-btn layui-btn-sm" lay-event="delChoose">删除选中</button>
    <button class="layui-btn layui-btn-sm" lay-event="delRead">删除已读</button>
  </div>
</script>

		<script type="text/javascript">
	       var updateid=[];
	       var delid=[];
		layui.use(['layer', 'form','table','element','jquery'],function(){
			var layer = layui.layer; 
			var form = layui.form;
			var element = layui.element;
			var table =layui.table;	
			var $=layui.jquery
			var tableIn=table.render({
				id : 'xlh',
				elem : '#demo',
				height : 'full-100',
				url : 'selAllFeedback' ,//数据接口
			    page : false,
			    toolbar: '#headTool', //开启头部工具栏，并为其绑定左侧模板
			/*     limit:50,
			    limits:[10,30,50,70,100],
				request : {
				pageName : 'curr' //页码的参数名称，默认：page
				,limitName : 'nums' //每页数据量的参数名，默认：limit
				},
				done: function(res, curr, count){
					NowPage=curr;
				}, */
				parseData : function(res) {
				return {
				"code" : 0,
				"msg" : "",
				"count" : 1000,
				"data" : res
				}
				},
				cols : [[ //表头 
					    {type: 'checkbox', fixed: 'left'},
						{title : '序号',type:'numbers',width:100},
						{field : 'feedbackmessage',title : '错误信息',align : 'center'},
						{field : 'name',title : '所属类别',align : 'center',sort:true}, 
						{ field: 'fid', title: '状态',templet: ZhuangTai, align: 'center'},
						{title : '操作',align : 'center',toolbar :'#toolbarDemo'} 
						]]
						});
				
				function ZhuangTai(data) {
					var isread = data.isread;
					if (isread == 0) {
					return "已读";
					}
					if (isread == 1) {
					return '<a class=""style="color:red">未读</a>';
					}
					}
			 table.on('toolbar(test)', function(obj){
				    var checkStatus = table.checkStatus(obj.config.id);
				    switch(obj.event){
				      case 'allRead':
				        var data = checkStatus.data;
				        var length=data.length;
					for(var i=0;i<length;i++){
						updateid[i]=data[i].id	
						$.post("updFeedback",
								{"id":updateid[i]},
								function(data){
								},
								"json"
						);
						if(i==length-1){
							tableIn.reload({
							});
						}
					}	 
				      break;
				      case 'delChoose':
				        var data = checkStatus.data;
				        var length=data.length;
				        for(var i=0;i<length;i++){
				        	delid[i]=data[i].id	
				    	$.post("delFeedback",
								{"id":delid[i]},
								function(data){
								},
								"json"
						);
				        	if(i==length-1){
								tableIn.reload({
								});
							}
				        }
				      break;
				      case 'delRead':
				    	     var data = checkStatus.data;
						        var length=data.length;
						       for(var i=0;i<length;i++){
						    		delid[i]=data[i].id	
								if(data[i].isread==0){
									$.post("delFeedback",
											{"id":delid[i]},
											function(data){
											},
											"json"
									);			
								}
								if(i==length-1){
									tableIn.reload({
									});
								}
							}	 
				      break;
				    };
				  });
		
			 table.on('tool(test)',function(obj){
					var data=obj.data
					 var layEvent = obj.event;	
					  if(obj.event === 'isread'){
							$.post("updFeedback",
									{"id":data.id},
									function(data){
										tableIn.reload({
										});
									},
									"json"
							);
						  
					  }
					  if(obj.event === 'del'){
						  if(data.isread==1){
							  layer.confirm('还没读过此消息 是否删除', {
								  btn: ['确定','取消'] //按钮
								}, function(index){		  
									  $.post("delFeedback",
												{"id":data.id},
												function(data){
													tableIn.reload({
													});
												},
												"json"
										);
									  layer.close(index);    
								})
						  }
						  else{
							  
							  $.post("delFeedback",
										{"id":data.id},
										function(data){
											tableIn.reload({
											});
										},
										"json"
								);  
						  }
						
					  }
				 
			 })
		})
		</script>
</html>