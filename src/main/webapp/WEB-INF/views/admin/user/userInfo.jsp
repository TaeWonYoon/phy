<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://taewonyoon.github.io/developerLib/script.js"></script>
<style>
    .cont_top_wrap{overflow: hidden;height: 200px;border: 1px solid #eee;box-sizing: border-box;text-align: center;margin-bottom: 50px;}
    .cont_top_left{float: left;width: 50%;border-right: 1px solid #eee;box-sizing: border-box;height: 200px;padding-top: 50px;}
    .cont_top_left_cont{ margin-bottom: 20px; }
    .cont_top_left_cont input{height: 40px;border-radius: 5px;margin-left: 15px;width: 100px;margin-right: 5px;}
    .cont_top_right{float: left;width: 50%;padding-top: 50px;box-sizing: border-box;height: 200px;}
    .cont_top_right_cont{margin-bottom: 20px;}
    .cont_top_right_cont select{width: 130px;margin-right: 15px;border-radius: 5px;height: 40px;}
    select#name{width: 80px;}
    .cont_top_right_cont input{width: 130px;height: 40px;border-radius: 5px;}
    .cont_top_right_cont a{display: inline-block;text-align: center;width: 60px;height: 40px;line-height: 40px;background: #06f;color: #fff;border-radius: 5px;margin-left: 15px;position: relative;top: 1px;}
    .cont_count{font-size: 16px;font-weight: bold;margin-bottom: 10px;text-align: left;}
    td .mg_inp{width: 100%;}
    .sub_tit{margin-top: 40px;font-size: 25px;text-align: left;margin-bottom: 10px;}
    .page_cont_wrap{margin-bottom: 60px;}
    .main_left{width: 65%;float: left;}
    .main_right{width: 35%;float: left;padding-left: 40px;box-sizing: border-box;}
    .my_table{overflow: hidden;}
    .main_right textarea{width: 100%;resize: none;height: 300px;margin-bottom: 20px;}
    a.od_btn7{width: 50px;}
    a.od_btn6{width: 50px;}
    .red {color:red;}
</style>

<div class="main_wrap">
    <div class="main_div">
        <form name="#" method="post">
            <div class="pop_po_add" style="border: 1px solid;">
                <div class="pop_t_div">
                    <ul class="font-16 color-000 font-b">회원정보 수정</ul>
                    <div class="cb"></div>
                </div>
                <div class="my_table font-13 font-r">
                    <div class="main_left">
                        <div class="my_table font-13 font-r">
                            <table width="100%" border="0" cellspacing="0" cellpadding="10" class="text-center">
                                <tbody>
                                <tr>
                                    <td width="25%" class="font-b">아이디 / 이름</td>
                                    <td width="25%" class="font-b">
                                        <input type="text"  id="userId" value="${uvo.id}/${uvo.name}" class="mg_inp font-m" disabled>
                                    </td>
                                    <td width="25%" class="font-b">비밀번호</td>
                                    <td width="25%" class="font-b">
                                        <input type="button" value="초기화" class="mg_inp font-m" id="pwdBtn"> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25%" class="font-b">이메일</td>
                                    <td width="25%" class="font-b">
                                        <input type="text"  id="userEmail" value="" id="phone" class="mg_inp font-m" maxlength="30">
                                    </td>
                                    <td width="25%" class="font-b">휴대폰</td>
                                    <td width="25%" class="font-b">
                                        <input type="text" id="userPhone" value="${uvo.phone}" class="mg_inp font-m">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="font-b" rowspan="3">주소</td>
                                    <td width="70%" class="font-b" colspan="3">
                                    	${uvo.address}
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%" class="font-b" rowspan="3"></td>
                                    <td width="70%" class="font-b" colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25%" class="font-b">회원가입일</td>
                                    <td width="25%" class="font-b" id="regDate">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <button type="button"class="od_btn3 font-r" onclick="userModify()" name="">수정</button>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td width="25%" class="font-b">회원 IP</td>
                                    <td width="25%" class="font-b" colspan="3"><input type="text" name="b_number" value="<?=$b_number?>" class="mg_inp font-m"></td>
                                </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="main_right">
                         <a href="#" id="memoAdd" class="od_btn3 font-r">메모추가</a>
                        <div class="memoList">
                               <p class="sub_tit font-b">메모</p>
                               <div class="main_right_box">
                                   <textarea style="width: 100%; height: 100px;" class="userMemo">${uvo.memo}</textarea>
                                   <button type="button"class="od_btn3 font-r" id="userMemoAdd">저장</button>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--div class="mt-20 text-center">
                <button type="submit" class="font-16 font-m color-fff po_confirm">확인</button>
                <button type="button" onclick="self.close();"class="font-16 font-m color-fff po_confirm2">취소</button>
            </div-->
            <input type="hidden" value="${uvo.seq}" id="useq"/>
            <input type="hidden" value="${uvo.regDate}" id="bregDate"/>
        </form>

    </div>
</div>
<form id="formSub"></form>

<script src="/resources/pageJs/admin/user/userInfo.js"></script>
<script>
	
</script>
</body>
</html>
