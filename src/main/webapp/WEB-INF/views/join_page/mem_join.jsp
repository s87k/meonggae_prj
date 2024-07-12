<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="멍개장터 회원가입"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터</title> 
<link rel="icon" href="../common/tamcatIcon.ico"/>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">

<!-- Theme Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/sign_up.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/join-board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/join-main.css">

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- datepicker 끝-->

<!--다음 우편번호 API 시작-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--다음 우편번호 API 끝-->

<!-- <script src ="../common/JS/script.js"></script> -->
<jsp:include page="../main_page/script.jsp" />
<script src ="${pageContext.request.contextPath}/common/JS/mem_join.js"></script>
</head>
<body>
<!-- header 시작 -->
<jsp:include page="../header/header.jsp" />
<!-- header 끝 -->

<c:choose>
	<c:when test="${ not empty result && result == 'true' }">
		<script>
			alert("회원가입 되었습니다.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
	<c:when test="${ not empty result && result == 'false' }">
		<script>
			alert("회원가입에 실패했습니다. 잠시후 다시 시도해주세요.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
</c:choose>
<div class="container" style="height:100%">
<!-- 회원가입 시작 -->
<form name="frm" id="frm" action="${pageContext.request.contextPath}/memJoin.do" method="post">
        <!-- 이용약관 시작 -->
        <div class="agree">
            <div>
                <h5>제1장 총칙</h5>
                <p>제1조 목적</p>
                <p>이 약관은 멍게장터에서 제공하는 서비스 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 멍게장터과(와) 이용자의 권리, 의미 및 책임사항 등을 규정함을 목적으로 합니다.</p>
            </div>
            <div>
                <h5>제2조 약관의 효력과 변경</h5>
                <p>(1) 이 약관은 이용자에게 공시함으로서 효력이 발생합니다.</p>
                <p>(2) 멍게장터는 사정 변경의 경우와 영업상 중요사유가 있을 때 약관을 변경할 수 있으며, 변경된 약관은 전항과 같은 방법으로 효력이 발생합니다.</p>
            </div>
            <div>
                <h5>제3조 약관 외 준칙</h5>
                <p>이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.</p>
            </div>
            <div>
                <h5>제2장 회원 가입과 서비스 이용</h5>
                <p>제1조 회원의 정의</p>
                <p>회원이란 멍게장터에서 회원으로 적합하다고 인정하는 일반 개인으로 본 약관에 동의하고 서비스의 회원가입 양식을 작성하고 'ID'와 '비밀번호'를 발급받은 사람을 말합니다.</p>
                <p>제2조 서비스 가입의 성립</p>
                <p>(1) 서비스 가입은 이용자의 이용신청에 대한 멍게장터의 이용승낙과 이용자의 약관내용에 대한 동의로 성립됩니다.</p>
                <p>(2) 회원으로 가입하여 서비스를 이용하고자 하는 희망자는 멍게장터에서 요청하는 개인 신상정보를 제공해야 합니다.</p>
                <p>(3) 이용자의 가입신청에 대하여 멍게장터에서 승낙한 경우, 멍게장터는 회원 ID와 기타 멍게장터에서 필요하다고 인정하는 내용을 이용자에게 통지합니다.</p>
                <p>(4) 가입할 때 입력한 ID는 변경할 수 없으며, 한 사람에게 오직 한 개의 ID가 발급됩니다.</p>
            </div>
            <p>이 약관은 2024년 06월 3일 시행합니다.</p>
        </div>
        <div class="chkAgree">
            <p><input type="checkbox" id="agree1" checked="checked" required> 회원가입약관에 동의합니다.</p>
        </div>
        <div class="space"></div>
        <div class="agree">
            <h5>[개인정보 수집에 대한 동의]</h5>
            <p>멍게장터는 귀하께 회원가입시 개인정보보호방침 또는 이용약관의 내용을 공지하며 회원가입버튼을 클릭하면 개인정보 수집에 대해 동의하신 것으로 봅니다.</p>

            <h5>[개인정보의 수집목적 및 이용목적]</h5>
            <p>멍게장터는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.</p>
            <ul>
                <li>서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 목적</li>
                <li>회원 관리</li>
                <li>마케팅 및 광고에 활용</li>
            </ul>

            <h5>[수집하는 개인정보 항목]</h5>
            <p>멍게장터는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
            <p>- 수집항목: 이름, 생년월일, 성별, 로그인 ID, 비밀번호, 자택 전화번호, 자택 주소, 휴대전화번호</p>

            <h5>[개인정보의 보유기간 및 이용기간]</h5>
            <p>귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.</p>
            <p>- 회원 가입정보의 경우, 회원 가입을 탈퇴하거나 회원에서 제명된 때</p>
            <p>단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
            <p>보존 근거 : 고용보험 환급 적정성 심의</p>
            <p>보존 기간 : 3년</p>
        </div>
        <div class="chkAgree">
            <p><input type="checkbox" id="agree2" checked="checked" required> 개인정보취급방침에 동의합니다.</p>
        </div>

        <!-- 이용약관 끝 -->
        <!-- 회원 정보입력 시작 -->
	<div class="writeForm">
			<table>
				<colgroup>
					<col class="writeForm_col01" />
					<col width="*" />
				</colgroup>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input data-value="아이디를 입력해주세요." name="id" id="id" class="inputTxt inputIdtype essential" type="text" maxlength="20"  />
						<button type="button" id="idChk" class="exclude-input button button--quidel button--inverted button--text-thick button--text-upper button--size-s">
						<i class="button__icon icon icon-flag"></i>
						<span>ID 중복확인</span>
						</button>
						<span>*아이디를 영문, 숫자를 모두 포함하여 5~12자 이내로 입력해주세요.</span>
						<div class="error_text item_style" id="idMsg" style="display: none;"></div>
					</td>
				</tr>
				<tr>
					<th><label for="password">비밀번호</label></th>
					<td>
						<input data-value="비밀번호를 입력해주세요." name="password" id="password" class="inputPass size02 essential" type="password" />
						<span>*영문, 숫자, 특수문자 3가지를 모두 포함하여 6~12자 이내로 입력해주세요.</span>
						<div class="error_text item_style" id="passwordMsg" style="display: none;"></div>
					</td>
				</tr>
				<tr>
					<th><label for="password2">비밀번호 확인</label></th>
					<td>
						<input data-value="비밀번호를 입력해주세요." name="password2" id="password2" class="inputPass size02 mmarT10" type="password"  />
						<span>*비밀번호를 한번 더 입력해주세요</span>
					</td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input data-value="이름을 입력해주세요." id="name" name="name" class="inputTxt inputName essential" type="text" maxlength="15"/>
						<div class="error_text item_style" id="nameMsg" style="display: none;"></div>
					</td>
				</tr>
				<tr>
                    <th scope="row"><label for="nick">닉네임</label></th>
                    <td>
                        <input data-value="닉네임를 입력해주세요." name="nick" id="nick" class="inputTxt inputIdtype essential" type="text" maxlength="20"  />
                        <button type="button" id="nickChk" style="width: auto !important" class="exclude-input button button--quidel button--inverted button--text-thick button--text-upper button--size-s">
						<i class="button__icon icon icon-flag"></i>
						<span>닉네임 중복확인</span>
						</button>
                        <span>*닉네임을 한글, 영문, 숫자를 사용하여 1~12자 이내로 입력해주세요.</span>
                        <div class="error_text item_style" id="nickMsg" style="display: none;"></div>
                    </td>
                </tr>
                <tr>
                    <th><label for="email1">이메일</label></th>
                    <td class="mail_type">
                        <input data-value="이메일을 입력해주세요." name="email1" id="email1" class="inputEmail essential" type="text" maxlength="100"  />
                        <span class="email_txt">@</span>
                        <input type="text" list="selecEmail" name="email2" id="email2">
                        <datalist class="selecEmail" name="selecEmail" id="selecEmail" data-value="이메일을 선택해주세요.">
                            <option value="">선택해주세요.</option>
                            <option value='직접 입력'>직접 입력</option>
                            <option value='naver.com'>naver.com</option>
                            <option value='daum.net'>daum.net</option>
                            <option value='gmail.com'>gmail.com</option>
                            <option value='hotmail.com'>hotmail.com</option>
                            <option value='nate.com'>nate.com</option>
                            <option value='korea.com'>korea.com</option>
                        </datalist>
                        <div class="error_text item_style" id="email1Msg" style="display: none;"></div>
                        
                    </td>
                </tr>
				<tr>
					<th scope="row"><label for="">생년월일</label></th>
					<td >
						<input type="text" name="birthday" id="datepicker" class="essential" readonly="readonly">
						<span id="CalregistdateIcon"> 
							<span class="fa fa-calendar" id="cReqDate"></span>
						</span>
						<div class="error_text item_style" id="datepickerMsg" style="display: none;"></div>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="cell" class="essential" id="cell" value="" data-value="전화번호를 입력해주세요."/>
						<div class="error_text item_style" id="cellMsg" style="display: none;"></div>
					</td>
				</tr>
				<tr>
					<th><label for="gender">성별</label></th>
		 			<td> 
						<input data-value="성별을 선택하세요." name="gender" type="radio" id="radio_check01" value="M" /><label for="radio_check01">남자</label>
		 				<input name="gender" type="radio" id="radio_check02"  value="F"/><label for="radio_check02">여자</label>
		 				<div class="error_text item_style" id="genderMsg" style="display: none;"></div>
		 			</td> 
				</tr> 
				<tr>
					<th><label for="zipcode">우편번호</label></th>
					<td>
						<input data-value="우편번호를 입력해주세요." type="text" class="zipcode essential" id="zipcode" name="zipcode" value="" readonly="readonly" maxlength="5"/>
						<button type="button" id="addChk" class="exclude-input exclude-input button button--quidel button--inverted button--text-thick button--text-upper button--size-s">
						<i class="button__icon icon icon-flag"></i>
						<span>우편번호검색</span>
						</button>
						<div class="error_text item_style" id="zipcodeMsg" style="display: none;"></div>
					</td>
				</tr>
				<tr>
					<th><label for="addr0">주소</label></th>
					<td class="addr_td">
						<input data-value="주소를 입력해주세요." type="text" id="addr0" class="addr essential" name="addr0" value="" readonly="readonly" maxlength="100"/><br />
						<input data-value="상세주소를 입력해주세요." type="text" id="addr1" class="addr essential" name="addr1" value="" style="margin-top:7px;" maxlength="100"/>
						<div class="error_text item_style" id="addr0Msg" style="display: none;"></div>
						<div class="error_text item_style" id="addr1Msg" style="display: none;"></div>
					</td>
				</tr>
			</table>
	<div class="writeForm_btn">
		<button type="button" class="joinBtn" id="btnSubmit"><span>회원가입</span></button>
		<button type="button" class="joinBtn" id="btnCancle" style="width: 176.41px"><span>취소</span></button>
	</div>
	</div>
</form>
</div>
<!-- 회원가입 끝 -->

<!-- footer 시작 -->
<jsp:include page="../footer/footer.jsp" />
<!-- footer 끝 -->
