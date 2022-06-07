$(document).ready(function() {
	var regDate = $("#bregDate").val();
	regDate = dateFormatter(regDate);
	$("#regDate").text(regDate);
})


$("#pwdBtn").click(function() {
	var seq = $("#useq").val();
	var callback = function(data) {
		alert(data.resultMsg);
		console.log(data);
	}
	
	$.ajax({
		type: "POST", 
		url: "./pwd/"+seq,
		    dataType: "json",
		    async : true,
		    success: function (result) {
		    	console.log(result);
				callback(result)
		    }, error: function(xhr, status, err) {
				 console.log('entered error...');
				 console.log("xhr : " + xhr);
				 console.log("status : " + status);
				 console.log("err : " + err);   
		    }
	})
})

$("#userMemoAdd").click(function() {
	var seq = $("#useq").val();
	var memo = $(".userMemo").val();
	var param = {
			"seq" : seq,
			"memo" : memo,
	}
	var callback = function(data) {
		alert(data.resultMsg);
	}
	
	callAjax(param, "/admin/user/userInfo/memoAdd", callback, true, "p") //데이터, url, 변수 , 신크, p = f 
})
