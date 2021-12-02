
/* 프로필 사진 파일 업로드 */
$(document).ready(function () {
	var readURL = function (input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('.avatar').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$(".file-upload").on('change', function () {
		readURL(this);
	});
});

  /* 회원가입 아이디 중복 체크 */
  function fn_idcheck() {
    $.ajax({
      url:'idCheck',
      data: {id:$("#user_id").val()},
      type:"POST",
      success:function(data) {
        var status = $.trim(data);
        if(status == "fail") {
          alert("중복된 아이디입니다.");
        } else {
          alert("사용 가능한 아이디입니다.");
        }
      }
    });
  }
  
  /* 회원가입 닉네임 중복 체크 */
  function fn_nickcheck() {
    $.ajax({
      url:'nickCheck',
      data: {nickname:$("#user_nickname").val()},
      type:"POST",
      success:function(data) {
        var status = $.trim(data);
        if(status == "fail") {
          alert("중복된 닉네임입니다.");
        } else {
          alert("사용 가능한 닉네임입니다.");
        }
      }
    });
  }
  
   /* 회원수정 닉네임 중복 체크 */
  function fn_mnickcheck() {
    $.ajax({
      url:'mnickCheck',
      data: {nickname:$("#user_nickname").val()},
      type:"POST",
      success:function(data) {
        var status = $.trim(data);
        if(status == "fail") {
          alert("중복된 닉네임입니다.");
        } else {
          alert("사용 가능한 닉네임입니다.");
        }
      },
        error:function(error) {
          alert(error);
        }
    });
  }

  
  /* 회원정보 이메일 중복 체크 */
  function fn_emailcheck() {
    $.ajax({
      url:'emailCheck',
      data: {email:$("#user_email").val()},
      type:"POST",
      success:function(data) {
        var status = $.trim(data);
        if(status == "fail") {
          alert("중복된 이메일입니다..");
        } else {
          alert("사용 가능한 이메일입니다.");
        } 
      },
        error:function(error) {
          alert(error);
        }
    });
  }
  
  
 /* 관리자 닉네임 중복 체크 */
  function fn_anickcheck() {
    $.ajax({
      url:'admin/anickCheck',
      data: {nickname:$("#user_nickname").val()},
      type:"POST",
      success:function(data) {
        var status = $.trim(data);
        if(status == "fail") {
          alert("중복된 닉네임입니다.");
        } else {
          alert("사용 가능한 닉네임입니다.");
        }
      },
        error:function(error) {
          console.log(error);
        }
    });
  }


// 회원가입 항목별 공백 확인 alert창 스크립트
function submitJoinForm(form) {
form.userId.value = form.userId.value.trim();
if (form.userId.value.length == 0) {
  alert('로그인 아이디를 입력해주세요.');
  form.userId.focus();
  return false;
}
form.userPassword.value = form.userPassword.value.trim();
if (form.userPassword.value.length == 0) {
  alert('로그인 비밀번호를 입력해주세요.');
  form.userPassword.focus();
  return false;
}

form.userName.value = form.userName.value.trim();
if (form.userName.value.length == 0) {
  alert('이름을 입력해주세요.');
  form.userName.focus();
  return false;
}
form.userEmail.value = form.userEmail.value.trim();
if (form.userEmail.value.length == 0) {
  alert('이메일을 입력해주세요.');
  form.email.focus();
  return false;
}
form.submit();
}



// 다음 주소 검색
  function execution_daum_address() {
    new daum.Postcode({
      oncomplete: function (data) {
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }
          // 주소변수 문자열과 참고항목 문자열 합치기
          addr += extraAddr;
        } else {
          addr += ' ';
        }
        $(".address_input_1").val(data.zonecode);
        $(".address_input_2").val(addr);
        $(".address_input_3").attr("readonly",false);
        $(".address_input_3").focus();
      }
    }).open();
  }