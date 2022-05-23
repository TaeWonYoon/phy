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
                                            <option value="userName">이름</option>
                                            <option value="userId">아이디</option>
                                            <option value="userEmail">이메일</option>
                                            <option value="userPhone">휴대폰</option>
                                            <option value="niep">휴대폰,이메일,아이디,이름</option>
                                        </select>
                                        <input type="text" name="keyword" id="searchText" value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>기간</th>
                                <td>
                                    <input type="date" name="startDate" value="">
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
                    <tbody class="tb_css">
                        <tr>
                            <td colspan="6">등록된 회원이 없습니다.</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
	    </div>
	</article>
</section>

</body>
</html>