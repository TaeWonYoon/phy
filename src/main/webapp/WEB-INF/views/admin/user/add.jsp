<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %> <!-- header -->
<section>
	<%@ include file="/WEB-INF/views/layout/admin/leftMenu.jsp"%>
	<article class="article">
		<div class="contents">
			<h1 class="contents_logo">회원 등록</h1>
			<br>
			
			<form id="formData">
			<table>
				<colgroup>
					<col width="20%">
				</colgroup>
				<tr style="padding-bottom: 50px;">
					<td>이름</td>
					<td>
						<input type="text" class="input_form" name="name">
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" class="input_form" name="id">
					</td>
					<td>
						<button type="button" value="N" class="btn-primary" id="idChk">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="text" class="input_form" name="pwd">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" class="input_form phoneNumber" name="phone" maxlength="13">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" class="input_form" name="adderss">
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="department" id="" class="input_form">
								<option value="">선택</option>
								<option value="9">대표</option>
								<option value="1">개발</option>
								<option value="2">운영</option>
								<option value="3">인사</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>직위</td>
					<td>
						<select name="position" id="" class="input_form">
								<option value="">선택</option>
								<option value="9">대표</option>
								<option value="1">인턴</option>
								<option value="2">선임</option>
								<option value="3">책임</option>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="button" class="btn-green" id="add">회원가입</button>
						<button type="button" class="btn-primary" onclick="history.back()">돌아가기</button>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</article>
</section>

<script>

$("#add").click(function() {
	if($("#idChk").val() == "N") {
		alert('중복확인을 해주세요') 
		return;
	}
	if($('[name="name"]').emptyCheck('이름을')) return;
	if($('[name="id"]').emptyCheck('아이디를')) return;
	if($('[name="pwd"]').emptyCheck('비밀번호를')) return;
	if($('[name="phone"]').emptyCheck('번호를')) return;
	if($('[name="adderss"]').emptyCheck('주소를')) return;
	if($('[name="department"]').emptyCheck('부서를')) return;
	if($('[name="position"]').emptyCheck('직급을')) return;
	var callback = function(data) {
		if(data.result == "SUCCESS") {
			alert(data.resultMsg);
			location.href = "/admin/user/list";
		}
	}
	var formData = new FormData($('#formData')[0]);
	callAjax(formData,"./add.do",callback,true);
})


$("#idChk").click(function() {
	if($('[name="id"]').emptyCheck('아이디를')) return;
	
	var idCallback = function(data) {
		alert(data.resultMsg);
		var idval = data.result == "SUCCESS" ? "Y" : "N";
		$("#idChk").val(idval);
	}
	
	var formData = new FormData($('#formData')[0]);
	callAjax(formData,"./idChk",idCallback,true);
})

//폰 정규식
$(".phoneNumber").keyup(function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
</script>