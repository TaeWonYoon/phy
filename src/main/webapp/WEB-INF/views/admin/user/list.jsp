<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %> <!-- header -->

<section>
	<%@ include file="/WEB-INF/views/layout/admin/leftMenu.jsp" %>
	<article class="article">
	    <div class="contents">
	        <div class="page_name">
                    <h1>회원목록</h1>
                </div>
                <div class="page_search">
                    <table class="tb_css">
                        <tbody>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <div>
                                        <select name="searchType" id="searchType">
                                        	<option value="">전체</option>
                                            <option value="name">이름</option>
                                            <option value="id">아이디</option>
                                            <option value="phone">휴대폰</option>
                                        </select>
                                        <select name="department" id="department">
                                        	<option value="">부서</option>
                                            <option value="1">인턴</option>
                                            <option value="2">선임</option>
                                            <option value="3">책임</option>
                                            <option value="9">대표</option>
                                        </select>
                                        <select name="position" id="position">
                                        	<option value="">직급</option>
                                            <option value="1">개발</option>
                                            <option value="2">운영</option>
                                            <option value="3">인사</option>
                                            <option value="9">대표</option>
                                        </select>
                                        <input type="text" name="keyword" id="searchText" value="">
                                        <button type="button" id="btnSearch">검색</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>기간</th>
                                <td>
                                    	시작 날짜 <input type="date" name="startDate" value="">
                                    	종료 날짜 <input type="date" name="finishDate" value="">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <table class="tb_css">
                    <colgroup>
                        <col width="7%">
                        <col width="10%">
                        <col width="15%">
                        <col width="15%">
                        <col width="35%">
                        <col width="18%">
                    </colgroup>
                    <thead class="th_css">
                        <tr>
                            <th>번호</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>휴대폰번호</th>
                            <th>주소</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody class="tb_css" id="tbody">
                    </tbody>
                </table>
                <div id="paging">
                </div>
	    </div>
	</article>
</section>
<script src="${resources}/pageJs/admin/user/list.js"></script>
</body>
</html>