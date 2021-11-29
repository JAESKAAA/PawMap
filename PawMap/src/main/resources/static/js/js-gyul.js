let index = {
	
	init:function(){
		$("#delete-free-board").on("click",()=>{
			this.deleteFreeBoardBySeq();
		});
		//$("#searchBtn").on("click",()=>{
		//	this.getSearchFreeBoardList();	
		//});
		$("#update-free-board").on("click",()=>{
			this.updateFreeBoard();
		});
		$("#btn-reply-save").on("click",()=>{
			this.replySaveFreeBoard();
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
				alert("삭제 성공");
				location.href = "getFreeBoardList"
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
				alert("1111");
				location.href ="getFreeBoard?boardSeq="+freeBoardSeq
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
	
	/*
		updateCommentOnFreeBoard:function(){
			let data = {
				commentContent: $("#commentContent").val(),
				userId: $("#hiddenCommentUserId").val(),
				commentSeq: $("#hiddenCommentSeq").val(),
				boardSeq: $("#hiddenFreeBoardSeq").val()
				
			};
			console.log(data);
			alert("탐");
			
			$.ajax({
				type : "POST",
				url: "updateCommentOnFreeBoard",
				data: JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : "text"
			}).done(function(result){
				alert("수정성공");
			}).fail(function(){
				alert("실패");
			});
		},
	 */

		
}


index.init();