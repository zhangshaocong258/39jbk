<%--
  Created by IntelliJ IDEA.
  User: zsc
  Date: 2017/11/27
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="user" value="${sessionScope.loginSession}"/>
<html>
<head>
    <title>select</title>
    <link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value='/static/js/jquery-3.2.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <style>
        body {
            text-align: center
        }
    </style>
    <style>
        .box {
            background: url("<c:url value='/static/img/选择症状s.png'/>");
            width: 970px;
            height: 785px;
            /*display: table-cell;*/
            /*!* 水平居中 *!*/
            /*text-align:center;*/
            /*!* 垂直居中 *!*/
            /*vertical-align:middle;*/
            position: relative;
            /*border: 1px solid #f40;*/
        }
    </style>
    <script type="text/javascript">
        function submitTest() {
            var form = document.forms['myform'];
            var i, zz = 0, sz = 0, st = 0, m = 0;
            for (i = 0; i < form.length; i++) {
                var e = form[i];
                if (e.checked && e.type == 'checkbox' && e.name == 'zhengzhuang') {
                    zz++;
                    if (zz > 0 && sz>0 && st >0 && m>0) {
                        break;
                    }
                } else if (e.checked && e.type == 'checkbox' && e.name == 'shezhi') {
                    sz++;
                    if (zz > 0 && sz>0 && st >0 && m>0) {
                        break;
                    }
                } else if (e.checked && e.type == 'checkbox' && e.name == 'shetai') {
                    st++;
                    if (zz > 0 && sz>0 && st >0 && m>0) {
                        break;
                    }
                } else if (e.checked && e.type == 'checkbox' && e.name == 'mai') {
                    m++;
                    if (zz > 0 && sz>0 && st >0 && m>0) {
                        break;
                    }
                }
            }
            if(zz ==0) {
                alert("请选择症状");
                return false;
            } else if ( sz ==0) {
                alert("请选择舌质");
                return false;
            } else if ( st ==0) {
                alert("请选择舌苔");
                return false;
            } else if ( m ==0) {
                alert("请选择脉象");
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body>
<div style="margin:0 auto; margin-top: 80px; width:970px">
    <div class="box">
    <div style="position:absolute;left:10px;top:5px">
        <a href="information"><img src=<c:url value='/static/img/返回.png'/>/></a>
    </div>
    <form name="myform" class="form-horizontal" action="result" method="get" onsubmit="return submitTest()">
        <div style="position:absolute;left:92px;top:100px">
            <select name="gender" value="${gender}" class="form-control" style="width:80px;">
                <option<c:if test="${gender == 'male'}"> selected = "selected"</c:if>>男</option>
                <option<c:if test="${gender == 'female'}"> selected = "selected"</c:if>>女</option>
            </select>
        </div>

        <div style="position:absolute;left:255px;top:100px">
            <select name="age" class="form-control" style="width:160px;">
                <option<c:if test="${age == '未选择'}"> selected = "selected"</c:if>>未选择</option>
                <option<c:if test="${age == '1岁'}"> selected = "selected"</c:if>>1岁</option>
                <option<c:if test="${age == '2岁'}"> selected = "selected"</c:if>>2岁</option>
                <option<c:if test="${age == '3岁'}"> selected = "selected"</c:if>>3岁</option>
                <option<c:if test="${age == '4岁'}"> selected = "selected"</c:if>>4岁</option>
                <option<c:if test="${age == '5岁'}"> selected = "selected"</c:if>>5岁</option>
                <option<c:if test="${age == '6岁'}"> selected = "selected"</c:if>>6岁</option>
                <option<c:if test="${age == '7岁'}"> selected = "selected"</c:if>>7岁</option>
                <option<c:if test="${age == '8岁'}"> selected = "selected"</c:if>>8岁</option>
                <option<c:if test="${age == '9岁'}"> selected = "selected"</c:if>>9岁</option>
                <option<c:if test="${age == '10岁'}"> selected = "selected"</c:if>>10岁</option>
                <option<c:if test="${age == '11岁'}"> selected = "selected"</c:if>>11岁</option>
                <option<c:if test="${age == '12岁'}"> selected = "selected"</c:if>>12岁</option>
                <option<c:if test="${age == '13岁'}"> selected = "selected"</c:if>>13岁</option>
                <option<c:if test="${age == '14岁'}"> selected = "selected"</c:if>>14岁</option>
                <option<c:if test="${age == '15岁'}"> selected = "selected"</c:if>>15岁</option>
                <option<c:if test="${age == '16岁'}"> selected = "selected"</c:if>>16岁</option>
                <option<c:if test="${age == '17岁'}"> selected = "selected"</c:if>>17岁</option>
                <option<c:if test="${age == '18岁'}"> selected = "selected"</c:if>>18岁</option>
                <option<c:if test="${age == '19岁'}"> selected = "selected"</c:if>>19岁</option>
                <option<c:if test="${age == '20岁'}"> selected = "selected"</c:if>>20岁</option>
                <option<c:if test="${age == '21岁'}"> selected = "selected"</c:if>>21岁</option>
                <option<c:if test="${age == '22岁'}"> selected = "selected"</c:if>>22岁</option>
                <option<c:if test="${age == '23岁'}"> selected = "selected"</c:if>>23岁</option>
                <option<c:if test="${age == '24岁'}"> selected = "selected"</c:if>>24岁</option>
                <option<c:if test="${age == '25岁'}"> selected = "selected"</c:if>>25岁</option>
                <option<c:if test="${age == '26岁'}"> selected = "selected"</c:if>>26岁</option>
                <option<c:if test="${age == '27岁'}"> selected = "selected"</c:if>>27岁</option>
                <option<c:if test="${age == '28岁'}"> selected = "selected"</c:if>>28岁</option>
                <option<c:if test="${age == '29岁'}"> selected = "selected"</c:if>>29岁</option>
                <option<c:if test="${age == '30岁'}"> selected = "selected"</c:if>>30岁</option>
                <option<c:if test="${age == '31岁'}"> selected = "selected"</c:if>>31岁</option>
                <option<c:if test="${age == '32岁'}"> selected = "selected"</c:if>>32岁</option>
                <option<c:if test="${age == '33岁'}"> selected = "selected"</c:if>>33岁</option>
                <option<c:if test="${age == '34岁'}"> selected = "selected"</c:if>>34岁</option>
                <option<c:if test="${age == '35岁'}"> selected = "selected"</c:if>>35岁</option>
                <option<c:if test="${age == '36岁'}"> selected = "selected"</c:if>>36岁</option>
                <option<c:if test="${age == '37岁'}"> selected = "selected"</c:if>>37岁</option>
                <option<c:if test="${age == '38岁'}"> selected = "selected"</c:if>>38岁</option>
                <option<c:if test="${age == '39岁'}"> selected = "selected"</c:if>>39岁</option>
                <option<c:if test="${age == '40岁'}"> selected = "selected"</c:if>>40岁</option>
                <option<c:if test="${age == '41岁'}"> selected = "selected"</c:if>>41岁</option>
                <option<c:if test="${age == '42岁'}"> selected = "selected"</c:if>>42岁</option>
                <option<c:if test="${age == '43岁'}"> selected = "selected"</c:if>>43岁</option>
                <option<c:if test="${age == '44岁'}"> selected = "selected"</c:if>>44岁</option>
                <option<c:if test="${age == '45岁'}"> selected = "selected"</c:if>>45岁</option>
                <option<c:if test="${age == '46岁'}"> selected = "selected"</c:if>>46岁</option>
                <option<c:if test="${age == '47岁'}"> selected = "selected"</c:if>>47岁</option>
                <option<c:if test="${age == '48岁'}"> selected = "selected"</c:if>>48岁</option>
                <option<c:if test="${age == '49岁'}"> selected = "selected"</c:if>>49岁</option>
                <option<c:if test="${age == '50岁'}"> selected = "selected"</c:if>>50岁</option>
                <option<c:if test="${age == '51岁'}"> selected = "selected"</c:if>>51岁</option>
                <option<c:if test="${age == '52岁'}"> selected = "selected"</c:if>>52岁</option>
                <option<c:if test="${age == '53岁'}"> selected = "selected"</c:if>>53岁</option>
                <option<c:if test="${age == '54岁'}"> selected = "selected"</c:if>>54岁</option>
                <option<c:if test="${age == '55岁'}"> selected = "selected"</c:if>>55岁</option>
                <option<c:if test="${age == '56岁'}"> selected = "selected"</c:if>>56岁</option>
                <option<c:if test="${age == '57岁'}"> selected = "selected"</c:if>>57岁</option>
                <option<c:if test="${age == '58岁'}"> selected = "selected"</c:if>>58岁</option>
                <option<c:if test="${age == '59岁'}"> selected = "selected"</c:if>>59岁</option>
                <option<c:if test="${age == '60岁'}"> selected = "selected"</c:if>>60岁</option>
                <option<c:if test="${age == '61岁'}"> selected = "selected"</c:if>>61岁</option>
                <option<c:if test="${age == '62岁'}"> selected = "selected"</c:if>>62岁</option>
                <option<c:if test="${age == '63岁'}"> selected = "selected"</c:if>>63岁</option>
                <option<c:if test="${age == '64岁'}"> selected = "selected"</c:if>>64岁</option>
                <option<c:if test="${age == '65岁'}"> selected = "selected"</c:if>>65岁</option>
                <option<c:if test="${age == '66岁'}"> selected = "selected"</c:if>>66岁</option>
                <option<c:if test="${age == '67岁'}"> selected = "selected"</c:if>>67岁</option>
                <option<c:if test="${age == '68岁'}"> selected = "selected"</c:if>>68岁</option>
                <option<c:if test="${age == '69岁'}"> selected = "selected"</c:if>>69岁</option>
                <option<c:if test="${age == '70岁'}"> selected = "selected"</c:if>>70岁</option>
                <option<c:if test="${age == '71岁'}"> selected = "selected"</c:if>>71岁</option>
                <option<c:if test="${age == '72岁'}"> selected = "selected"</c:if>>72岁</option>
                <option<c:if test="${age == '73岁'}"> selected = "selected"</c:if>>73岁</option>
                <option<c:if test="${age == '74岁'}"> selected = "selected"</c:if>>74岁</option>
                <option<c:if test="${age == '75岁'}"> selected = "selected"</c:if>>75岁</option>
                <option<c:if test="${age == '76岁'}"> selected = "selected"</c:if>>76岁</option>
                <option<c:if test="${age == '77岁'}"> selected = "selected"</c:if>>77岁</option>
                <option<c:if test="${age == '78岁'}"> selected = "selected"</c:if>>78岁</option>
                <option<c:if test="${age == '79岁'}"> selected = "selected"</c:if>>79岁</option>
                <option<c:if test="${age == '80岁'}"> selected = "selected"</c:if>>80岁</option>
                <option<c:if test="${age == '81岁'}"> selected = "selected"</c:if>>81岁</option>
                <option<c:if test="${age == '82岁'}"> selected = "selected"</c:if>>82岁</option>
                <option<c:if test="${age == '83岁'}"> selected = "selected"</c:if>>83岁</option>
                <option<c:if test="${age == '84岁'}"> selected = "selected"</c:if>>84岁</option>
                <option<c:if test="${age == '85岁'}"> selected = "selected"</c:if>>85岁</option>
                <option<c:if test="${age == '86岁'}"> selected = "selected"</c:if>>86岁</option>
                <option<c:if test="${age == '87岁'}"> selected = "selected"</c:if>>87岁</option>
                <option<c:if test="${age == '88岁'}"> selected = "selected"</c:if>>88岁</option>
                <option<c:if test="${age == '89岁'}"> selected = "selected"</c:if>>89岁</option>
                <option<c:if test="${age == '90岁'}"> selected = "selected"</c:if>>90岁</option>
                <option<c:if test="${age == '91岁'}"> selected = "selected"</c:if>>91岁</option>
                <option<c:if test="${age == '92岁'}"> selected = "selected"</c:if>>92岁</option>
                <option<c:if test="${age == '93岁'}"> selected = "selected"</c:if>>93岁</option>
                <option<c:if test="${age == '94岁'}"> selected = "selected"</c:if>>94岁</option>
                <option<c:if test="${age == '95岁'}"> selected = "selected"</c:if>>95岁</option>
                <option<c:if test="${age == '96岁'}"> selected = "selected"</c:if>>96岁</option>
                <option<c:if test="${age == '97岁'}"> selected = "selected"</c:if>>97岁</option>
                <option<c:if test="${age == '98岁'}"> selected = "selected"</c:if>>98岁</option>
                <option<c:if test="${age == '99岁'}"> selected = "selected"</c:if>>99岁</option>
            </select>
        </div>


        <div style="position:absolute;left:488px;top:100px">
            <select name="profession" value="${profession}" class="form-control" style="width:213px;">
                <option<c:if test="${profession == '未选择'}"> selected = "selected"</c:if>>未选择</option>
                <option<c:if test="${profession == '工人'}"> selected = "selected"</c:if>>工人</option>
                <option<c:if test="${profession == '教师'}"> selected = "selected"</c:if>>教师</option>
                <option<c:if test="${profession == '农民'}"> selected = "selected"</c:if>>农民</option>
                <option<c:if test="${profession == '服务员'}"> selected = "selected"</c:if>>服务员</option>
                <option<c:if test="${profession == '司机'}"> selected = "selected"</c:if>>司机</option>
                <option<c:if test="${profession == '厨师'}"> selected = "selected"</c:if>>厨师</option>
                <option<c:if test="${profession == '白领'}"> selected = "selected"</c:if>>白领</option>
                <option<c:if test="${profession == '医师'}"> selected = "selected"</c:if>>医师</option>
                <option<c:if test="${profession == '公务员'}"> selected = "selected"</c:if>>公务员</option>
                <option<c:if test="${profession == '销售'}"> selected = "selected"</c:if>>销售</option>
                <option<c:if test="${profession == '其他'}"> selected = "selected"</c:if>>其他</option>
            </select>
        </div>

        <div style="position:absolute;left:92px;top:220px;width:655px;">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#zhengzhuang" aria-controls="zhengzhuang" role="tab"
                                                          data-toggle="tab">症状</a></li>
                <li role="presentation"><a href="#shezhi" aria-controls="shezhi" role="tab" data-toggle="tab">舌质</a>
                </li>
                <li role="presentation"><a href="#shetai" aria-controls="shetai" role="tab" data-toggle="tab">舌苔</a>
                </li>
                <li role="presentation"><a href="#maixiang" aria-controls="maixiang" role="tab" data-toggle="tab">脉象</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div style="overflow:auto;height:400px;" class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="zhengzhuang">
                    <table class="table table-striped">
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="心悸">&thinsp;&thinsp;心悸</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="气短">&thinsp;&thinsp;气短</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="精神不振">&thinsp;&thinsp;精神不振</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="面色淡白">&thinsp;&thinsp;面色淡白</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="头晕">&thinsp;&thinsp;头晕</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="自汗">&thinsp;&thinsp;自汗</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="神思恍惚">&thinsp;&thinsp;神思恍惚</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="善惊易恐">&thinsp;&thinsp;善惊易恐</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="失眠多梦">&thinsp;&thinsp;失眠多梦</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="胸闷">&thinsp;&thinsp;胸闷</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="胸痛">&thinsp;&thinsp;胸痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="急躁易怒">&thinsp;&thinsp;急躁易怒</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="腰酸">&thinsp;&thinsp;腰酸</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="腰痛">&thinsp;&thinsp;腰痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="膝酸">&thinsp;&thinsp;膝酸</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="膝痛">&thinsp;&thinsp;膝痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="遗精">&thinsp;&thinsp;遗精</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="五心烦热">&thinsp;&thinsp;五心烦热</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="口燥咽干">&thinsp;&thinsp;口燥咽干</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="面色潮红">&thinsp;&thinsp;面色潮红</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="盗汗">&thinsp;&thinsp;盗汗</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="形体消瘦">&thinsp;&thinsp;形体消瘦</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="唇红">&thinsp;&thinsp;唇红</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="唇紫">&thinsp;&thinsp;唇紫</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="唇苍白">&thinsp;&thinsp;唇苍白</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="甲苍白">&thinsp;&thinsp;甲苍白</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="潮热">&thinsp;&thinsp;潮热</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="头痛">&thinsp;&thinsp;头痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="两目干涩">&thinsp;&thinsp;两目干涩</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="耳鸣">&thinsp;&thinsp;耳鸣</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="耳聋">&thinsp;&thinsp;耳聋</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="健忘">&thinsp;&thinsp;健忘</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="咽痛">&thinsp;&thinsp;咽痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="关节屈伸不利">&thinsp;&thinsp;关节屈伸不利</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肢体麻木">&thinsp;&thinsp;肢体麻木</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肢体拘挛">&thinsp;&thinsp;肢体拘挛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肢体强直">&thinsp;&thinsp;肢体强直</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肢体抽搐">&thinsp;&thinsp;肢体抽搐</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="不能久立">&thinsp;&thinsp;不能久立</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="步履不正">&thinsp;&thinsp;步履不正</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="闭经">&thinsp;&thinsp;闭经</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="月经过多">&thinsp;&thinsp;月经过多</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="尿短">&thinsp;&thinsp;尿短</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="尿黄">&thinsp;&thinsp;尿黄</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="尿频">&thinsp;&thinsp;尿频</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="尿混浊">&thinsp;&thinsp;尿混浊</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="大便干结">&thinsp;&thinsp;大便干结</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="口淡无味">&thinsp;&thinsp;口淡无味</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="食欲不振">&thinsp;&thinsp;食欲不振</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="腹胀">&thinsp;&thinsp;腹胀</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="大便时溏">&thinsp;&thinsp;大便时溏</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肢倦乏力">&thinsp;&thinsp;肢倦乏力</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="面色萎黄">&thinsp;&thinsp;面色萎黄</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="怠惰嗜卧">&thinsp;&thinsp;怠惰嗜卧</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="忧虑重重">&thinsp;&thinsp;忧虑重重</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="少气懒言">&thinsp;&thinsp;少气懒言</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="呕吐">&thinsp;&thinsp;呕吐</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="腹痛">&thinsp;&thinsp;腹痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="畏寒肢冷">&thinsp;&thinsp;畏寒肢冷</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="不能食生冷">&thinsp;&thinsp;不能食生冷</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="多涎">&thinsp;&thinsp;多涎</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="便秘">&thinsp;&thinsp;便秘</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肢体浮肿">&thinsp;&thinsp;肢体浮肿</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="头面浮肿">&thinsp;&thinsp;头面浮肿</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="发热">&thinsp;&thinsp;发热</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="白带多">&thinsp;&thinsp;白带多</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="月经少">&thinsp;&thinsp;月经少</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="痰多">&thinsp;&thinsp;痰多</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肢体酸楚">&thinsp;&thinsp;肢体酸楚</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="双下肢水肿">&thinsp;&thinsp;双下肢水肿</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="目不欲睁">&thinsp;&thinsp;目不欲睁</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="腿痛">&thinsp;&thinsp;腿痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="嘈杂">&thinsp;&thinsp;嘈杂</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="膝软无力">&thinsp;&thinsp;膝软无力</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="胃胀">&thinsp;&thinsp;胃胀</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="月经失调">&thinsp;&thinsp;月经失调</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="大便失禁">&thinsp;&thinsp;大便失禁</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="恶心">&thinsp;&thinsp;恶心</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="口臭">&thinsp;&thinsp;口臭</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="皮肤苍白">&thinsp;&thinsp;皮肤苍白</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="口苦">&thinsp;&thinsp;口苦</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="四肢疼痛">&thinsp;&thinsp;四肢疼痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="反酸">&thinsp;&thinsp;反酸</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="易饥">&thinsp;&thinsp;易饥</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="腹泻">&thinsp;&thinsp;腹泻</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="肠鸣">&thinsp;&thinsp;肠鸣</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="关节酸楚">&thinsp;&thinsp;关节酸楚</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="咳嗽">&thinsp;&thinsp;咳嗽</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="完谷不化">&thinsp;&thinsp;完谷不化</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="尿无力">&thinsp;&thinsp;尿无力</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="嗳气">&thinsp;&thinsp;嗳气</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="周身瘙痒">&thinsp;&thinsp;周身瘙痒</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="胃痛">&thinsp;&thinsp;胃痛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="矢气频频">&thinsp;&thinsp;矢气频频</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="zhengzhuang" value="腿酸">&thinsp;&thinsp;腿酸</td>
                        </tr>

                    </table>
                </div>
                <div role="tabpanel" class="tab-pane" id="shezhi">
                    <table class="table table-striped">
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="淡红">&thinsp;&thinsp;淡红</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="淡白">&thinsp;&thinsp;淡白</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="红">&thinsp;&thinsp;红</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="白">&thinsp;&thinsp;白</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="绛">&thinsp;&thinsp;绛</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="青">&thinsp;&thinsp;青</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="紫">&thinsp;&thinsp;紫</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="老">&thinsp;&thinsp;老</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="嫩">&thinsp;&thinsp;嫩</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="胖">&thinsp;&thinsp;胖</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="瘦">&thinsp;&thinsp;瘦</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="点">&thinsp;&thinsp;点</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="刺">&thinsp;&thinsp;刺</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="裂">&thinsp;&thinsp;裂</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shezhi" value="齿">&thinsp;&thinsp;齿</td>
                        </tr>
                    </table>
                </div>
                <div role="tabpanel" class="tab-pane" id="shetai">
                    <table class="table table-striped">
                        <tr>
                            <td><input type="checkbox" name="shetai" value="厚">&thinsp;&thinsp;厚</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="薄">&thinsp;&thinsp;薄</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="润">&thinsp;&thinsp;润</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="燥">&thinsp;&thinsp;燥</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="少津">&thinsp;&thinsp;少津</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="腻">&thinsp;&thinsp;腻</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="腐">&thinsp;&thinsp;腐</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="剥落">&thinsp;&thinsp;剥落</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="真">&thinsp;&thinsp;真</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="假">&thinsp;&thinsp;假</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="少">&thinsp;&thinsp;少</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="无">&thinsp;&thinsp;无</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="白">&thinsp;&thinsp;白</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="黄">&thinsp;&thinsp;黄</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="shetai" value="灰黑">&thinsp;&thinsp;灰黑</td>
                        </tr>
                    </table>
                </div>
                <div role="tabpanel" class="tab-pane" id="maixiang">
                    <table class="table table-striped">
                        <tr>
                            <td><input type="checkbox" name="mai" value="浮">&thinsp;&thinsp;浮</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="沉">&thinsp;&thinsp;沉</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="迟">&thinsp;&thinsp;迟</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="数">&thinsp;&thinsp;数</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="洪">&thinsp;&thinsp;洪</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="细">&thinsp;&thinsp;细</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="虚">&thinsp;&thinsp;虚</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="实">&thinsp;&thinsp;实</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="滑">&thinsp;&thinsp;滑</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="涩">&thinsp;&thinsp;涩</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="弦">&thinsp;&thinsp;弦</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="紧">&thinsp;&thinsp;紧</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="结">&thinsp;&thinsp;结</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="代">&thinsp;&thinsp;代</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="促">&thinsp;&thinsp;促</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="长">&thinsp;&thinsp;长</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="短">&thinsp;&thinsp;短</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="缓">&thinsp;&thinsp;缓</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="濡">&thinsp;&thinsp;濡</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="弱">&thinsp;&thinsp;弱</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="微">&thinsp;&thinsp;微</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="散">&thinsp;&thinsp;散</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="芤">&thinsp;&thinsp;芤</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="伏">&thinsp;&thinsp;伏</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="牢">&thinsp;&thinsp;牢</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="革">&thinsp;&thinsp;革</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="动">&thinsp;&thinsp;动</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="mai" value="疾">&thinsp;&thinsp;疾</td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>


        <div style="position:absolute;left:92px;top:690px">
            <button class="btn btn-primary" type="submit">开始检查</button>
        </div>

        <div class="dropdown" style="position:absolute;right:0px;top: 6px">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="true">${user.userName}<span class="caret"></span></button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="message"><span class="glyphicon glyphicon-user"
                                            aria-hidden="true"/>&thinsp;个人资料</a></li>
                <li><a href="exit"><span class="glyphicon glyphicon-log-out"
                                         aria-hidden="true"/>&thinsp;退出</a></li>
            </ul>
        </div>

    </form>
</div>
    </div>

</body>
</html>
