<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
    <title>统计表</title>
    <link rel="stylesheet" href="Css/bootstrap4alpha.css"/>
    <link rel="stylesheet" type="text/css" href="Css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="Css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="Css/shCore.css">
    <link rel="stylesheet" type="text/css" href="Css/demo.css">
    <style type="text/css" class="init">
        .right{
            font-size: 25px;
        }
        #light{
            width: 527px;
            float: left;
        }
        #Blight{
            background-color: #c8e5bc;
            float: right;
            
        }
        #example > thead > tr > th {
            text-align: center;
        }
    </style>
    <script type="text/javascript"  src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript"  src="js/jquery.dataTables.js"></script>
    <script type="text/javascript"  src="js/dataTables.bootstrap4.js"></script>
    <script type="text/javascript" src="js/dataTables.buttons.js"></script>
    <script type="text/javascript" src="js/buttons.bootstrap4.js"></script>
    <script type="text/javascript" src="js/jszip.js"></script>
    <script type="text/javascript" src="js/pdfmake.min.js"></script>
    <script type="text/javascript" src="js/vfs_fonts.js"></script>
    <script type="text/javascript"  src="js/buttons.html5.js"></script>
    <script type="text/javascript"  src="js/buttons.print.js"></script>
    <script type="text/javascript"  src="js/buttons.colVis.js"></script>
    <script type="text/javascript"  src="js/shCore.js"></script>
    <script type="text/javascript"  src="js/demo.js"></script>
    <script type="text/javascript"  >
    	var dataTable;
        $(document).ready(function() {

					var columName = [{"data":"日期"},{"data":"资产"},{"data":"资金"},{"data":"过账款"},{"data":"银行名"},{"data":"银行卡号"}];
			        for(var i =0;i<columName.length; i++){
			        	$("#example thead tr").append("<th>"+columName[i].data+"</th>");
			        }
			        var table = $('#example').DataTable( {
		                ordering: false,//是否启用排序
		                searching: true,//搜索
		                language: {
		                    lengthMenu: '显示 <select style="height: 35px;width: 100px">'+
		                    '<option value="5">5</option>'+
		                    '<option value="10">10</option>'+
		                    '<option value="20">20</option>'+
		                    '<option value="30">30</option>'+
		                    '<option value="40">40</option>'+
		                    '<option value="50">50</option>'+
		                    '<option value="-1">不限</option>'+
		                    '</select>',
		                    search: '<span class="label label-success">搜索：</span>',//右上角的搜索文本，可以写html标签
		
		                    paginate: {//分页的样式内容。
		                        previous: "上一页",
		                        next: "下一页",
		                        first: "第一页",
		                        last: "最后"
		                    },
		                    zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
		                    //下面三者构成了总体的左下角的内容。
		                    info: "总共_PAGES_ 页，显示第_START_ 到第 _END_ ，筛选之后得到 _TOTAL_ 条，初始_MAX_ 条 ",//左下角的信息显示，大写的词为关键字。
		                    infoEmpty: "0条记录",//筛选为空时左下角的显示。
		                    infoFiltered: ""//筛选之后的左下角筛选提示，
		                },
		                paging:true,
		                pagingType: "full_numbers",//分页样式的类型
		                data: dataTable,
		                lengthChange: true,
		                columns:columName,
//						dom: 'Bfltip',
		                'dom': '<"left"f>r<"right"<"#light"l><"Blight"B>>tip',
//		                'excel', 'pdf', 'print','colvis','csv','copy'
		                buttons: [ 'excel'],
		                createdRow : function ( row, data, index ) {
		                    $('td', row).css('font-weight',"bold").css("text-align","center");
		                },
		
		          } );
//			    },
//         	});    
        } );
    </script>

</head>
<body class="dt-example dt-example-bootstrap4">
<div class="container">
    <section>
        <div class="panel panel-default">
            <div class="panel-body">
                <table id="example" class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr id="table_tr"></tr>
                    </thead>
					<tbody>
					<tr>
						<td>2011/04/25</td>
						<td>$320,800</td>
						<td>$320,800</td>
						<td>$500,000</td>
						<td>中国银行</td>
						<td>6210987003698526489</td>
					</tr>
					<tr>
						<td>2011/04/25</td>
						<td>$350,000</td>
						<td>$350,000</td>
						<td>$600,000</td>
						<td>中国银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/25</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$800,000</td>
						<td>中国银行</td>
						<td>6218962700369852894</td>
					</tr>
					<tr>
						<td>2011/04/26</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>中国银行</td>
						<td>6965798700369852694</td>
					</tr>
					<tr>
						<td>2011/04/26</td>
						<td>$350,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>工商银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/26</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$500,000</td>
						<td>工商银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/26</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>工商银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>建设银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>建设银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$300,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>建设银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>农业银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$250,000</td>
						<td>农业银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$360,000</td>
						<td>$420,000</td>
						<td>$400,000</td>
						<td>农业银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>农业银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/27</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>农业银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/28</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>华夏银行</td>
						<td>6210987003698528694</td>
					</tr>
					<tr>
						<td>2011/04/28</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>华夏银行</td>
						<td>6210987003698525587</td>
					</tr>
					<tr>
						<td>2011/04/28</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>$400,000</td>
						<td>华夏银行</td>
						<td>6210987003698525486</td>
					</tr>
					<tr>
						<td>2011/04/29</td>
						<td>$620,000</td>
						<td>$620,000</td>
						<td>$620,000</td>
						<td>华夏银行</td>
						<td>6210987003698525385</td>
					</tr>
					<tr>
						<td>2011/04/29</td>
						<td>$900,000</td>
						<td>$900,000</td>
						<td>$900,000</td>
						<td>华夏银行</td>
						<td>6210987003698525284</td>
					</tr>
					<tr>
						<td>2011/04/29</td>
						<td>$350,000</td>
						<td>$350,000</td>
						<td>$350,000</td>
						<td>华夏银行</td>
						<td>6210987003698525183</td>
					</tr>
					<tr>
						<td>2011/04/29</td>
						<td>$620,000</td>
						<td>$620,000</td>
						<td>$620,000</td>
						<td>华夏银行</td>
						<td>6210987003698525082</td>
					</tr>
				</tbody>
                </table>
            </div>
        </div>
    </section>
</div>

</body>
</html>