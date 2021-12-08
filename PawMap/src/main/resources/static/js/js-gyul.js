let index = {
	
	init:function(){
		$("#delete-free-board").on("click",()=>{
			this.deleteFreeBoardBySeq();
		});

		$("#delete-nanum-board").on("click",()=>{
			this.deleteNanumBoardBySeq();
		});

		//$("#searchBtn").on("click",()=>{
		//	this.getSearchFreeBoardList();	
		//});

	// // ■ shelter form 수정 추가
	// 	$("#update-shelter-form").on("click",()=>{
	// 		this.updateShelterForm();
	// 	});

		$("#update-free-board").on("click",()=>{
			this.updateFreeBoard();
		});

		$("#update-nanum-board").on("click",()=>{
			this.updateNanumBoard();
		});

		$("#btn-reply-save").on("click",()=>{
			this.replySaveFreeBoard();
		});
		
		$("#btn-reply-save-nanum").on("click",()=>{
			this.replySaveNanumBoard();
		});
		
		
		//$("#updateCommentOnFreeBoard").on("click",()=>{
		//	this.updateCommentOnFreeBoard();
		//});

		
	},
	
	deleteFreeBoardBySeq:function(){
		
		let freeBoardSeq = $("#freeBoardSeq").text().substring(9);
		console.log(freeBoardSeq);
		
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type : "POST",
				url: "deleteFreeBoard/api/"+freeBoardSeq,
				contentType : "application/json; charset=utf-8",
			}).done(function(resp){
				alert("자유게시판 게시글 삭제 성공");
				location.href = "getFreeBoardList"
			}).fail(function(error){
				alert(error);
				console.log(error);
			});
			
		}else{
			
		}
	},

	// 나눔게시판 글 삭제 메소드
		deleteNanumBoardBySeq:function(){
		
			let nanumBoardSeq = $("#nanumBoardSeq").val();
			console.log(nanumBoardSeq);
			
			if(confirm("정말 삭제하시겠습니까?")){
				$.ajax({
					type : "POST",
					url: "deleteNanumBoard/api/"+nanumBoardSeq,
					contentType : "application/json; charset=utf-8",
				}).done(function(resp){
					alert("나눔게시판 게시글 삭제 성공");
					location.href = "getNanumBoardList"
				}).fail(function(error){
					alert(error);
					console.log(error);
				});
				
			}else{
				
			}
	},
	
	getSearchFreeBoardList:function(){
		console.log("탐");
		alert("검색");
		
		$.ajax({
			type: 'GET',
			url: "getFreeBoardList",
			data : $("form[name=search-form]").serialize()
			
		}).done(function(result){
			alert("검색성공");
			location.href = "getFreeBoard"
			
		}).fail(function(error){
			alert(error);
			console.log(error);
		});
	},
	
	updateFreeBoard:function(){
		let freeBoardSeq = $("#boardSeq").val();
		
		let data = {
			title: $("#title").val(),
			content: $("#content").val(),
			boardSeq : freeBoardSeq,
			userId : $("#user_id").val(),
			boardType : $("#boardType").val() 
		};
		alert("글 수정하기");
		console.log("updateFreeBoard:function 탐, freeBoardSeq ==="+freeBoardSeq+"data =======: "+ data);
		$.ajax({
			type: 'POST',
			url: "updateFreeAndNanumBoardForm/api/"+freeBoardSeq,
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			success : function() {
				alert("자유게시판 글수정 성공");
				location.href ="getFreeBoard?boardSeq="+freeBoardSeq
			},
			error : function(e) {
				console.log(e);
			}
		});
	},

	updateNanumBoard:function(){
		let nanumBoardSeq = $("#boardSeq").val();
		
		let data = {
			title: $("#title").val(),
			content: $("#content").val(),
			boardSeq : nanumBoardSeq,
			userId : $("#user_id").val(),
			boardType : $("#boardType").val() 
		};
		alert("글 수정하기");
		console.log("updateNanumBoard:function 탐, nanumBoardSeq ==="+nanumBoardSeq+"data =======: "+ data);
		$.ajax({
			type: 'POST',
			url: "updateNanumBoardForm/api/"+nanumBoardSeq,
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			success : function() {
				alert("나눔게시판 글수정 성공");
				location.href ="getNanumBoard?boardSeq="+nanumBoardSeq
			},
			error : function(e) {
				console.log(e);
			}
		});
	},
	
	replySaveFreeBoard:function(){
		
		let seq = $("#freeBoardSeqHidden").val();
		
		let data={
			boardSeq: $("#freeBoardSeqHidden").val(),	
			boardType: $("#boardTypeForReply").val(),
			userId: $("#userId").val(),
			commentContent: $("#reply-content").val(),
			hospitalSeq : $("#hospitalSeqForReply").val()
		};
		
		console.log(data);
		

		if(data.commentContent == ""){
			alert("내용을 입력해주세요");
			
		}else{
			$.ajax({
				type : "POST",
				url: `insertReplyFreeBoard/api/${data.boardSeq}`,
				data: JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',

				dataType : "text",
				success : function(e){
					location.href ="getFreeBoard?boardSeq="+seq
				},
				error : function(e){
					alert("에러");
					console.log(e);
				}
			});
		}
	},
	
	// 나눔게시판 
		replySaveNanumBoard:function(){
		
		let seq = $("#nanumBoardSeqHidden").val();
		
		let data={
			boardSeq: $("#nanumBoardSeqHidden").val(),	
			boardType: $("#boardTypeForReply").val(),
			userId: $("#userId").val(),
			commentContent: $("#reply-content").val(),
			hospitalSeq : $("#hospitalSeqForReply").val()
		};
		
		console.log(data);
		

		if(data.commentContent == ""){
			alert("내용을 입력해주세요");
			
		}else{
			$.ajax({
				type : "POST",
				url: `insertReplyNanumBoard/api/${data.boardSeq}`,
				data: JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',

				dataType : "text",
				success : function(e){
					location.href ="getNanumBoard?boardSeq="+seq
				},
				error : function(e){
					alert("에러");
					console.log(e);
				}
			});
		}
	},


	
		//   // ■ shelter form 의 function
		// updateShelterForm:function(){
		// 	let shelterSeq = $("#shelterSeq").val();
			
		// 	let data = {
		// 		comNum: $("#comNum").val(),
		//   shelterName: $("#shelterName").val(),
		//   shelterAddress: $("#shelterAddress").val(),
		//   shelterTel: $("#shelterTel").val(),
		// 		content: $("#content").val(),
		// 		shelterSeq : shelterSeq,
		// 		boardType : $("#boardType").val() 
		// 	};
		// 	alert("글 수정하기");
		// 	console.log("updateShelterForm:function 탐, shelterSeq ==="+shelterSeq+"data =======: "+ data);
		// 	$.ajax({
		// 		type: 'POST',
		// 		url: "updateShelterForm/api/"+freeBoardSeq, // 안될시 api 지워보기
		// 		data : JSON.stringify(data),
		// 		contentType : 'application/json; charset=utf-8',
		// 		success : function() {
		// 			alert("1111");
		// 			location.href ="updateShelterForm?shelterSeq="+shelterSeq
		// 		},
		// 		error : function(e) {
		// 			console.log(e);
		// 		}
		// 	});
		// }
	
	/*
		updateCommentOnFreeBoard:function(){
			let data = {
				commentContent: $("#commentContent").val(),
				userId: $("#hiddenCommentUserId").val(),
				commentSeq: $("#hiddenCommentSeq").val(),
				boardSeq: $("#hiddenFreeBoardSeq").val()
				
			};
			console.log(data);
			alert("�깘");
			
			$.ajax({
				type : "POST",
				url: "updateCommentOnFreeBoard",
				data: JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : "text"
			}).done(function(result){
				alert("�닔�젙�꽦怨�");
			}).fail(function(){
				alert("�떎�뙣");
			});
		},
	 */

		
}


index.init();