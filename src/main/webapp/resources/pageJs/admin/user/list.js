$("#btnSearch").click(function() {
	list();
})

var pageSize = 10; //페이지 보여줄 개수
	
$(document).ready(function() {
	list();
});

function list(currentPage) {
	currentPage = currentPage || 1;
	var callback = function(data) {
		//log("data",data);
		listView(data,currentPage);
		listPaging(data,currentPage);
	}
	
	var searchType = $("#searchType").val();
	var position = $("#position").val();
	var department = $("#department").val();
	var position = $("#position").val();
	var keyword = $("#keyword").val();
	var startDate = $("[name='startDate']").val();
	var finishDate = $("[name='finishDate']").val();
	
	var param = {
 		currentPage : currentPage,      
	 	pageSize : pageSize,
	 	searchType : searchType,
	 	department : department,
	 	position : position,
	 	keyword : keyword,
	 	startDate : startDate,
	 	finishDate : finishDate,
	 	
	}
	callAjax(param,"./list.do",callback,true,"p"); // 데이터, url, 콜백, 신크, f 폼데이터 p 파람
}

function listView(data,currentPage) {
	var tbody = $("#tbody"); //테이블 리스트
	tbody.empty();
	if(data.listCnt == 0) {
		var text = "<tr>"
        		 + "<td colspan='6'>등록된 회원이 없습니다.</td>"
        		 + "</tr>"
		tbody.html(text)
	} else if(data.listCnt > 0) {
		for(var i=0; i < data.list.length;i++) {
			var idx = (i+(currentPage*pageSize)- pageSize)+ 1;
			log("data",data);
			log("data.list[i].seq",data.list[i].seq);
			var text = "<tr onclick='detail("+ data.list[i].seq + ")'>"
					 + "<td>" + idx + "</td>"
					 + "<td>" + data.list[i].name+ "</td>"
					 + "<td>" + data.list[i].id+ "</td>"
					 + "<td>" + statusVal(data.list[i].department,"0,1,2,3,9","무소속,개발,운영,인사,대표") + "</td>"
					 + "<td>" + statusVal(data.list[i].position,"0,1,2,3,9","무소속,인턴,선임,책임,대표") + "</td>"
					 + "<td>" + data.list[i].phone+ "</td>"
					 + "<td>" + data.list[i].address+ "</td>"
					 + "<td>" + dateFormatter(data.list[i].regDate)+ "</td>"
					 + "</tr>";
			tbody.append(text)
		}
	}
}

var navCnt = 5; // 하단 페이지 개수 
var pageNum = 1; //페이지 시작 번호
var up = "up"; // next
var down = "down"; //prev
function listPaging(data,currentPage) {
	var paging = $("#paging");
	paging.empty(); //초기화
	
	
	var listCnt = data.listCnt; // 총개수
	
	var totalPage = Math.ceil(listCnt/pageSize); //하단의 번호 토탈
	
	var j= pageNum == 1 ? 1 : pageNum; //포문에 기본값 설정
	var pageFor = 0; //반복문처리 카운트

	if(pageNum == 1) { //기본값
		pageFor = navCnt; 
	} else { //반복문 카운트 개수 처리
		pageFor = Math.floor(pageNum)+navCnt-1;
	}
	
	
	for(j;j <=pageFor; j++) {
		if(j <= totalPage) {
			var pages = "";
			if(currentPage == j) {
				pages = "<span><a href='javascript:list(" + j + ")' class='on' >" + j + "</a></span>";
			} else {
				pages = "<span><a href='javascript:list(" + j + ")' >" + j + "</a></span>";
			}
			paging.append(pages);
		}
	}
	
	var next = Math.ceil(pageNum/navCnt) * navCnt; // 다음 페이지 체크
	
	if(next < totalPage) { //next
		var pages = "<span><a href='javascript:pageN(" + pageNum + ","+ up +")'> &#62; </a></span>";
		paging.append(pages);
	}
	
	var prev = pageNum-navCnt; //이전페이지 체크
	if(prev > 0) {
		var pages = "<span><a href='javascript:pageN(" + pageNum + ","+ down +")'> &#60; </a></span>";
		paging.prepend(pages);
	}
	
	
}

function pageN(num,chk) { //페이지 번호 계산 및 데이터 뿌림
	if(chk =="up") { 
		pageNum = num + navCnt;
	}
	if(chk =="down") {
		pageNum = num - navCnt;
	}
	list(pageNum);
}

function detail(seq) {
	var url = "./userInfo";
	window.open(url,'popup','scrollbars=yes,width=1000,height=600,top=100,left=200');
}
