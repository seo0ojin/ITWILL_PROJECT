<%@page import="com.itwill.shop.plan.Plan"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>요금제 선택</title>
</head>
<body>
	<script>
		function updatePrice() {
			var selectedPlan = document.getElementById("selectedPlan");
			var selectedPlanIndex = selectedPlan.selectedIndex;

			if (selectedPlanIndex === 0) {
				document.getElementById("planDC").textContent = null;
				document.getElementById("originPrice").textContent = null;
				document.getElementById("planDesc").textContent = null;
			} else {
				var planInfoArray = selectedPlan.options[selectedPlanIndex]
						.getAttribute("data-info").split(",");
				var planDC = parseInt(planInfoArray[0]);
				var planFare = parseInt(planInfoArray[1]);

				document.getElementById("planDC").textContent = planDC + "%";
				document.getElementById("originPrice").textContent = planFare
						+ "원";

				var planDescArray = [ null, "데이터 완전 무제한+넷플릭스", "데이터 90GB",
						"데이터 50GB", "데이터 30GB", "데이터 10GB", "데이터 완전 무제한" ];

				if (selectedPlanIndex >= 1
						&& selectedPlanIndex <= planDescArray.length) {
					var planDesc = planDescArray[selectedPlanIndex];
					document.getElementById("planDesc").textContent = planDesc;
				} else {
					document.getElementById("planDesc").textContent = null;
				}
			}
		}
	</script>
</head>
<body>
	<form method="post" action="">
		<label for="selectedPlan">요금제 선택: </label> <select name="selectedPlan"
			id="selectedPlan" onchange="updatePrice()">
			<option value="">-- 요금제를 선택하세요 --</option>
			<%
			String[] plan_no = { "7", "3", "4", "5", "6", "8" };
			String[] plan_name = { "5G 초이스", "5G심플 90GB", "5G심플 50GB", "5G심플 30GB", "5G슬림", "스페셜" };
			String[] plan_dc = { "15", "6", "4", "3", "2", "10" };
			String[] plan_fare = { "90000", "69000", "63000", "58000", "55000", "80000" };

			for (int i = 0; i < plan_no.length; i++) {
				String plan_info = plan_dc[i] + "," + plan_fare[i];
			%>
			<option value="<%=plan_no[i]%>" data-info="<%=plan_info%>"><%=plan_name[i]%></option>
			<%
			}
			%>
		</select>
		<div>
			할인율: <span id="planDC"></span>
		</div>
		<div>
			가격: <span id="originPrice"></span>
		</div>
		<div>
			요금제 설명: <span id="planDesc"></span>
		</div>
		<button type="submit">요금제 신청</button>
		<button type="button">취소</button>
	</form>
</body>
</html>