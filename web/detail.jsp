<%--
  Created by IntelliJ IDEA.
  User: rainbow
  Date: 2022/4/17
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <%--    <script src="WEB-INF/lib/echarts.min.js"></script>--%>
    <%--    <script src="WEB-INF/lib/jquery.min.js"></script>--%>
    <!-自适应网页-->
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.3.2/dist/echarts.min.js"></script>
    <!--主题-->
    <script src="WEB-INF/lib/walden.js"></script>
</head>
<body>

<div id="text" style="width:100%;">
    <div id="forecast"
         style="text-align:center;font-size: 2rem;width:57%;height:2rem;float:left; margin: 0.2%;padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;">
        预测数据
    </div>
    <div id="history"
         style="text-align: center;font-size: 2rem;width:37%;height:2rem;float:left; margin: 0.2%;padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;">
        历史统计数据
    </div>
</div>

<div id="body1" style="width:100%;">
    <div id="div1"
         style="width:37%;height:24rem;float:left; margin: 0.2%;padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;"></div>
    <!-显示空气污染的指数的数字-下面为js-->
    <div id="text1"
         style="width:18%;height:24rem;float:left; margin: 0.2%;padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;">
    </div>
    <div id="div2"
         style="width:37%;height:24rem;float:left; margin: 0.2%;padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;"></div>
</div>

<div id="body2" style="width:100%;">
    <div id="div3"
         style="width:57%;height:18rem;float:left; padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;"></div>
    <div id="div4"
         style="width:37%;height:18rem;float:left; padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;"></div>
</div>

<div id="body3" style="width:100%;background-color: #4C9BD0">
    <div id="div5"
         style="width:47%;height:24rem;float:left; margin: 0.2%;padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;"></div>
    <div id="div6"
         style="width:47%;height:24rem;float:left; margin: 0.2%;padding:0.5rem;border:0.3rem solid  #DEE4E4; border-top-left-radius:2rem; border-top-right-radius:2rem;border-bottom-left-radius:2rem;border-bottom-right-radius:2rem;"></div>
</div>

<script type="text/javascript">
    var detail;
    //获取坐标
    var param = location.search;
    var str = param.substr(1);
    var strs = str.split("&");
    var lat = strs[0].split("=")[1];
    var lon = strs[1].split("=")[1];

    //请求数据
    const  xhr = new XMLHttpRequest();
    //初始化设置方法和参数
    xhr.open('GET', 'http://localhost:8080/DomeSpring_Web_exploded/getDetailInfo?' + 'lon=' + lon + '&lat=' + lat);
    //发送
    xhr.send();
    //事件绑定
    xhr.onreadystatechange = function (){
        if(xhr.readyState === 4){
            if(xhr.status >= 200 && xhr.status < 300){
                detail = JSON.parse(xhr.response);
                //渲染画面
                //空气污染指数API
                var AQI = detail.tomorrowAQI.max;
                var stringjw = "经纬度：(" + lat.toString() + "," + lon.toString() + ")";
                /* mCharts1:AQI仪表盘*/
                var mCharts1 = echarts.init(document.getElementById("div1"), 'walden')
                var option1 = {
                    title: {
                        text: '详细信息' + stringjw, //标题文本内容
                    },
                    graphic: {
                        type: 'text',
                        left: '39%',
                        top: '80%',
                        style: {
                            text: '空气污染指数(AQI)',
                            textAlign: 'center',
                            fill: '#0b0b42',
                            fontSize: '1.5rem',
                        },
                    },
                    series: [
                        {
                            type: 'gauge',
                            data: [
                                {
                                    value: AQI,
                                    itemStyle: { // 指针的样式
                                        color: 'pink' // 指针的颜色
                                    }
                                }, // 每一个对象就代表一个指针
                            ],
                            min: 0, // min max 控制仪表盘数值范围
                            max: 400,
                        }
                    ], // colorBy: colordata,
                    splitNumber: 10,
                    toolbox: {
                        feature: {
                            saveAsImage: {}, // 将图表保存为图片
                            dataView: {}, // 是否显示出原始数据
                            restore: {}, //还原图表
                            dataZoom: {}, // 数据缩放
                            magicType: { // 将图表在不同类型之间切换,图表的转换需要数据的支持
                                type: ['bar', 'line']
                            }
                        }
                    }
                }
                mCharts1.setOption(option1)
                //提示语
                var text = document.getElementById("text1");
                var textbody = "<h1 style='margin:5%;color:#0b0b42;font-size: 25px;'>空气污染指数</h1>";
                if (AQI <= 50) {
                    textbody += "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：一级 </h2>" +
                        "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：绿色 </h2>" +
                        "<h2 style='margin:5%;color:#8CCD26;font-size: 30px;'>对健康的影响：优 </h2>" +
                        "<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 环境空气质量令人满意，基本无空气污染。各类人群可正常活动</h3>";
                } else if (AQI <= 100) {
                    textbody += "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：二级 </h2>" +
                        "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：黄色 </h2>" +
                        "<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：良 </h2>" +
                        "<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 环境空气质量可接受，但某些污染物可能对极少数异常敏感人群健康有较弱影响。极少数异常敏感人群应减少户外活动</h3>"
                } else if (AQI <= 150) {
                    textbody += "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：三级 </h2>" +
                        "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：橙色 </h2>" +
                        "<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：轻度污染 </h2>" +
                        "<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 易感人群症状有轻度加剧,健康人群出现刺激症状。儿童、老年人及心脏病、呼吸系统疾病患者应减少长时间、高强度的户外锻炼</h3>"
                } else if (AQI <= 200) {
                    textbody += "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：四级 </h2>" +
                        "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：红色 </h2>" +
                        "<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：中度污染 </h2>" +
                        "<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 进一步加剧易感人群症状，可能对健康人群心脏、呼吸系统有影响 儿童、老年人及心脏病、呼吸系统 疾病患者避免长时间、高强度的户外锻练。一般人群适量减少户外运动</h3>";
                } else if (AQI <= 300) {
                    textbody += "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：五级 </h2>" +
                        "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：紫色 </h2>" +
                        "<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：重度污染 </h2>" +
                        "<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 心脏病和肺病患者症状显著加剧,运动耐受力降低,健康人群中普遍出现症状。儿童、老年人和心脏病、肺病患者 应停留在室内，停止户外运动，一般人群减少户外运动</h3>"
                } else {
                    textbody += "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：六级 </h2>" +
                        "<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：褐红色 </h2>" +
                        "<h2 style='margin:5%;color:#BE004D;font-size: 30px;'>对健康的影响：严重污染 </h2>" +
                        "<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 健康人群耐受力降低,有明显强烈症状,提前出现某些疾病。儿童、老年人和病人应当留在室 内，避免体力消耗，一般人群应避免户外活动</h3>"
                }
                text.innerHTML = textbody;

                /* mCharts2:近一周污染物历史折线图*/
                var mCharts2 = echarts.init(document.getElementById("div2"), 'walden')
                var ArrWeek = ['前六日', '前五日', '前四日', '前三日', '前二日', '前一日', '今日']
                var xDataArrWeek = ['前六日', '前五日', '前四日', '前三日', '前二日', '前一日', '今日', '明日']
                //折线图数据
                var yDataArrPM25ForecastWeek = detail.weekPM25;
                var yDataArrPM10ForecastWeek = detail.weekPM10;
                var yDataArrSO2ForecastWeek = detail.weekSO2;
                var yDataArrNO2ForecastWeek = detail.weekNO2;
                var yDataArrCOForecastWeek = detail.weekCO;
                var yDataArrO3ForecastWeek = detail.weekO3;
                var option2 = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    title: {
                        text: '近一周天污染物情况',
                        textStyle: { // 控制标题的文字样式
                            color: '#0b0b42',

                        }
                    },
                    legend: {
                        selectedMode: 'single',
                        data: ['PM2.5', 'PM10', 'SO2', 'NO2', 'CO', 'O3'],
                        bottom: "1%"
                    },
                    xAxis: {
                        type: 'category',
                        data: ArrWeek
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name: 'PM2.5',
                            data: yDataArrPM25ForecastWeek,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                        }, {
                            name: 'PM10',
                            data: yDataArrPM10ForecastWeek,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },

                        },
                        {
                            name: 'SO2',
                            data: yDataArrSO2ForecastWeek,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },

                        },
                        {
                            name: 'NO2',
                            data: yDataArrNO2ForecastWeek,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                        },
                        {
                            name: 'CO',
                            data: yDataArrCOForecastWeek,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },

                        },

                        {
                            name: 'O3',
                            data: yDataArrO3ForecastWeek,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },

                        }
                    ],
                    toolbox: {
                        feature: {
                            saveAsImage: {}, // 将图表保存为图片
                            restore: {}, //还原图表
                            dataZoom: {}, // 数据缩放
                            // magicType: { // 将图表在不同类型之间切换,图表的转换需要数据的支持
                            //     type: ['bar', 'line']
                            // }
                        }
                    }
                }
                mCharts2.setOption(option2)

                /* mCharts3:AQI进度条*/
                var mCharts3 = echarts.init(document.getElementById("div3"), 'walden')
                var option3 = {
                    // backgroundColor:"#17326b",
                    grid: {
                        left: "10",
                        top: "10",
                        right: "0",
                        bottom: "10",
                        containLabel: true
                    },
                    xAxis: {
                        type: 'value',
                        splitLine: {show: false},
                        axisLabel: {show: false},
                        axisTick: {show: false},
                        axisLine: {show: false}
                    },
                    yAxis: [
                        {
                            type: 'category',
                            axisTick: {show: false},
                            axisLine: {show: false},
                            axisLabel: {
                                color: "black",
                                fontSize: 14,
                                textStyle: {
                                    color: '#0b0b42'
                                }
                            },
                            data: ["SO2日均值AQI", "NO2日均值AQI", "PM10日均值AQI", "PM2.5日均值AQI", "O3日均值AQI", "CO日均值AQI"],
                            max: 5, // 关键：设置y刻度最大值，相当于设置总体行高
                            inverse: true
                        },
                        {
                            type: 'category',
                            axisTick: {show: false},
                            axisLine: {show: false},
                            axisLabel: {
                                color: "black",
                                fontSize: 14,
                                textStyle: {
                                    color: '#0b0b42'
                                }
                            },
                            data: [detail.tomorrowAQI.max, detail.tomorrowAQI.max, detail.tomorrowAQI.max, detail.tomorrowAQI.max, detail.tomorrowAQI.max, detail.tomorrowAQI.max],
                            max: 4, // 关键：设置y刻度最大值，相当于设置总体行高
                            inverse: true
                        }
                    ],
                    series: [
                        {
                            name: "条",
                            type: "bar",
                            barWidth: 29,
                            //数据
                            // https://blog.csdn.net/m0_58032776/article/details/117912575

                            data: [detail.tomorrowAQI.so2 / detail.tomorrowAQI.max * 100, detail.tomorrowAQI.no2 / detail.tomorrowAQI.max * 100, detail.tomorrowAQI.pm10 / detail.tomorrowAQI.max * 100, detail.tomorrowAQI.pm25 / detail.tomorrowAQI.max * 100, detail.tomorrowAQI.o3 / detail.tomorrowAQI.max * 100, detail.tomorrowAQI.co / detail.tomorrowAQI.max * 100],
                            // data: [1600, 565, 420, 250, 800],//300的值
                            barCategoryGap: 20,
                            itemStyle: {
                                normal: {
                                    barBorderRadius: 20,
                                    color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                        offset: 0,
                                        color: '#a6f133'
                                    }, {
                                        offset: 1,
                                        color: '#ef1b72'
                                    }]),
                                }
                            },
                            zlevel: 1

                        }, {
                            name: "进度条背景",
                            type: "bar",
                            barGap: "-100%",
                            barWidth: 29,
                            data: [100, 100, 100, 100, 100, 100],
                            color: "#2e5384",
                            itemStyle: {
                                normal: {
                                    barBorderRadius: 10
                                }
                            },
                        }
                    ],

                };
                mCharts3.setOption(option3)


                /* mCharts4:近一周AQI折线图*/
                var yDataArrAQI = [detail.weekAQI[0].max, detail.weekAQI[1].max, detail.weekAQI[2].max, detail.weekAQI[3].max, detail.weekAQI[4].max, detail.weekAQI[5].max, detail.weekAQI[6].max, detail.tomorrowAQI.max]
                var mCharts4 = echarts.init(document.getElementById("div4"), 'walden')
                var option4 = {
                    title: {
                        text: '近一周的AQI变化曲线',
                        left: '1%'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    grid: {
                        left: '5%',
                        right: '15%',
                        bottom: '10%'
                    },
                    xAxis: {
                        type: 'category',
                        data: xDataArrWeek
                    },
                    yAxis: {
                        type: 'value'
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}, // 将图表保存为图片
                            dataView: {}, // 是否显示出原始数据
                            restore: {}, //还原图表
                            dataZoom: {}, // 数据缩放
                            magicType: { // 将图表在不同类型之间切换,图表的转换需要数据的支持
                                type: ['bar', 'line']
                            }
                        }
                    },
                    visualMap: {
                        top: 50,
                        right: 10,
                        pieces: [
                            {
                                gt: 0,
                                lte: 50,
                                color: '#93CE07'
                            },
                            {
                                gt: 50,
                                lte: 100,
                                color: '#FBDB0F'
                            },
                            {
                                gt: 100,
                                lte: 150,
                                color: '#FC7D02'
                            },
                            {
                                gt: 150,
                                lte: 200,
                                color: '#FD0100'
                            },
                            {
                                gt: 200,
                                lte: 300,
                                color: '#AA069F'
                            },
                            {
                                gt: 300,
                                color: '#AC3B2A'
                            }
                        ],
                        outOfRange: {
                            color: '#999'
                        }
                    },
                    series: {
                        name: '近一周的AQI变化曲线',
                        type: 'line',
                        data: yDataArrAQI,
                        smooth: true,
                        markLine: {
                            silent: true,
                            lineStyle: {
                                color: '#333'
                            },
                            data: [
                                {
                                    yAxis: 50
                                },
                                {
                                    yAxis: 100
                                },
                                {
                                    yAxis: 150
                                },
                                {
                                    yAxis: 200
                                },
                                {
                                    yAxis: 300
                                }
                            ]
                        }
                    },

                }
                mCharts4.setOption(option4)

                /* mCharts5:预测AQI3天折线图*/
                var mCharts5 = echarts.init(document.getElementById("div5"), 'walden')
                var xDataArrForecast = ['明天', '后天', '大后天']
                //预测折线图数据
                var yDataArrPM25Forecast = [detail.nextThreeDaysAQI[0].pm25, detail.nextThreeDaysAQI[1].pm25, detail.nextThreeDaysAQI[2].pm25]
                var yDataArrPM10Forecast = [detail.nextThreeDaysAQI[0].pm10, detail.nextThreeDaysAQI[1].pm10, detail.nextThreeDaysAQI[2].pm10]
                var yDataArrSO2Forecast = [detail.nextThreeDaysAQI[0].so2, detail.nextThreeDaysAQI[1].so2, detail.nextThreeDaysAQI[2].so2]
                var yDataArrNO2Forecast = [detail.nextThreeDaysAQI[0].no2, detail.nextThreeDaysAQI[1].no2, detail.nextThreeDaysAQI[2].no2]
                var yDataArrCOForecast = [detail.nextThreeDaysAQI[0].co, detail.nextThreeDaysAQI[1].co, detail.nextThreeDaysAQI[2].co]
                var yDataArrO3Forecast = [detail.nextThreeDaysAQI[0].o3, detail.nextThreeDaysAQI[1].o3, detail.nextThreeDaysAQI[2].o3]
                var option5 = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    title: {
                        text: '预测AQI近3天折线图',
                        textStyle: { // 控制标题的文字样式
                            color: '#0b0b42',

                        }
                    },
                    legend: {
                        selectedMode: 'single',
                        data: ['PM2.5', 'PM10', 'SO2', 'NO2', 'CO', 'O3'],
                        bottom: "1%"
                    },
                    xAxis: {
                        type: 'category',
                        data: xDataArrForecast
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name: 'PM2.5',
                            data: yDataArrPM25Forecast,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                        }, {
                            name: 'PM10',
                            data: yDataArrPM10Forecast,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },

                        },
                        {
                            name: 'SO2',
                            data: yDataArrSO2Forecast,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },

                        },
                        {
                            name: 'NO2',
                            data: yDataArrNO2Forecast,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                        },
                        {
                            name: 'CO',
                            data: yDataArrCOForecast,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                        },
                        {
                            name: 'O3',
                            data: yDataArrO3Forecast,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },

                        }
                    ],
                    toolbox: {
                        feature: {
                            saveAsImage: {}, // 将图表保存为图片
                            restore: {}, //还原图表
                            dataZoom: {}, // 数据缩放
                            // magicType: { // 将图表在不同类型之间切换,图表的转换需要数据的支持
                            //     type: ['bar', 'line']
                            // }
                        }
                    }
                }
                mCharts5.setOption(option5)

                /* mChart65：除AQI其他数值年统计折线图(按照月)*/
                var mCharts6 = echarts.init(document.getElementById("div6"), 'walden')
                /* 年数据横坐标示意图*/
                // var xDataArrYear = ['2018121','2018122','2018123','2018124','2018125','2018126','2018127','2018128','2018129','20181210','20181211','20181212','20181213','20181214','20181215','20181216','20181217','20181218','20181219','20181220','20181221','20181222','20181223','20181224','20181225','20181226','20181227','20181228','20181229','20181230','20181231']
                // //xDataArrHistoryMonth为显示最近十二月的AQI平均
                var xDataArrYear = detail.dateList;
                // var nowmonth = 12 //获得本月
                // //获得横坐标
                // // var xDataArrHistoryMonth
                // var xDataArrHistoryMonth = ['本月']
                // for (var i = nowmonth - 1; i >= 1; i--) {
                //     xDataArrHistoryMonth.unshift(i + "月")
                // }
                // for (var i = 12; i >= nowmonth + 1; i--) {
                //     xDataArrHistoryMonth.unshift("去年" + i + "月")
                // }
                // var yDataArrAQIHistoryMonth = [45, 53, 24, 21, 77, 120, 67, 65, 40, 33, 55, 23]

                // console.info(xDataArrHistoryMonth)
                // console.info(yDataArrAQIHistoryMonth)
                // var yDataArrPM25ForecastYear = [41.62, 45.2, 50.78, 41.62, 44.19, 45.2, 50.78, 114.7, 149.52, 221.1,41.62, 44.19, 242.77,114.7, 149.52, 221.1, 242.77,41.62, 44.19, 45.2, 50.78, 114.7, 149.52, 221.1, 242.77, 44.19, 45.2, 50.78, 114.7, 149.52, 221.1, 242.77]
                // var yDataArrPM10ForecastYear = [103.1, 91.49, 103.1, 91.49, 120.3, 103.1, 91.49, 120.3, 209.64, 219.89, 213.34, 148.46,209.64,103.1, 91.49, 120.3, 209.64, 219.89, 213.34, 148.46, 219.89, 103.1, 91.49, 120.3, 209.64, 219.89, 213.34, 148.46,213.34, 148.46,120.3, 209.64, 219.89, 213.34, 148.46]
                // var yDataArrSO2ForecastYear = [12.02, 9.07, 10.2, 17.94, 13.1, 28.16, 12.02, 9.07, 10.2,12.02, 9.07, 10.2, 17.94, 13.1, 28.16, 18.23, 17.94, 13.1, 28.16, 18.23,18.23,12.02, 9.07, 10.2, 17.94, 13.1, 28.16, 18.23,]
                // var yDataArrNO2ForecastYear = [40.21, 39.98, 43.2, 50.43,40.21, 39.98, 43.2, 50.43, 70.5, 95.38, 31.56, 70.5, 95.38, 31.56,40.21,40.21, 39.98, 43.2, 50.43, 70.5, 95.38, 31.56, 39.98, 43.2, 50.43, 70.5, 95.38, 31.56]
                // var yDataArrCOForecastYear = [0.6, 0.62, 0.7, 0.75, 1.86, 0.6, 0.62, 0.7, 0.75, 1.86, 2.72, 1.75,2.72, 1.75,0.6, 0.62,0.6, 0.62, 0.7, 0.75, 1.86, 2.72, 1.75, 0.7, 0.75, 1.86, 2.72, 1.75]
                // var yDataArrO3ForecastYear = [15.43, 20.43, 18.4,15.43, 20.43, 18.4, 12.83,15.43, 20.43, 18.4, 12.83, 3.59, 11.75, 13.21, 3.59, 11.75, 13.21, 12.83, 3.59, 11.75,15.43, 20.43, 18.4, 12.83, 3.59, 11.75, 13.21, 13.21]
                var yDataArrPM25ForecastYear = detail.yearPM25;
                var yDataArrPM10ForecastYear = detail.yearPM10;
                var yDataArrSO2ForecastYear = detail.yearSO2;
                var yDataArrNO2ForecastYear = detail.yearNO2;
                var yDataArrCOForecastYear = detail.yearCO;
                var yDataArrO3ForecastYear =  detail.yearO3;
                var option6 = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    title: {
                        text: '近一周天污染物情况',
                        textStyle: { // 控制标题的文字样式
                            color: '#0b0b42',

                        }
                    },
                    legend: {
                        selectedMode: 'single',
                        data: ['PM2.5', 'PM10', 'SO2', 'NO2', 'CO', 'O3'],
                        bottom: "1%"
                    },
                    xAxis: {
                        type: 'category',
                        data: xDataArrYear
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name: 'PM2.5',
                            data: yDataArrPM25ForecastYear,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                            areaStyle: {},
                        }, {
                            name: 'PM10',
                            data: yDataArrPM10ForecastYear,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                            areaStyle: {},
                        },
                        {
                            name: 'SO2',
                            data: yDataArrSO2ForecastYear,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                            areaStyle: {},
                        },
                        {
                            name: 'NO2',
                            data: yDataArrNO2ForecastYear,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                            areaStyle: {},
                        },
                        {
                            name: 'CO',
                            data: yDataArrCOForecastYear,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                            areaStyle: {},
                        },

                        {
                            name: 'O3',
                            data: yDataArrO3ForecastYear,
                            type: 'line',
                            lineStyle: {
                                type: 'solid' // 可选值还有 dashed solid
                            },
                            areaStyle: {}
                        }
                    ],
                    toolbox: {
                        feature: {
                            saveAsImage: {}, // 将图表保存为图片
                            restore: {}, //还原图表
                            dataZoom: {}, // 数据缩放
                            // magicType: { // 将图表在不同类型之间切换,图表的转换需要数据的支持
                            //     type: ['bar', 'line']
                            // }
                        }
                    }
                }
                mCharts6.setOption(option6)
            }
        }
    }


    /*  网页自适应*/
    setTimeout(function () {
        window.onresize = function () {
            mCharts1.resize();
            mCharts2.resize();
            mCharts3.resize();
            mCharts4.resize();
            mCharts5.resize();
            mCharts6.resize();
        }
    }, 200)
</script>
</body>
</html>
