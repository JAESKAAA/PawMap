/*
*thomas lee backed up the admin.js file for his admin pages.. on DEc 9th...
*/
/*
let userList = [];
   	
function admin_user_search(){
 
 let urlParams = new URLSearchParams(window.location.search);
 let myParam = urlParams.get('pageNum');
 console.log(myParam);


	let searchValue = $("#searchInput").val();
	
	if(userList.length == 0){
		console.log("if 내부 로그");
	console.log(userList.length);
	$.ajax({
		type : "GET",
		url : "/pawmap/getUserByJson",
		dataType : "json",
		async : false,
		success : function(response){
			console.log(typeof(response));
			console.log(response.userList[2]);
			
		for(let i = 0; i <response.userList.length; i++){
			
			userList.push(response.userList[i]);
		}	
			},
		error : function(e){
			alert(e);
		}
	});
	}

   
	console.log("로그찍을게");
	console.log(userList.length);
	
	let searchList =[];
	for(var i=0; i<userList.length; i++){
		if(userList[i].userId.indexOf(searchValue)!= -1 ){
			searchList.push(userList[i]);
		}
	}
	console.log(searchList);
let str=`<tr>
	 <th class="admin-userseq">#</th>
	 <th class="admin-userid">아이디</th>
	 <th class="admin-useremail">이메일</th>
	 <th class="admin-username">이름/상호명</th>
	 <th class="admin-usertelnum">연락처</th>
	 <th class="admin-address">주소</th>
	 <th class="admin-usernickname">닉네임</th>
	 <th class="admin-role">회원타입</th>
	 <th class="admin-userregdate">등록일</th>
	 <th class="admin-useractionbutton"></th>
</tr>`;
		let pageNum =0;
		 if(myParam!=null){
		pageNum = (parseInt(myParam)-1)*11;
	 }	   		 	
if(searchValue==""){
 let pagingList= userList.slice(pageNum,pageNum+11);
 console.log(pagingList);
 for(var i=0; i<pagingList.length; i++){
  str+=
	  `<tr>
		  <td class="admin-userseq">${pagingList[i].userSeq }</td>
		  <td class="admin-userid">${pagingList[i].userId }</td>
		  <td class="admin-useremail">${pagingList[i].userEmail }</td>
		  <td class="admin-username">${pagingList[i].userName }</td>
		  <td class="admin-usertelnum">${pagingList[i].userTelNum }</td>
		  <td class="admin-address">${pagingList[i].address }</td>
		  <td class="admin-usernickname">${pagingList[i].userNickname }</td>
		  <td class="admin-role">${pagingList[i].role }</td>
		  <td class="admin-userregdate"><fmt:formatDate value="${pagingList[i].userRegDate }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
		  <td class="admin-useractionbutton"><button class="adminpagebuttonformanage" type="button" onclick="location.href='/pawmap/getUser?userId=${pagingList[i].userId}'">수정</button></td>
	  </tr>`;
 console.log(pagingList[i].userSeq);
 };
} else{
 for(var i=0; i<searchList.length; i++){
	 str+=
		 `<tr>
			 <td class="admin-userseq">${searchList[i].userSeq }</td>
			 <td class="admin-userid">${searchList[i].userId }</td>
			 <td class="admin-useremail">${searchList[i].userEmail }</td>
			 <td class="admin-username">${searchList[i].userName }</td>
			 <td class="admin-usertelnum">${searchList[i].userTelNum }</td>
			 <td class="admin-address">${searchList[i].address }</td>
			 <td class="admin-usernickname">${searchList[i].userNickname }</td>
			 <td class="admin-role">${searchList[i].role }</td>
			 <td class="admin-userregdate"><fmt:formatDate value="${searchList[i].userRegDate }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
			 <td class="admin-useractionbutton"><button class="adminpagebuttonformanage" type="button" onclick="location.href='/pawmap/getUser?userId=${searchList[i].userId}'">수정</button></td>
		 </tr>`;
	console.log(searchList[i].userSeq);
	};
}
$("#table_user_admin").html(str);
}

let hospitalList = [];
function admin_hospital_search(){
 let urlParams = new URLSearchParams(window.location.search);
 let myParam = urlParams.get('pageNum');
 console.log("병원함수 호출됐따");
	let searchValue = $("#searchInput").val();
	
	if(hospitalList.length == 0){
		console.log("if 내부 로그");
	console.log(hospitalList.length);
	$.ajax({
		type : "GET",
		url : "/pawmap/getHospitalByJson",
		dataType : "json",
		async : false,
		success : function(response){
			console.log(typeof(response));
			console.log(response);
			console.log(response.userList[2]);
			
		for(let i = 0; i <response.userList.length; i++){
			
			hospitalList.push(response.userList[i]);
		}	
			},
		error : function(e){
			alert(e);
		}
	});
	}
	console.log("로그찍을게");
	console.log(hospitalList.length);
	
	let searchList =[];
	for(var i=0; i<hospitalList.length; i++){
		if(hospitalList[i].userId.indexOf(searchValue)!= -1 ){
			searchList.push(hospitalList[i]);
		}
	}
	console.log(searchList);
	let str=`<tr>
		 <th class="admin-userseq">#</th>
		 <th class="admin-userid">아이디</th>
		 <th class="admin-useremail">이메일</th>
		 <th class="admin-username">이름/상호명</th>
		 <th class="admin-usertelnum">연락처</th>
		 <th class="admin-address">주소</th>
		 <th class="admin-usernickname">닉네임</th>
		 <th class="admin-role">회원타입</th>
		 <th class="admin-userregdate">등록일</th>
		 <th class="admin-useractionbutton"></th>
	   </tr>`;
 let pageNum =0;
		 if(myParam!=null){
		pageNum = (parseInt(myParam)-1)*11;
	 }	 
if(searchValue==""){
 let pagingList= hospitalList.slice(pageNum,pageNum+11);
	console.log(pagingList);
	for(var i=0; i<pagingList.length; i++){
	 str+=
	 `<tr>
		 <td class="admin-userseq">${pagingList[i].userSeq }</td>
		 <td class="admin-userid">${pagingList[i].userId }</td>
		 <td class="admin-useremail">${pagingList[i].userEmail }</td>
		 <td class="admin-username">${pagingList[i].userName }</td>
		 <td class="admin-usertelnum">${pagingList[i].userTelNum }</td>
		 <td class="admin-address">${pagingList[i].address }</td>
		 <td class="admin-usernickname">${pagingList[i].userNickname }</td>
		 <td class="admin-role">${pagingList[i].role }</td>
		 <td class="admin-userregdate"><fmt:formatDate value="${pagingList[i].userRegDate }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
		 <td class="admin-useractionbutton"><button class="adminpagebuttonformanage" type="button" onclick="location.href='/pawmap/getUser?userId=${pagingList[i].userId}'">수정</button></td>
	 </tr>`;
	console.log(pagingList[i].userSeq);
	};
} else{
	for(var i=0; i<searchList.length; i++){
		str+=
		`<tr>
		<td class="admin-userseq">${searchList[i].userSeq }</td>
		<td class="admin-userid">${searchList[i].userId }</td>
		<td class="admin-useremail">${searchList[i].userEmail }</td>
		<td class="admin-username">${searchList[i].userName }</td>
		<td class="admin-usertelnum">${searchList[i].userTelNum }</td>
		<td class="admin-address">${searchList[i].address }</td>
		<td class="admin-usernickname">${searchList[i].userNickname }</td>
		<td class="admin-role">${searchList[i].role }</td>
		<td class="admin-userregdate"><fmt:formatDate value="${searchList[i].userRegDate }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
		<td class="admin-useractionbutton"><button class="adminpagebuttonformanage" type="button" onclick="location.href='/pawmap/getUser?userId=${searchList[i].userId}'">수정</button></td>
	</tr>`;
	   console.log(searchList[i].userSeq);
	   };
}
$("#table_user_admin").html(str);
}

*/

	//전역 변수 선언하여 list 요청이 최초 1회만 되도록 설정  (재석이 것 백업했음...)
/*	let userList = [];
   	
   	function admin_user_search(){
		
		let urlParams = new URLSearchParams(window.location.search);
		let myParam = urlParams.get('pageNum');
		console.log(myParam);


   		let searchValue = $("#searchInput").val();
   		
   		if(userList.length == 0){
   			console.log("if 내부 로그");
   		console.log(userList.length);
   		$.ajax({
   			type : "GET",
   			url : "/pawmap/getUserByJson",
   			dataType : "json",
   			async : false,
   			success : function(response){
   				console.log(typeof(response));
   				console.log(response.userList[2]);
   				
   			for(let i = 0; i <response.userList.length; i++){
   				
   				userList.push(response.userList[i]);
   			}	
   				},
   			error : function(e){
   				alert(e);
   			}
   		});
   		}

		  
   		console.log("로그찍을게");
   		console.log(userList.length);
   		
   		let searchList =[];
   		for(var i=0; i<userList.length; i++){
   			if(userList[i].userId.indexOf(searchValue)!= -1 ){
   				searchList.push(userList[i]);
   			}
   		}
   		console.log(searchList);
       let str=`    <tr>
           <th>번째</th>
           <th>아이디</th>
           <th>이름</th>
           <th>닉네임</th>
           <th>이메일</th>
           <th>연락처</th>
           <th>관리</th>
       </tr>`;
	   		let pageNum =0;
	   		 if(myParam!=null){
	   		pageNum = (parseInt(myParam)-1)*11;
			}	   		 	
	   if(searchValue==""){
		let pagingList= userList.slice(pageNum,pageNum+11);
		console.log(pagingList);
		for(var i=0; i<pagingList.length; i++){
		 str+=
			 `<tr><td>${pagingList[i].userSeq}</td>
		  <td>${pagingList[i].userId}</td>
		  <td>${pagingList[i].userName }</td>
		  <td>${pagingList[i].userNickname }</td>
		  <td>${pagingList[i].userEmail }</td>
		  <td>${pagingList[i].userTelNum }</td>
		  <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${pagingList[i].userId}'">관리하기</button></td></tr>`;
		console.log(pagingList[i].userSeq);
		};
	} else{
		for(var i=0; i<searchList.length; i++){
			str+=
				`<tr><td>${searchList[i].userSeq}</td>
			 <td>${searchList[i].userId}</td>
			 <td>${searchList[i].userName }</td>
			 <td>${searchList[i].userNickname }</td>
			 <td>${searchList[i].userEmail }</td>
			 <td>${searchList[i].userTelNum }</td>
			 <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${searchList[i].userId}'">관리하기</button></td></tr>`;
		   console.log(searchList[i].userSeq);
		   };
	}
       $("#table_user_admin").html(str);
   	}
   	
	let hospitalList = [];
   	function admin_hospital_search(){
		let urlParams = new URLSearchParams(window.location.search);
		let myParam = urlParams.get('pageNum');
		console.log("병원함수 호출됐따");
   		let searchValue = $("#searchInput").val();
   		
   		if(hospitalList.length == 0){
   			console.log("if 내부 로그");
   		console.log(hospitalList.length);
   		$.ajax({
   			type : "GET",
   			url : "/pawmap/getHospitalByJson",
   			dataType : "json",
   			async : false,
   			success : function(response){
   				console.log(typeof(response));
   				console.log(response);
   				console.log(response.userList[2]);
   				
   			for(let i = 0; i <response.userList.length; i++){
   				
   				hospitalList.push(response.userList[i]);
   			}	
   				},
   			error : function(e){
   				alert(e);
   			}
   		});
   		}
   		console.log("로그찍을게");
   		console.log(hospitalList.length);
   		
   		let searchList =[];
   		for(var i=0; i<hospitalList.length; i++){
   			if(hospitalList[i].userId.indexOf(searchValue)!= -1 ){
   				searchList.push(hospitalList[i]);
   			}
   		}
   		console.log(searchList);
       let str=`    <tr>
           <th>번째</th>
           <th>아이디</th>
           <th>이름</th>
           <th>닉네임</th>
           <th>이메일</th>
           <th>연락처</th>
           <th>관리</th>
       </tr>`;
		let pageNum =0;
	   		 if(myParam!=null){
	   		pageNum = (parseInt(myParam)-1)*11;
			}	 
	   if(searchValue==""){
		let pagingList= hospitalList.slice(pageNum,pageNum+11);
		   console.log(pagingList);
		   for(var i=0; i<pagingList.length; i++){
			str+=
				`<tr><td>${pagingList[i].userSeq}</td>
			 <td>${pagingList[i].userId}</td>
			 <td>${pagingList[i].userName }</td>
			 <td>${pagingList[i].userNickname }</td>
			 <td>${pagingList[i].userEmail }</td>
			 <td>${pagingList[i].userTelNum }</td>
			 <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${pagingList[i].userId}'">관리하기</button></td></tr>`;
		   console.log(pagingList[i].userSeq);
		   };
	   } else{
   		for(var i=0; i<searchList.length; i++){
   			str+=
   				`<tr><td>${searchList[i].userSeq}</td>
                <td>${searchList[i].userId}</td>
                <td>${searchList[i].userName }</td>
                <td>${searchList[i].userNickname }</td>
                <td>${searchList[i].userEmail }</td>
                <td>${searchList[i].userTelNum }</td>
                <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${searchList[i].userId}'">관리하기</button></td></tr>`;
              console.log(searchList[i].userSeq);
              };
	   }
       $("#table_user_admin").html(str);
   	}
*/


/*
let userList = [];
   	
function admin_user_search(){
 
 let urlParams = new URLSearchParams(window.location.search);
 let myParam = urlParams.get('pageNum');
 console.log(myParam);


	let searchValue = $("#searchInput").val();
	
	if(userList.length == 0){
		console.log("if 내부 로그");
	console.log(userList.length);
	$.ajax({
		type : "GET",
		url : "/pawmap/getUserByJson",
		dataType : "json",
		async : false,
		success : function(response){
			console.log(typeof(response));
			console.log(response.userList[2]);
			
		for(let i = 0; i <response.userList.length; i++){
			
			userList.push(response.userList[i]);
		}	
			},
		error : function(e){
			alert(e);
		}
	});
	}

   
	console.log("로그찍을게");
	console.log(userList.length);
	
	let searchList =[];
	for(var i=0; i<userList.length; i++){
		if(userList[i].userId.indexOf(searchValue)!= -1 ){
			searchList.push(userList[i]);
		}
	}
	console.log(searchList);
let str=`    <tr>
	<th>번째</th>
	<th>아이디</th>
	<th>이름</th>
	<th>닉네임</th>
	<th>이메일</th>
	<th>연락처</th>
	<th>관리</th>
</tr>`;
		let pageNum =0;
		 if(myParam!=null){
		pageNum = (parseInt(myParam)-1)*11;
	 }	   		 	
if(searchValue==""){
 let pagingList= userList.slice(pageNum,pageNum+11);
 console.log(pagingList);
 for(var i=0; i<pagingList.length; i++){
  str+=
	  `<tr><td>${pagingList[i].userSeq}</td>
   <td>${pagingList[i].userId}</td>
   <td>${pagingList[i].userName }</td>
   <td>${pagingList[i].userNickname }</td>
   <td>${pagingList[i].userEmail }</td>
   <td>${pagingList[i].userTelNum }</td>
   <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${pagingList[i].userId}'">관리하기</button></td></tr>`;
 console.log(pagingList[i].userSeq);
 };
} else{
 for(var i=0; i<searchList.length; i++){
	 str+=
		 `<tr><td>${searchList[i].userSeq}</td>
	  <td>${searchList[i].userId}</td>
	  <td>${searchList[i].userName }</td>
	  <td>${searchList[i].userNickname }</td>
	  <td>${searchList[i].userEmail }</td>
	  <td>${searchList[i].userTelNum }</td>
	  <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${searchList[i].userId}'">관리하기</button></td></tr>`;
	console.log(searchList[i].userSeq);
	};
}
$("#table_user_admin").html(str);
}

let hospitalList = [];
function admin_hospital_search(){
 let urlParams = new URLSearchParams(window.location.search);
 let myParam = urlParams.get('pageNum');
 console.log("병원함수 호출됐따");
	let searchValue = $("#searchInput").val();
	
	if(hospitalList.length == 0){
		console.log("if 내부 로그");
	console.log(hospitalList.length);
	$.ajax({
		type : "GET",
		url : "/pawmap/getHospitalByJson",
		dataType : "json",
		async : false,
		success : function(response){
			console.log(typeof(response));
			console.log(response);
			console.log(response.userList[2]);
			
		for(let i = 0; i <response.userList.length; i++){
			
			hospitalList.push(response.userList[i]);
		}	
			},
		error : function(e){
			alert(e);
		}
	});
	}
	console.log("로그찍을게");
	console.log(hospitalList.length);
	
	let searchList =[];
	for(var i=0; i<hospitalList.length; i++){
		if(hospitalList[i].userId.indexOf(searchValue)!= -1 ){
			searchList.push(hospitalList[i]);
		}
	}
	console.log(searchList);
let str=`    <tr>
	<th>번째</th>
	<th>아이디</th>
	<th>이름</th>
	<th>닉네임</th>
	<th>이메일</th>
	<th>연락처</th>
	<th>관리</th>
</tr>`;
 let pageNum =0;
		 if(myParam!=null){
		pageNum = (parseInt(myParam)-1)*11;
	 }	 
if(searchValue==""){
 let pagingList= hospitalList.slice(pageNum,pageNum+11);
	console.log(pagingList);
	for(var i=0; i<pagingList.length; i++){
	 str+=
		 `<tr><td>${pagingList[i].userSeq}</td>
	  <td>${pagingList[i].userId}</td>
	  <td>${pagingList[i].userName }</td>
	  <td>${pagingList[i].userNickname }</td>
	  <td>${pagingList[i].userEmail }</td>
	  <td>${pagingList[i].userTelNum }</td>
	  <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${pagingList[i].userId}'">관리하기</button></td></tr>`;
	console.log(pagingList[i].userSeq);
	};
} else{
	for(var i=0; i<searchList.length; i++){
		str+=
			`<tr><td>${searchList[i].userSeq}</td>
		 <td>${searchList[i].userId}</td>
		 <td>${searchList[i].userName }</td>
		 <td>${searchList[i].userNickname }</td>
		 <td>${searchList[i].userEmail }</td>
		 <td>${searchList[i].userTelNum }</td>
		 <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${searchList[i].userId}'">관리하기</button></td></tr>`;
	   console.log(searchList[i].userSeq);
	   };
}
$("#table_user_admin").html(str);
}
*/