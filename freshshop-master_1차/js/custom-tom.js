(function($) {
	<!-- jquery의 timeago 플러그인 사용 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="./js/jquery.timeago.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			// timeago 플러그인을 미래 시각으로 동작할 수 있게 설정
			jQuery.timeago.settings.allowFuture = true;
			
			var now = new Date();
			
			$(".timeago").timeago();
			$(".page-opened").text($.timeago(now));
			$("time").timeago();
		});
	</script>

	<!-- abbr 엘리먼트는 time과 동일하지만 오래된 브라우저를 지원하기 위해서 사용한다.-->
	<p> abbr태그 이용 :  <abbr class="timeago" title="1993-08-16"></abbr> </p>
	<p> 페이지 오픈한지 : <span class="page-opened"> </p>
	<!-- 브라우저에서 time 엘리먼트 서식을 기계가 읽듯이 읽어 캘린더에 추가하는 기능을 구현할 때 사용한다. -->
	<p> time태그 이용 : <time datetime="2015-01-03 20:09-0700"></time> </p>
	


}(jQuery));


시간 표시 백업본...