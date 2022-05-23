<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function navToggle(idx) { $(".nav_list").eq(idx).toggle();}
</script>
<nav class="nav">
    <ul class="li_style">
        <li>
            <a href="javascript:void(0)" onclick="navToggle('0')">회원관리</a>
            
            <ul class="nav_list">
                <li><a href="/admin/user/add">회원등록</a></li>
                <li><a href="/admin/user/list">회원관리</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="navToggle('1')">급여관리</a>
            <ul class="nav_list">
                <li>
                	급여목록
                </li>
            </ul>
        </li>
        <li>
            <a href="">업무일지</a>
        </li>
        <li>
            <a href="">PMS</a>
        </li>
        <li>
            <a href="">로그아웃</a>
        </li>
    </ul>
</nav>