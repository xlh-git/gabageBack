<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>后台管理系统</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>

   <div  style="display:none"  class="layui-btn-group" id="add" >
    <button type="button" title="添加" class="layui-btn layui-btn-sm layui-icon layui-icon-add-circle" lay-event="add">添加</button>
  <button type="button"  title="刷新" class="layui-btn layui-btn-sm layui-icon layui-icon-refresh-3" lay-event="flush">刷新</button>
</div>

  <div>
   　<form  class="layui-form" action="" onsubmit="false" method="post">
 <div class="layui-form-item">
    <label class="layui-form-label">查询</label>
    <div class="layui-input-inline">
      <input id="search" type="text" name="title"  autocomplete="off" placeholder="请输入想要查找的物品" class="layui-input">  
    </div>
     <div class="layui-input-inline">
      <select id="garbageType" name="garbageType" lay-filter="garbageType">
        <option value="0" selected="">请选择垃圾种类</option>
        <option value="3">湿垃圾</option>
        <option value="4">干垃圾</option>
        <option value="1">可回收物</option>
        <option value="2">有害垃圾</option>   
      </select>
      </div>
      <input id="hiddenText" type="text" style="display:none" />
    
    <button id="submit" type="button" class="layui-btn">提交</button>      
  </div>
       </form> 
		<table id="demo" lay-filter="test"></table>
    </div>
    <script src="js/jquery-1.9.1.js"></script>
	<script src="layui/layui.js"></script>
	<script type="text/html" id="toolbarDemo">
     <button id='save' class="layui-btn layui-btn-xs" lay-event="save">保存</button>
     <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
</script>
	<script type="text/javascript">
	var total;
		url = window.location.search;
		var tid = url.substring(url.lastIndexOf('=')+1, url.length);
		var NowPage;
		function selCountByTid(){
			$.post("selCountByTid?tid="+tid,
					function(data){
				data = eval("("+data+")")
				total=data.total;
		})
		}
	
		window.onload=selCountByTid;		
		layui.use(['layer', 'form','table', 'element'],function(){
			var layer = layui.layer; 
			var form = layui.form;
			var element = layui.element;
			var table =layui.table;	
			var tableIn = table.render({
			id : 'xlh',
			elem : '#demo',
			height : 'full-100',
			url : 'selByTypeId?tid='+tid ,//数据接口
			toolbar:"#add",
			defaultToolbar:['filter', 'exports'],
		    page : true,
		    limit:50,
		    limits:[10,30,50,70,100],
			request : {
			pageName : 'curr' //页码的参数名称，默认：page
			,limitName : 'nums' //每页数据量的参数名，默认：limit
			},
			done: function(res, curr, count){
				NowPage=curr;
			},
			parseData : function(res) {
			return {
			"code" : 0,
			"msg" : "",
			"count" : total,
			"data" : res
			}
			},
			cols : [[ //表头 
					{title : '序号',type:'numbers',width:100,fixed:'left'},
					{field : 'gname',title : '垃圾名称',align : 'center',edit:'text',event:'edit'}, 
					{field : 'tname',title : '垃圾类别',align : 'center', event: 'change'},
					{field : 'count',title : '点击量',align : 'center',sort:true},
					{title : '操作',align : 'center',toolbar :'#toolbarDemo'} 
					]]
					});
		
			window.GetValue=function(obj){
				setTimeout(function(){  //使用  setTimeout（）设置延时更新 防止有时候数据还没刷新到数据库
					table.reload('xlh', {
						  url: "selByName?name="+obj
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
							content : 'addGarbage.jsp',
							shade:false
						});
				    break;
				    case 'flush':
				    	tableIn.reload({
		                    page: {
							 curr: NowPage 
							}
						});	
				    break;
				  
				  };
				});			
			
			table.on('tool(test)',function(obj){
				var data=obj.data
				 var layEvent = obj.event;	
				    if(obj.event === 'change'){
				    	  layer.prompt({
				    	        formType: 2
				    	        ,title: '修改垃圾名为 ['+ data.gname +'] 的类别'
				    	        ,value: data.tname
				    	      }, function(value, index){
				    	        layer.close(index);
				    	        obj.update({
				    	          tname: $("#xx").find("option:selected").text()
				    	        });
				    	      });
				    	  $(".layui-layer-content").html("<div><select id=\"xx\" style=\"position: relative; left: 80px; top: 7px;\" name=\'tname\' lay-verify=\'\' lay-search=\'\'> <option value=\"1\">可回收物</option> <option value=\"2\">有害垃圾</option> <option value=\"3\">湿垃圾</option><option value=\"4\">干垃圾</option></select></div>")
				    	  $("#xx").val(data.tid);    	 
				    }			    				
					switch(obj.event){
				    case 'save':
				    	layer.confirm('您确认要保存吗？',{
							  btn: ['确定','取消'], //按钮
							 success:function(){
								this.enterEsc = function (event) {
									if (event.keyCode === 13) {
										$(".layui-layer-btn0").click();
										$.post("updGarbage",
												{"name":data.gname,"tname":data.tname,"count":data.count,"id":data.id},
												function(data){
													layer.msg(""+data.updInfo,{time:1*500,icon: 1});
													tableIn.reload({
																});
												},
												"json"
										);
										return false; //阻止系统默认回车事件
									}
								};
								$(document).on('keydown', this.enterEsc); //监听键盘事件，关闭层
							
							},
							end:function(){	
								$(document).off('keydown',this.enterEsc); //解除键盘关闭事件
							}
						},						
						function (index) {//点击确定后执行的方法体
							$.post("updGarbage",
									{"name":data.gname,"tname":data.tname,"count":data.count,"id":data.id},
									function(data){
										layer.msg(""+data.updInfo,{time:1*500,icon: 1});
										tableIn.reload({
									});
									},
									"json"
							);
							layer.close(index);    //执行完后关闭
						});
				    break;
				    case 'del':
				    	layer.confirm('您确认要删除吗？', {
							  btn: ['确定','取消'], //按钮
							  success:function(){
									this.enterEsc = function (event) {
										if (event.keyCode === 13) {
											$(".layui-layer-btn0").click();
											$.post("delGarbage",
													{"name":data.gname},
													"json"
											);
											tableIn.reload({
			                                page: {
											 curr: NowPage 
											}
													});	
											return false; //阻止系统默认回车事件
										}else if(event.keyCode == 27){
											$(".layui-layer-btn1").click();
											return false; 
										}
									};
									$(document).on('keydown', this.enterEsc); //监听键盘事件，关闭层
								
								},
								end:function(){	
									$(document).off('keydown',this.enterEsc); //解除键盘关闭事件
								}
				    	},						
						function (index) {//点击确定后执行的方法体
				    		$.post("delGarbage",
									{"name":data.gname},
									"json"
							);
				    		tableIn.reload({
                                page: {
								 curr: NowPage 
								}
	                             });	
							layer.close(index);
						
						});					
				    break;
					}
			});	
			
			$('#search').bind('keypress',function(event){
				var search = $(this).val();		
				if(event.keyCode == '13'&&search!="")
				{
					$("#submit").click();
				}
				else if(event.keyCode == '13'&&search==""){
					alert("请输入要查询的内容");
					$('#search').focus();
				}
			});		
			
			$("#submit").click(function() {
			 	var name = $("#search").val();
			 	var tid=$("#garbageType option:selected").val();
                 console.log(tid)
			 	if(name!=""&tid==0){
						var total2;
							$.post("selCountByName?name="+name,
							function(data){
								data = eval("("+data+")")
								total2=data.total;
									})
						
						table.reload('xlh', {
							  url: "selByName?name="+name,
							  page : true,
							  parseData : function(res) {
									return {
									"code" : 0,
									"msg" : "",
									"count" : total2,
									"data" : res
									}
									}
							}); 
					}
			 	else if(name!=""&&tid!=0){
			 		var total3;
			 		$.post("selCountByNameAndTid?name="+name+"&tid="+tid,
							function(data){
								data = eval("("+data+")")
								total3=data.total;
								console.log(total3);
									})
			 		table.reload('xlh', {
						  url: "selByNameAndType?name="+name+"&tid="+tid,
						  page : true,
						  parseData : function(res) {
								return {
								"code" : 0,
								"msg" : "",
								"count" : total3,
								"data" : res
								}
								}
						}); 
			 	}
					else{
						alert("请输入要查询的内容");
						$('#search').focus();
					}
				});
			});		

	</script>
</body>
</html>