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
    <title>result</title>
    <link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value='/static/js/jquery-3.2.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <style>
        body {
            background-image: url(<c:url value='/static/img/结果.png'/>);
            background-size: 100%;
            background-position: center;
        }
    </style>
</head>
<body>
<div style="position:relative;left:0px;top:0px">
    <form class="form-horizontal" action="result" method="get">
        <div style="position:absolute;left:575px;top:165px">
            <select name="gender" value="${gender}" class="form-control" style="width:80px;">
                <option<c:if test="${gender == 'male'}"> selected = "selected"</c:if>>男</option>
                <option<c:if test="${gender == 'female'}"> selected = "selected"</c:if>>女</option>
            </select>
        </div>

        <div style="position:absolute;left:740px;top:165px">
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


        <div style="position:relative;left:975px;top:165px">
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

        <div style="overflow:auto;position:absolute;left:488px;top:261px;width:220px;">
            <table class="table table-condensed">
                <c:forEach items="${existZhengzhuangs}" var="existZhengzhuang">
                    <tr>
                        <td>&#12288;<input type="checkbox" name="zhengzhuang" value="${existZhengzhuang}" checked>&thinsp;&thinsp;${existZhengzhuang}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="hidden">
            <c:forEach items="${shezhis}" var="shezhi">
                <input type="checkbox" name="shezhi" value="${shezhi}" checked>${shezhi}
            </c:forEach>
            <c:forEach items="${shetais}" var="shetai">
                <input type="checkbox" name="shetai" value="${shetai}" checked>${shetai}
            </c:forEach>
            <c:forEach items="${mais}" var="mai">
                <input type="checkbox" name="mai" value="${mai}" checked>${mai}
            </c:forEach>
        </div>

        <div style="position:absolute;left:750px;top:280px;width:450px;">
            <c:forEach items="${results}" var="result">
                <div class="row">
                    <h3><strong>${result.name}</strong></h3>
                </div>
                <div class="row">
                    <p>&#12288;&#12288;${result.description}</p>
                </div>
                <div class="row">
                    <h6 style="color:#999999;">可能性:&thinsp;${result.pro}</h6>
                </div>
                <div class="row">
                    <hr>
                </div>
            </c:forEach>
        </div>


        <div style="position:absolute;left:630px;top:232px">
            <button class="btn btn-primary btn-sm" type="submit">重新检查</button>
        </div>

        <div class="dropdown" style="position:absolute;left:1380px;top:80px">
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

</body>
</html>
