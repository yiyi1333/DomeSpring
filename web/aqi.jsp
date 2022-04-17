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

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.3.2/dist/echarts.min.js"></script>
    <!--主题-->
    <script src="WEB-INF/lib/walden.js"></script>
</head>
<body>

<div id = "body1" style="width:100%">
    <div id = "div1" style="width:37%;height:380px;float:left; margin: 0.2%;border:5px solid  #DEE4E4; border-top-left-radius:30px; border-top-right-radius:30px;border-bottom-left-radius:30px;border-bottom-right-radius:30px;padding:10px;"></div>
    <div id = "text1" style="width:18%;height:380px;float:left;background-color: rgba(0,0,0,0);margin: 0.2%;border:5px solid  #DEE4E4;border-top-left-radius:30px; border-top-right-radius:30px;border-bottom-left-radius:30px;border-bottom-right-radius:40px;padding:10px;">
        <script type="text/javascript">
            //AQI在这里要算好或者获取
            var AQI = 44
            document.write("<h1 style='margin:5%;color:#0b0b42;font-size: 25px;'>空气污染指数</h1>");

            if (AQI <= 50) {
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：一级 </h2>");
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：绿色 </h2>");
                document.write("<h2 style='margin:5%;color:#8CCD26;font-size: 30px;'>对健康的影响：优 </h2>");
                document.write("<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 环境空气质量令人满意，基本无空气污染。各类人群可正常活动</h3>");
            } else if (AQI <= 100) {
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：二级 </h2>");
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：黄色 </h2>");
                document.write("<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：良 </h2>");
                document.write("<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 环境空气质量可接受，但某些污染物可能对极少数异常敏感人群健康有较弱影响。极少数异常敏感人群应减少户外活动</h3>");
            } else if (AQI <= 150) {
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：三级 </h2>");
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：橙色 </h2>");
                document.write("<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：轻度污染 </h2>");
                document.write("<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 易感人群症状有轻度加剧,健康人群出现刺激症状。儿童、老年人及心脏病、呼吸系统疾病患者应减少长时间、高强度的户外锻炼</h3>");
            } else if (AQI <= 200) {
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：四级 </h2>");
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：红色 </h2>");
                document.write("<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：中度污染 </h2>");
                document.write("<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 进一步加剧易感人群症状，可能对健康人群心脏、呼吸系统有影响 儿童、老年人及心脏病、呼吸系统 疾病患者避免长时间、高强度的户外锻练。一般人群适量减少户外运动</h3>");
            } else if (AQI <= 300) {
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：五级 </h2>");
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：紫色 </h2>");
                document.write("<h2 style='margin:5%;color:#FFB538;font-size: 30px;'>对健康的影响：重度污染 </h2>");
                document.write("<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 心脏病和肺病患者症状显著加剧,运动耐受力降低,健康人群中普遍出现症状。儿童、老年人和心脏病、肺病患者 应停留在室内，停止户外运动，一般人群减少户外运动</h3>");
            } else {
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI级别：六级 </h2>");
                document.write("<h2 style='margin:5%;color:#0b0b42;font-size: 30px;'>AQI颜色：褐红色 </h2>");
                document.write("<h2 style='margin:5%;color:#BE004D;font-size: 30px;'>对健康的影响：严重污染 </h2>");
                document.write("<h3 style='margin:5%;color:#0b0b42;font-size: 20px;'>建议采取的措施: 健康人群耐受力降低,有明显强烈症状,提前出现某些疾病。儿童、老年人和病人应当留在室 内，避免体力消耗，一般人群应避免户外活动</h3>");
            }
        </script>

    </div>
    <div id = "div2" style="width:37%;height:380px;float:left;margin: 0.2%;border:5px solid  #DEE4E4; border-top-left-radius:30px; border-top-right-radius:30px;border-bottom-left-radius:30px;border-bottom-right-radius:30px;padding:10px;"></div>
</div>

<div id = "body2" style="width:100%">
    <div id = "div3" style="width:57%;height:380px;float:left; margin: 0.2%;border:5px solid  #DEE4E4; border-top-left-radius:30px; border-top-right-radius:30px;border-bottom-left-radius:30px;border-bottom-right-radius:30px;padding:10px;"></div>
    <div id = "div4" style="width:37%;height:380px;float:left;margin: 0.2%;border:5px solid  #DEE4E4; border-top-left-radius:30px; border-top-right-radius:30px;border-bottom-left-radius:30px;border-bottom-right-radius:30px;padding:10px;"></div>
</div>

<script type="text/javascript">
    //221.1	413.34	28.16	95.38	2.72	11.75	-1.44	-0.25	281.98	79.81	101729.54	36.54	116.77
    var lat = 36.54;// 纬度
    var lon = 116.77;//经度
    var stringjw = "经纬度：(" + lat.toString() + "," + lon.toString() + ")";
    AQI = 44

    //https://blog.csdn.net/m0_58032776/article/details/117912575
    // AAQIPI 计算方法 https://www.docin.com/p-513627910.html
    var mCharts1 = echarts.init(document.getElementById("div1"), 'walden')
    var option1 = {
        title: {
            text: '详细信息' + stringjw, //标题文本内容
        },
        graphic: {
            type: 'text',
            left: '27%',
            top: '80%',
            style: {
                text: '空气污染指数(API)',
                textAlign: 'center',
                fill: '#0b0b42',
                fontSize: 20,
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


    var mCharts2 = echarts.init(document.getElementById("div2"), 'walden')
    var xDataArr = ['前七日', '前六日', '前五日', '前四日', '前三日', '前二日', '前一日', '今日']


    var yDataArrPM25 = [41.62, 44.19, 45.2, 50.78, 114.7, 149.52, 221.1, 242.77]
    var yDataArrPM10 = [103.1, 91.49, 120.3, 209.64, 219.89, 213.34, 148.46]
    var yDataArrSO2 = [12.02, 9.07, 10.2, 17.94, 13.1, 28.16, 18.23]
    var yDataArrNO2 = [40.21, 39.98, 43.2, 50.43, 70.5, 95.38, 31.56]
    var yDataArrCO = [0.6, 0.62, 0.7, 0.75, 1.86, 2.72, 1.75]
    var yDataArrO3 = [15.43, 20.43, 18.4, 12.83, 3.59, 11.75, 13.21]
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
            data: xDataArr
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name: 'PM2.5',
                data: yDataArrPM25,
                type: 'line',
                lineStyle: {
                    type: 'solid' // 可选值还有 dashed solid
                },
            }, {
                name: 'PM10',
                data: yDataArrPM10,
                type: 'line',
                lineStyle: {
                    type: 'solid' // 可选值还有 dashed solid
                },

            },
            {
                name: 'SO2',
                data: yDataArrSO2,
                type: 'line',
                lineStyle: {
                    type: 'solid' // 可选值还有 dashed solid
                },

            },
            {
                name: 'NO2',
                data: yDataArrNO2,
                type: 'line',
                lineStyle: {
                    type: 'solid' // 可选值还有 dashed solid
                },
            },
            {
                name: 'CO',
                data: yDataArrCO,
                type: 'line',
                lineStyle: {
                    type: 'solid' // 可选值还有 dashed solid
                },

            },

            {
                name: 'O3',
                data: yDataArrO3,
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
                data: ["SO2日均值AQI", "NO2日均值AQI", "PM10日均值AQI", "PM2.5日均值AQI", "O3小时均值AQI"],
                max: 4, // 关键：设置y刻度最大值，相当于设置总体行高
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
                data: [300, 300, 300, 300, 300],
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

                data: [95.38 / 1600 * 100, 28.16 / 565 * 100, 413.34 / 420 * 100, 221.1 / 250 * 100, 11.75 / 800 * 100],
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
                data: [100, 100, 100, 100, 100],
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


    var yDataArrAQI = [45, 53, 77, 120, 67, 65, 40, 33, 55]
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
            data: xDataArr
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
</script>
</body>
</html>
