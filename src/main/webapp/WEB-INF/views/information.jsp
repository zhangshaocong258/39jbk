<%--
  Created by IntelliJ IDEA.
  User: zsc
  Date: 2017/1/18
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="user" value="${sessionScope.loginSession}"/>
<html>
<head>
    <title>information</title>
    <link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value='/static/js/jquery-3.2.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <style>
        body {
            background-image: url(<c:url value='/static/img/个人信息.png'/>);
            background-size: 100%;
            background-position: center;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<div style="position:relative;left:0px;top:0px">
    <form class="form-horizontal" action="select" method="get">

        <div style="position:absolute;left:770px;top:252px">
            <label class="radio-inline">
                <input type="radio" name="gender" id="inlineRadio1" style="width:22px;height:22px"
                       value="male" checked>
            </label>
            &#12288;&#12288;&#12288;&#12288;&#8197;
            <label class="radio-inline">
                <input type="radio" name="gender" id="inlineRadio2" style="width:22px;height:22px"
                       value="female">
            </label>
        </div>


        <div style="position:absolute;left:770px;top:350px">
            <select name="age" value="啊啊啊啊啊" class="form-control" style="width:160px;">
                <option>未选择</option>
                <option>1岁</option>
                <option>2岁</option>
                <option>3岁</option>
                <option>4岁</option>
                <option>5岁</option>
                <option>6岁</option>
                <option>7岁</option>
                <option>8岁</option>
                <option>9岁</option>
                <option>10岁</option>
                <option>11岁</option>
                <option>12岁</option>
                <option>13岁</option>
                <option>14岁</option>
                <option>15岁</option>
                <option>16岁</option>
                <option>17岁</option>
                <option>18岁</option>
                <option>19岁</option>
                <option>20岁</option>
                <option>21岁</option>
                <option>22岁</option>
                <option>23岁</option>
                <option>24岁</option>
                <option>25岁</option>
                <option>26岁</option>
                <option>27岁</option>
                <option>28岁</option>
                <option>29岁</option>
                <option>30岁</option>
                <option>31岁</option>
                <option>32岁</option>
                <option>33岁</option>
                <option>34岁</option>
                <option>35岁</option>
                <option>36岁</option>
                <option>37岁</option>
                <option>38岁</option>
                <option>39岁</option>
                <option>40岁</option>
                <option>41岁</option>
                <option>42岁</option>
                <option>43岁</option>
                <option>44岁</option>
                <option>45岁</option>
                <option>46岁</option>
                <option>47岁</option>
                <option>48岁</option>
                <option>49岁</option>
                <option>50岁</option>
                <option>51岁</option>
                <option>52岁</option>
                <option>53岁</option>
                <option>54岁</option>
                <option>55岁</option>
                <option>56岁</option>
                <option>57岁</option>
                <option>58岁</option>
                <option>59岁</option>
                <option>60岁</option>
                <option>61岁</option>
                <option>62岁</option>
                <option>63岁</option>
                <option>64岁</option>
                <option>65岁</option>
                <option>66岁</option>
                <option>67岁</option>
                <option>68岁</option>
                <option>69岁</option>
                <option>70岁</option>
                <option>71岁</option>
                <option>72岁</option>
                <option>73岁</option>
                <option>74岁</option>
                <option>75岁</option>
                <option>76岁</option>
                <option>77岁</option>
                <option>78岁</option>
                <option>79岁</option>
                <option>80岁</option>
                <option>81岁</option>
                <option>82岁</option>
                <option>83岁</option>
                <option>84岁</option>
                <option>85岁</option>
                <option>86岁</option>
                <option>87岁</option>
                <option>88岁</option>
                <option>89岁</option>
                <option>90岁</option>
                <option>91岁</option>
                <option>92岁</option>
                <option>93岁</option>
                <option>94岁</option>
                <option>95岁</option>
                <option>96岁</option>
                <option>97岁</option>
                <option>98岁</option>
                <option>99岁</option>
            </select>
        </div>


        <div style="position:absolute;left:770px;top:430px">
            <select name="profession" class="form-control" style="width:213px;">
                <option>未选择</option>
                <option>工人</option>
                <option>教师</option>
                <option>农民</option>
                <option>服务员</option>
                <option>司机</option>
                <option>厨师</option>
                <option>白领</option>
                <option>医师</option>
                <option>公务员</option>
                <option>销售</option>
                <option>其他</option>
            </select>
        </div>


        <div style="position:absolute;left:770px;top:600px">
            <button class="btn btn-primary" type="submit">下一步</button>
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
