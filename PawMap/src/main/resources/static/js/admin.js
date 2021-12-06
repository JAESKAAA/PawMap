/*
 * 
 * @author  재석
 *  admin 페이지내 회원/제휴병원 관리할때 검색하는 함수 정의함
 */
 
	//전역 변수 선언하여 list 요청이 최초 1회만 되도록 설정 
	let userList = [];
   	
   	function admin_user_search(){
		
		let urlParams = new URLSearchParams(window.location.search);
		let myParam = urlParams.get('pageNum');
		


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
   	