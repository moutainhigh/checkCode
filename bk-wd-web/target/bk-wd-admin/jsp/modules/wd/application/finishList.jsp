<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!--<!DOCTYPE html>-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title></title>

    <!-- Bootstrap -->
    <link href="${imgStatic }/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="${imgStatic }/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- iCheck -->
    <link href="${imgStatic }/vendors/iCheck/skins/flat/green.css" rel="stylesheet" />
    <!-- PNotify -->
    <link href="${imgStatic }/vendors/pnotify/dist/pnotify.css" rel="stylesheet" />
    <link href="${imgStatic }/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet" />
    <link href="${imgStatic }/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet" />

    <!-- Custom Theme Style -->
    <link href="${imgStatic }/build/css/custom.css" rel="stylesheet" />

    <!-- 重要！样式重写! -->
    <link href="${imgStatic }/zwy/css/custom-override.css" rel="stylesheet" />

    <style type="text/css">
        table#appliaction-list tbody tr td:nth-child(1) {
            text-align: center;
        }
        
        table#appliaction-list tbody tr td:nth-child(2) {
            text-align: center;
        }
        
        table#appliaction-list tbody tr td:nth-child(3) {
            text-align: center;
        }

        table#appliaction-list tbody tr td:nth-child(4) {
            text-align: left;
        }

        table#appliaction-list tbody tr td:nth-child(5) {
            text-align: right;
        }

        table#appliaction-list tbody tr td:nth-child(6) {
            text-align: center;
        }

        table#appliaction-list tbody tr td:nth-child(7) {
            text-align: center;
        }

        table#appliaction-list tbody tr td:nth-child(8) {
            text-align: center;
        }

        table#appliaction-list tbody tr td:nth-child(9) {
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- page content -->

    <div class="wd-content">
        <div class="wd-piece-content col-md-12 col-sm-12 col-xs-12">
            <form action="${ctx}/wd/application/finishList" id="searchForm" method="get">
            <input id="current" name="current" type="hidden" value="1"/>
            <div class="list-page-search-div col-xs-12">
                <div class="col-xs-3">
                    <span class="col-xs-11"> 贷款编号 </span>
                    <div class="col-xs-11">
                        <div class="auto-clear-input">
                             <input type="text" class="form-control" name="customerName" value="${params.customerName }"/>
                        </div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <span class="col-xs-11"> 合同编号 </span>
                    <div class="col-xs-11">
                        <div class="auto-clear-input">
                           <input type="text" class="form-control" name="contractCode" value="${params.contractCode }"/>
                        </div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <span class="col-xs-11"> 客户姓名 </span>
                    <div class="col-xs-11">
                        <div class="auto-clear-input">
                            <input type="text" class="form-control" name="customerName" value="${params.customerName }"/>
                        </div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <span class="col-xs-12"> 贷款产品 </span>
                    <div class="col-xs-12">
                        <spring:eval expression="@wdProductService.selectByRegion(currentUser.companyId)" var="productList"/>
                        <select class="form-control" name="productId">
                            <option value="">全部</option>
                            <c:if test="${not empty productList}">
                                <c:forEach items="${productList}" var="product">
                                    <option value="${product.id }" ${product.id eq params.productId ? 'selected' : '' }>${product.name }</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <table class="table table-striped table-bordered wd-table" id="appliaction-list">
                    <colgroup>
                        <col style="width:170px;" />
                        <col style="width:190px;" />
                        <col style="width:100px;" />
                        <col style="width:160px;" />
                        <col style="width:auto;" />
                        <col style="width:220px;" />
                        <col style="width:220px;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th> 贷款编号 </th>
                            <th> 合同编号 </th>
                            <th> 客户姓名 </th>
                            <th> 贷款产品 </th>
                            <th> 贷款金额 </th>
                            <th> 放款时间 </th>
                            <th> 结清时间 </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pagination.dataList }" var="application">
                            <tr>
                                <td>
                                    <span class="td-span-block-gray" applicationid="${application.id }" data-task-id="${application.wdApplicationTask.id }">
                                       ${application.code }
                                    </span>
                                </td>
                                <td>
                                    ${application.contractCode }
                                </td>
                                <td>
                                    <span class="td-span-block" customerid="${application.customerId}"> ${application.wdPerson.getJsonData().base_info_name} </span>
                                </td>
                                <td> ${application.productName} </td>
                                <td> ${application.getFinalConclusionJson()["loan_check_fund"]} </td>
                                <td> <fmt:formatDate value="${application.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                                <td> <fmt:formatDate value="${application.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="dataTables_wrapper">${pagination}</div>
            </div>
        </div>
    </div>

    <!-- /page content -->
    <!-- jQuery -->
    <script src="${imgStatic }/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${imgStatic }/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- PNotify -->
    <script src="${imgStatic }/vendors/pnotify/dist/pnotify.js"></script>
    <script src="${imgStatic }/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="${imgStatic }/vendors/pnotify/dist/pnotify.nonblock.js"></script>

    <script src="${imgStatic }/zwy/js/wd-common.js"></script>
    <script src="${imgStatic }/zwy/js/wd-common-bind.js"></script>

    <script src="${imgStatic }/vendors/layer/layer.js"></script>
    <script src="${imgStatic }/zwy/js/layer-customer.js"></script>

    <script src="${imgStatic }/zwy/js/pnotify-customer.js"></script>

    <script type="text/javascript">
        var currentPageUrl = {
            customer: "${ctx }/wd/customer/detail", // 客户详情页
            application: "${ctx}/wd/application/detail", // 贷款详情页
            resubmit: "", // 退回的地址
        };

        function SearchApplication() {
        	searchForm.submit();
        }
        
        function ReloadData() {
        	$("#current").val("${pagination.current}");
        	searchForm.submit();
        }

        $(function () {
            // 跳转客户详情
            $("table#appliaction-list").on("click", "span[customerid]", function () {
                var customerid = $(this).attr("customerid");
                window.location.href = currentPageUrl.customer + "?customerId=" + customerid + "&_r=" + Math.random();
            });
            
            // 跳转贷款详情
            $("table#appliaction-list").on("click", "span[applicationid]", function () {
                var customerid = $(this).attr("applicationid");
                window.location.href = currentPageUrl.application + "?applicationid=" + customerid + "&_r=" + Math.random();
            });

            // 搜索事件
            $("div.list-page-search-div").on("change", "input", function () {
                SearchApplication()
            }).on("change", "select", function () {
                SearchApplication()
            }).on("click", "table.category-table td", function () {
                SearchApplication()
            });

            //金额财务显示
            $("table#appliaction-list tbody tr").each(function () {
                var amount = $(this).children("td:eq(4)").html().trim();
                if (!isNaN(amount)) {
                    $(this).children("td:eq(4)").html(Number(amount).formatAsMoney());
                }
            });

        });
        function page(n,s){
			$("#current").val(n);
			$("#searchForm").submit();
        	return false;
        }
    </script>
</body>
</html>