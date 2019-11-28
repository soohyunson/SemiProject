<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 입금신청</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js"
	type="application/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<style>
.container {
	width: 90%;
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

.noscriptmsg {
	margin: auto;
	margin-top: 200px;
	text-align: center;
}
</style>
	<div class="noscriptmsg">
		이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다. <br> <a
			href="http://www.enable-javascript.com/ko/" target="_blank">
			브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
	</div>
</noscript>
<body>


	<div class="pagecontainer">
		<nav class="navbar navbar-light bg-light">
			<a class="navbar-brand" href="#"> <img
				src="/docs/4.3/assets/brand/bootstrap-solid.svg" width="30"
				height="30" class="d-inline-block align-top" alt="">

			</a>
			<button id="close" class="btn btn-sm btn-outline-secondary border-0"
				type="button">
				<i class="material-icons"> close</i>
			</button>
		</nav>

		<div class="container-bg">
			<div class="container">
				<div class="row">
					<div class="col">
						<h2></h2>
						<h3 class="text-center">입금신청</h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6>현재 포인트</h6>
						<div class="input-group mb-3">
							<input id="inputMoney" type="text" class="form-control"
								readonly="readonly" value="">
							<div class="input-group-append">
								<span id="removeMoney" class="input-group-text"> P </span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6>입급 신청 포인트</h6>
						<div class="input-group mb-3">
							<input id="inputMoney" type="text" class="form-control">
							<div class="input-group-append">
								<span id="removeMoney" class="input-group-text"> <i
									class="material-icons"> close</i></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p>
							<span class="text-left" data-toggle="tooltip"
								data-placement="bottom"
								title="충전 단위는 1,000원 단위입니다. &#10;&#13; 1회 최대 충전금액은 100만원입니다.">
								<i class="material-icons">help_outline</i> 50,000 포인트부터 입금이
								가능합니다.
							</span>
						</p>
					</div>
				</div>
				<div class="row">
					<div id="addMoney" class="col">
						<div class="card text-center">
							<div class="card-body">
								<button type="button" onclick="addMoney(1000)"
									class="btn btn-outline-primary addMoney">전체입금</button>
								<button type="button" onclick="addMoney(1000)"
									class="btn btn-outline-primary addMoney">+1,000 P</button>
								<button type="button" onclick="addMoney(3000)"
									class="btn btn-outline-primary addMoney">+3,000 P</button>
								<button type="button" onclick="addMoney(5000)"
									class="btn btn-outline-primary addMoney">+5,000 P</button>
								<button type="button" onclick="addMoney(10000)"
									class="btn btn-outline-primary addMoney">+10,000 P</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col">
						<h6>계좌 선택</h6>
						<div class="form-group">
							<label for="exampleFormControlSelect1">입금 은행을 선택해주세요.</label> <select
								class="form-control" id="exampleFormControlSelect1">
								<option>KEB하나은행</option>
								<option>SC제일은행</option>
								<option>국민은행</option>
								<option>신한은행</option>
								<option>외환은행</option>
								<option>우리은행</option>
								<option>한국시티은행</option>
								<option>BNK경남은행</option>
								<option>광주은행</option>
								<option>DGB대구은행</option>
								<option>BNK부산은행</option>
								<option>전북은행</option>
								<option>제주은행</option>
								<option>기업은행</option>
								<option>농협</option>
								<option>새마을금고</option>

							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="input-group mb-3">
							<input id="inputMoney" type="text" class="form-control"
							placeholder=" - 없이 입력(계좌번호)">
							<div class="input-group-append">
								<span id="removeMoney" class="input-group-text"> <i
									class="material-icons"> close</i></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center pt-5">
					<div class="col">
						<button id="pay" type="button" class="btn btn-primary btn-lg">결제</button>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col">
						<div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h2 class="">
										<button class="btn btn-link" type="button"
											data-toggle="collapse" data-target="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">유의사항</button>
									</h2>
								</div>
								<div id="collapseOne" class="collapse hiden"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="list-group list-group-flush">
											<li class="list-group-item">보유한 포인트를 현금으로 받으실 수 있습니다.</li>
											<li class="list-group-item">1000포인트 이상 1000포인트 단위로 입금이
												가능합니다.</li>
											<li class="list-group-item">365일 00:10 ~ 23:50 전환 가능
												합니다.</li>
											<li class="list-group-item">단, 시스템 정비 시간은(23:50 ~ 00:10)
												서비스 이용불가</li>
											<li class="list-group-item">50,000 포인트 이상 보유시 1 포인트 단위로
												입금이 가능합니다.</li>
											<li class="list-group-item">개인의 실명이름 외에 법인사업자 또는 개인사업자의
												상호명, 동호회와 같은 모임명칭 등 기재사항이 등재되어 있는 계좌에 대해 입금이 제한될 수 있습니다.</li>
										</ul>
									</div>
								</div>
							</div>
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
				//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
				if ($("#inputMoney").val().length < 1) {
					alert("충전 금액을 입력하세요.")
				} else {
					BootPay.request({
						price : $("#inputMoney").val(), //실제 결제되는 가격
						application_id : "5dd10c304f74b4002fc15ac1", //API 아이디 - 고정
						name : '포인트', //결제창에서 보여질 이름
						pg : '', //결제할 pg, 기본값 사용
						method : '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
						show_agree_window : 1, // 부트페이 정보 동의 창 보이기 여부
						/* 
						items : [ {
							item_name : '나는 아이템', //상품명
							qty : 1, //수량
							unique : '123', //해당 상품을 구분짓는 primary key
							price : 1000, //상품 단가
							cat1 : 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
							cat2 : '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
							cat3 : '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
						} ], */
						user_info : {
							username : '사용자 이름',
							email : '사용자 이메일',
							addr : '사용자 주소',
							phone : '010-1234-4567'
						},
						order_id : '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
						params : {
							callback1 : '그대로 콜백받을 변수 1',
							callback2 : '그대로 콜백받을 변수 2',
							customvar1234 : '변수명도 마음대로'
						},
						account_expire_at : '', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
					/*
					extra : {
						start_at : '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
						end_at : '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
						vbank_result : 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
						quota : '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
					}*/
					}).error(function(data) {
						//결제 진행시 에러가 발생하면 수행됩니다.
						console.log(data);
					}).cancel(function(data) {
						//결제가 취소되면 수행됩니다.
						console.log(data);
						alert("결제가 취소되었습니다.");
					}).ready(function(data) {
						// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
						console.log(data);
					}).confirm(function(data) {
						//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
						//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
						console.log(data);
						var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
						if (enable) {
							BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
						} else {
							BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
						}
					}).close(function(data) {
						// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
						console.log(data);
					}).done(function(data) {
						//결제가 정상적으로 완료되면 수행됩니다
						//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
						console.log(data);

						//결제 검증용 키 값
						console.log("receipt_id:" + data.receipt_id);

						post_to_url("payCheck.pay", {
							//결제 검증을 Post로 보내기
							'receipt_id' : data.receipt_id
						});
					});
				}

			})
		</script>
</body>
</html>