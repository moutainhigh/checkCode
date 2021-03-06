<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head style="background-color: rgb(240,240,240)">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>存货</title>
<!--统一样式，不删-->
<link href="${imgStatic }/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${imgStatic }/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${imgStatic }/build/css/custom.css" rel="stylesheet">
<link href="${imgStatic }/zwy/css/custom-override.css" rel="stylesheet">

<link href="${imgStatic }/zwy/LBQ/css/overview.css" rel="stylesheet">
</head>
<body style="min-height: 590px">
    <div class="wd-content">
        <div class="left_info">
            <div class="tab_content wd100">
                <div class="shop_info">
                    <h3>存货<span style="margin-left: 2em;">存货可销售金额: ${wdApplicationOutstandingAccount.goodsSaleTotal } </span><span>存货合计 : ${wdApplicationOutstandingAccount.goodsTotal } </span></h3>
                    <div class="tb_wrap">
                        <table>
                            <thead>
                                <tr>
                                    <th>货物地点</th>
                                    <th>类别</th>
                                    <th>名称</th>
                                    <th>比例</th>
                                    <th>金额</th>
                                    <th>数量</th>
                                    <th>单位</th>
                                    <th>进价</th>
                                    <th>售价</th>
                                    <th>毛利率</th>
                                    <th>备注</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${wdApplicationGoodsList }" var="wdApplicationGoods">
                                    <tr>
                                        <td>${wdApplicationGoods.goodsAddress }</td>
                                        <td>${wdApplicationGoods.type }</td>
                                        <td>${wdApplicationGoods.name }</td>
                                        <td>${wdApplicationGoods.proportion }</td>
                                        <td>${wdApplicationGoods.price }</td>
                                        <td>${wdApplicationGoods.number }</td>
                                        <td>${wdApplicationGoods.units }</td>
                                        <td>${wdApplicationGoods.buyPrice }</td>
                                        <td>${wdApplicationGoods.sellingPrice }</td>
                                        <td>${wdApplicationGoods.rate }</td>
                                        <td>${wdApplicationGoods.memo }</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- 统一js，不删 -->
<script src="${imgStatic }/vendors/jquery/dist/jquery.min.js"></script>
<script src="${imgStatic }/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${imgStatic }/build/js/custom.js"></script>
<script src="${imgStatic }/zwy/LBQ/js/iframeFix.js"></script>
<!-- Layer -->
<script src="${imgStatic }/vendors/layer/layer.js"></script>
<script src="${imgStatic }/zwy/js/layer-customer.js"></script>
<script type="text/javascript">
$(function(){
    $("#closeCurrentWindow").on("click", function(){
        location.href = "${app_detail_back_url}";
    })
    $("#pass_btn").on("click", function(){
        OpenIFrame("通过审批", "${ctx}/wd/application/detail/reviewView?applicationId=${applicationId}&taskId=${appTaskId}&action=Pass", 1000, 500, function(){
            if (GetLayerData("close_review_view")) {
                SetLayerData("close_review_view", false);
                location.href = "${app_detail_back_url}";
            }
        });
    });
    $("#reject_btn").on("click", function(){
        OpenIFrame("审批拒绝", "${ctx}/wd/application/detail/reviewView?applicationId=${applicationId}&taskId=${appTaskId}&action=Reject", 1000, 500, function(){
            if (GetLayerData("close_review_view")) {
                SetLayerData("close_review_view", false);
                location.href = "${app_detail_back_url}";
            }
        });
    });
    $("#return_btn").on("click", function(){
        OpenIFrame("审批驳回", "${ctx}/wd/application/detail/reviewView?applicationId=${applicationId}&taskId=${appTaskId}&action=Return", 1000, 500, function(){
            if (GetLayerData("close_review_view")) {
                SetLayerData("close_review_view", false);
                location.href = "${app_detail_back_url}";
            }
        });
    });
})
</script>
</body>
</html>