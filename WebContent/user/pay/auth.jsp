<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
.container {
	width: 90%;
}

.addMoney {
	border: 1px;
}
</style>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
<noscript>
	<style>
	.pagecontainer {
		display: none;
	}
	.noscriptmsg{
		text-align: center;
	}
	</style>
	<div class="noscriptmsg">  이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다.
	<br>
	 <a href="http://www.enable-javascript.com/ko/" target="_blank"> 브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
	</div>
</noscript>
<body>


	<div class="pagecontainer">
		<nav class="navbar navbar-light bg-light">
			<a class="navbar-brand" href="#">
			 <img src="/docs/4.3/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">

			</a>
			<button id="close" class="btn btn-sm btn-outline-secondary border-0" type="button">
				<i class="material-icons"> close</i>
			</button>
		</nav>

		<div class="container-bg">
			<div class="container">
				<div class="row">
					<div class="col">
						<h2></h2>
						<h3 class="text-center">충전</h3>
						<h6>충전 금액</h6>
						<div class="input-group mb-3">
							<input id="inputMoney" type="text" class="form-control">
							<div class="input-group-append">
								<span id="removeMoney" class="input-group-text"><i class="material-icons"> close</i></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p>
							<span class="text-left" data-toggle="tooltip" data-placement="bottom" title="충전 단위는 1,000원 단위입니다. &#10;&#13; 1회 최대 충전금액은 100만원입니다."> <i class="material-icons">help_outline</i> 충전은 1,000원 단위입니다.
							</span>
						</p>
					</div>
				</div>
				<div class="row">
					<div id="addMoney" class="col">
						<div class="card text-center">
							<div class="card-body">
								<button type="button" onclick="addMoney(1000)" class="btn btn-outline-dark addMoney">+1,000원</button>
								<button type="button" onclick="addMoney(3000)" class="btn btn-outline-dark addMoney">+3,000원</button>
								<button type="button" onclick="addMoney(5000)" class="btn btn-outline-dark addMoney">+5,000원</button>
								<button type="button" onclick="addMoney(10000)" class="btn btn-outline-dark addMoney">+10,000원</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center pt-5">
					<div class="col">
						<button id="pay" type="button" class="btn btn-primary btn-lg">결제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#close").on("click", function() {
			if (confirm("결제를 취소하시겠습니까? 입력된 내용이 초기화됩니다.")) {
				window.close();
			}
		})

		function addMoney(money) {
			var input = $("#inputMoney").val();
			if (!input) {
				input = 0;
			}

			if (input < 1000000) {
				var result = parseInt(input) + parseInt(money);
				$("#inputMoney").val(result);
			}
		}

		/*
		 * path : 전송 URL
		 * params : 전송 데이터 {'q':'a','s':'b','c':'d'...}으로 묶어서 배열 입력
		 * method : 전송 방식(생략가능)
		 */
		function post_to_url(path, params, method) {
			method = method || "post"; // Set method to post by default, if not specified.
			// The rest of this code assumes you are not using a library.
			// It can be made less wordy if you use one.
			var form = document.createElement("form");
			form.setAttribute("method", method);
			form.setAttribute("action", path);
			for ( var key in params) {
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", key);
				hiddenField.setAttribute("value", params[key]);
				form.appendChild(hiddenField);
			}
			document.body.appendChild(form);
			form.submit();
		}

		$("#inputMoney").on("change", function() {
			//충전 금액 입력 
			var regex = /^[1-9]{1,}0{3,7}/;
			var input = $("#inputMoney").val();
			var result = regex.exec(input);
			console.log(input);
			console.log(result);
			console.log(result != null);

			console.log(input % 10 == 0);

			if (result != null && input % 10 == 0) {
				if (input.length > 8) {
					$("#inputMoney").val("");
				}

			} else {
				$("#inputMoney").val("");
			}
		})

		$("#removeMoney").on("click", function() {
			//충전 금액 지우기
			$("#inputMoney").val("");
		})

		$("#pay").on("click", function() {
			BootPay.request({
				price: 0, // 0으로 해야 한다.
				application_id: "5dd10c304f74b4002fc15ac1",
				name: '본인인증', //결제창에서 보여질 이름
				pg: 'danal',
				method: 'auth', // 빌링키를 받기 위한 결제 수단
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'}
			}).error(function (data) {
				// 본인인증 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function (data) {
				// 본인인증이 취소되면 수행됩니다.
				console.log(data);
			}).done(function (data) {
				// 본인인증이 완료되면 관련된 값이 리턴된다.
				console.log(data);
			});
		})
	</script>
</body>
