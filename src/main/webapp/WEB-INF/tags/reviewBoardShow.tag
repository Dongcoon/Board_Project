<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="rnum" %>
<%@ attribute name="mid" %>
<%@ attribute name="rfile" %>
<%@ attribute name="rdate" %>
<%@ attribute name="rthumbsup" %>


<div class="col-4" style="justify-content:center;">
	
	<table>
		<tr style="background: transparent; border: none;">
			<td style="width:10%;">
				<div id="review_mphoto" style=" display:inline-block; border-radius: 70%; width:30px; height:30px; overflow: hidden; margin-bottom: -10px;">
					<a href="myReviewBoard.do?a=${mid}"><img alt="이미지" src="" style="width:100%; height:100%; object-fit:cover;"></a>
				</div>
			</td>
			<td style=" width:75%; text-align: left">
				<div id="review_mname" style="display:inline-block;">
					<a href="myReviewBoard.do?a=${rnum}" style="font-size: 15px;">${mid}</a>
				</div>
			</td>
			<td style=" width:15%; text-align: right"><a href="#" class="icon">•••</a></td>																									
		</tr>
		
		<tr style="background: transparent; border: none;">
			<td colspan="3">
				<span class="image fit">
					<a href="review.do?rnum=${rnum}"><img alt="리뷰이미지" src="${rfile}" style="border: 2px solid gray"> </a>
				</span>
			</td>
		</tr>
		
		<tr style="background: transparent; border: none;">
			<td>
				${rdate}
			</td>
			
			<td style="text-align: right">													
				
				<a href="review.do?rnum=${rnum}" class="icon">★<span>${rthumbsup}</span></a>
																	
				
			</td>	
			<td style="text-align: right">										
				
				<a href="review.do?rnum=${rnum}" class="icon">💬<span></span></a>													
				
			</td>									
		</tr>
	</table>										
</div>