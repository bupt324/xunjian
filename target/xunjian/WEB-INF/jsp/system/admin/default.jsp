﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>

</head>
<body style="overflow-x: hidden">

	<div class="container-fluid" id="main-container">
		

			<div id="page-content" class="clearfix">

				<div class="page-header position-relative">
					<h1>
						后台首页 <small><i class="icon-double-angle-right"></i> </small>
					</h1>
				</div>
				<!--    报警信息-->
				<div>
					<marquee id="affiche"  align="left" behavior="scroll" bgcolor="red" direction="right" height="50" width="100%" hspace="50" vspace="20" loop="-1" scrollamount="10" scrolldelay="100" onMouseOut="this.start()" onMouseOver="this.stop()">
						<a href="<%=basePath%>exception/exceptionInfo.do" ><font size="3">异常信息</font></a>
					</marquee>
				</div>
				<!--/page-header-->
				<div id="allStatistic">
					<div id="tab" style="float:left; height:200px;min-height:100px;width:20%;margin:5% ">
						<table>
							<tr>
								<td>本日全厂日常巡检单数：</td>
								<td id="td1">100</td>
							</tr>
							<tr>
								<td>本日全厂临时巡检单数：</td>
								<td id="td2">100</td>
							</tr>
							<tr>
								<td>本日全厂维修任务数：</td>
								<td id="td3">100</td>
							</tr>
							<tr>
								<td>本日全厂日常巡异常数：</td>
								<td id="td4">100</td>
							</tr>
						</table>
					</div>
					<div id="exception" style="float:left; height:200px;min-height:100px;width:25%;margin:5% ">
					</div>
					<div id="task" style="float:left; height:200px;min-height:100px;width:25%;margin:5% ">
					</div>
				</div>
				<div>
					<div id="main" style="float:left; height:410px;min-height:100px;width:40%;margin:5% "></div>
					<div id="main1" style="float:left; height:410px;min-height:100px;width:40%;margin:5% "></div>
				</div>

				<div>
					<div id="repair" style="float:left; height:410px;min-height:100px;width:40%;margin:5% "></div>
					<div id="exception1" style="float:left; height:410px;min-height:100px;width:40%;margin:5% "></div>
				</div>

				<div>
					<div id="workshopTaskInMonth" style="float:left; height:410px;min-height:100px;width:40%;margin:5% "></div>
					<div id="workshopTaskInYear" style="float:left; height:410px;min-height:100px;width:40%;margin:5% "></div>
				</div>
		</div>
		<%@ include file="bottom.jsp"%>
	</div>
	<!--/.fluid-container#main-container-->
	<!--
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>
	-->
	<!-- basic scripts -->
	<script src="static/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<!-- page specific plugin scripts -->

	<!--[if lt IE 9]>
		<script type="text/javascript" src="static/js/excanvas.min.js"></script>
		<![endif]-->
	<script type="text/javascript" src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.easy-pie-chart.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.pie.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.resize.min.js"></script>
	<!-- ace scripts -->
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script src="plugins/echarts/echarts.js"></script>
	<!-- inline scripts related to this page -->


	<script type="text/javascript">

		$(top.hangge());

		
		// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {	//图表标题
                text: '本厂日常巡检任务曲线'
            },
            tooltip: {
                trigger: 'axis', //坐标轴触发提示框，多用于柱状、折线图中
				/*
				 控制提示框内容输出格式
				 formatter: '{b0}<br/><font color=#FF3333>&nbsp;●&nbsp;</font>{a0} : {c0} ℃ ' +
				 '<br/><font color=#53FF53>●&nbsp;</font>{a1} : {c1} % ' +
				 '<br/><font color=#68CFE8>&nbsp;●&nbsp;</font>{a3} : {c3} mm ' +
				 '<br/><font color=#FFDC35>&nbsp;●&nbsp;</font>{a4} : {c4} m/s ' +
				 '<br/><font color=#B15BFF>&nbsp;&nbsp;&nbsp;&nbsp;●&nbsp;</font>{a2} : {c2} hPa '
				 */
            },
            dataZoom: [
                {
                    type: 'slider',	//支持鼠标滚轮缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                },
                {
                    type: 'inside',	//支持单独的滑动条缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                }
            ],
            legend: {	//图表上方的类别显示
                show:true,
                data:['总任务单数（单）']
            },
            color:[
                'red'	//总任务单数曲线颜色

            ],
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            xAxis:  {	//X轴
                type : 'category',
                data : []	//先设置数据值为空，后面用Ajax获取动态数据填入
            },
            yAxis : [	//Y轴（这里我设置了两个Y轴，左右各一个）
                {
                    //第一个（左边）Y轴，yAxisIndex为0
                    type : 'value',
                    name : '单数',
					/* max: 120,
					 min: -40, */
                    axisLabel : {
                        formatter: '{value} 单'	//控制输出格式
                    }
                }

            ],
            series : [	//系列（内容）列表
                {
                    name:'总任务单数（单）',
                    type:'line',	//折线图表示（生成温度曲线）
                    symbol:'emptycircle',	//设置折线图中表示每个坐标点的符号；emptycircle：空心圆；emptyrect：空心矩形；circle：实心圆；emptydiamond：菱形
                    data:[]		//数据值通过Ajax动态获取
                }
            ]
        };

        myChart.showLoading();	//数据加载完之前先显示一段简单的loading动画

        var sum=[];		//总单数数组（存放服务器返回的所有温度值）
        var dates=[];		//时间数组

        $.ajax({	//使用JQuery内置的Ajax方法
            type : "post",		//post请求方式
            async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url :"<%=basePath%>echarts/login_default.do",	//请求发送到ShowInfoIndexServlet处
            data : {name:"A0001"},		//请求内包含一个key为name，value为A0001的参数；服务器接收到客户端请求时通过request.getParameter方法获取该参数值
            dataType : "json",		//返回数据形式为json
            success : function(result) {
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result != null && result.length > 0) {
                    console.info(result);
                    for(var i=0;i<result.length;i++){
                        sum.push(result[i].sum);		//挨个取出温度、湿度、压强等值并填入前面声明的温度、湿度、压强等数组
//                        pass.push(result[i].pass);
//                        fail.push(result[i].fail);
//                        refuse.push(result[i].ref);
                        dates.push(result[i].month);
                    }
                    myChart.hideLoading();	//隐藏加载动画

                    myChart.setOption({		//载入数据
                        xAxis: {
                            data: dates	//填入X轴数据
                        },
                        series: [	//填入系列（内容）数据
                            {
                                // 根据名字对应到相应的系列
                                name: '总任务单数',
                                data: sum
                            }
                        ]
                    });

                }
                else {
                    //返回的数据为空时显示提示信息
                    alert("图表请求数据为空，可能服务器暂未录入近五天的观测数据，您可以稍后再试！");
                    myChart.hideLoading();
                }

            },
            error : function(errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败，可能是服务器开小差了");
                myChart.hideLoading();
            }
        })

        myChart.setOption(option);	//载入图表

		/*
		 故障数量统计
		 */
        var myChart1 = echarts.init(document.getElementById('main1'));
        var option1 = {
            title: {
                text: '本厂临时巡检统计任务曲线'
            },
            tooltip: {
				//坐标轴触发提示框，多用于柱状、折线图中
            },
            dataZoom: [
                {
                    type: 'slider',	//支持鼠标滚轮缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                },
                {
                    type: 'inside',	//支持单独的滑动条缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                }
            ],
            legend: {
                data:['数量']
            },
            color:[
                'blue'	//总任务单数曲线颜色

            ],
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            xAxis: {
                data: ["1月","2月","3月","4月","5月","6月"]
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'line',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };
        myChart1.setOption(option1);

        /*
        异常统计饼图
         */
        var myChart2 = echarts.init(document.getElementById('exception'));
        var option2 = {
            title : {
                text: '每日全厂异常类型分布',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'horizontal',
                left: 'center',
                top: '30',
                data: ['报警异常','隐患异常','问题异常']
            },
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:5, name:'报警异常'},
                        {value:1, name:'隐患异常'},
                        {value:3, name:'问题异常'},
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        if (option2 && typeof option2 === "object") {
            myChart2.setOption(option2, true);
        }

        /*
        全程任务类型统计饼图
         */
        var myChart3 = echarts.init(document.getElementById('task'));
        var option3 = {
            title : {
                text: '每日全厂任务数量分布',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'horizontal',
                left: 'center',
                top: '30',
                data: ['日常巡检任务','临时任务','维修任务']
            },
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:17, name:'日常巡检任务'},
                        {value:5, name:'临时任务'},
                        {value:9, name:'维修任务'},
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ],
            color: ['red','yellow','blue']
        };
        if (option3 && typeof option3 === "object") {
            myChart3.setOption(option3, true);
        }

        /*
         维修任务曲线
         */
        var myChart4 = echarts.init(document.getElementById('repair'));
        var option4 = {
            title: {
                text: '本厂维修任务曲线'
            },
            tooltip: {
                //坐标轴触发提示框，多用于柱状、折线图中
            },
            dataZoom: [
                {
                    type: 'slider',	//支持鼠标滚轮缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                },
                {
                    type: 'inside',	//支持单独的滑动条缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                }
            ],
            legend: {
                data:['数量']
            },
            color:[
                'blue'	//总任务单数曲线颜色
            ],
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            xAxis: {
                data: ["1月","2月","3月","4月","5月","6月"]
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'line',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };
        myChart4.setOption(option4);

        /*
         异常柱状图
         */
        var myChart5 = echarts.init(document.getElementById('exception1'));
        var option5 = {
            title: {
                text: '本厂异常分布统计'
            },
            tooltip: {
                //坐标轴触发提示框，多用于柱状、折线图中
            },
            dataZoom: [
                {
                    type: 'slider',	//支持鼠标滚轮缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                },
                {
                    type: 'inside',	//支持单独的滑动条缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                }
            ],
            legend: {
                orient: 'horizontal',
                left: 'center',
                top: '30',
                data:['问题异常','隐患异常','报警异常']
            },
            color: ['#003366', '#006699', '#e5323e'],
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            xAxis: {
                data: ["1月","2月","3月","4月","5月","6月"]
            },
            yAxis: {type:'value'},
            series: [{
                name: '问题异常',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }, {
                name: '隐患异常',
                type: 'bar',
                data: [13, 24, 41, 6, 7, 21]
            }, {
                name: '报警异常',
                type: 'bar',
                data: [12, 18, 25, 9, 13, 19]
            }]
        };
        myChart5.setOption(option5);

        /*
         异常柱状图
         */
        var myChart6 = echarts.init(document.getElementById('workshopTaskInMonth'));
        var option6 = {
            title: {
                text: '本月各车间任务数量分布统计'
            },
            tooltip: {
                //坐标轴触发提示框，多用于柱状、折线图中
            },
            dataZoom: [
                {
                    type: 'slider',	//支持鼠标滚轮缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                },
                {
                    type: 'inside',	//支持单独的滑动条缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100
                }
            ],
            legend: {
                orient: 'horizontal',
                left: 'center',
                top: '30',
                data:['日常任务','临时任务','维修任务']
            },
            color: ['blue', 'green', 'yellow'],
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            xAxis: {
                data: ["一车间","二车间","三车间","四车间"]
            },
            yAxis: {type:'value'},
            series: [{
                name: '日常任务',
                type: 'bar',
                data: [15, 20, 36, 10]
            }, {
                name: '临时任务',
                type: 'bar',
                data: [13, 24, 41, 6]
            }, {
                name: '维修任务',
                type: 'bar',
                data: [12, 8, 25, 9]
            }]
        };
        myChart6.setOption(option6);

	</script>
</body>
</html>
