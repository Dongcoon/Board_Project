<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${member.mid==rvo.mid}">
	<div class="row gtr-uniform">
	<!-- c태그로 div생성 및 내용물 넣기 -->
		
												
		<div class="col-8 off-2"  style="justify-content:center;">
			
			<table>
				<div id="reviewWrite" style="text-align: right" >
					<a class="button primary" href="reviewWrite.do?mid=${member.mid}">수정</a>
				
				</div>
				<tr style="background: transparent; border: none;">
					<td style="width:5%;">
						<div id="review_mphoto" style=" display:inline-block; border-radius: 70%; width:40px; height:40px; overflow: hidden; margin-bottom: -10px;">
							<a href="myReviewBoard.do?mid=${rvo.mid}"><img alt="이미지" src="${rvo.mphoto}" style="width:100%; height:100%; object-fit:cover;"></a>
						</div>
					</td>
					<td style=" width:65%; text-align: left">
						<div id="review_mname" style="display:inline-block;">
							<a href="myReviewBoard.do?mid=${rvo.mid}" style="font-size:30px;">${rvo.mid}</a>
						</div>
						
					</td>
					<td style=" width:10%; text-align: left">
						
						<a href="#" class="icon" style="font-size: 30px;">★<span>${rvo.rthumbsup}</span></a>
					</td>
					<td style=" width:15%; text-align: left">
						
						<span>${rvo.rdate}</span>
					</td>																								
				</tr>
				
				<tr style="background: transparent; border: none;">
					<td colspan="5">														 
						<span style="width:100%; height:100%; overflow: hidden" class="image fit">
							<!-- Swiper -->
					    	<div class="swiper mySwiper">
						    	<div class="swiper-wrapper">
							        <div class="swiper-slide"><img alt="리뷰이미지" src='${rvo.rfile}'></div>
							        <div class="swiper-slide">
							        	<div id="map" style="width:100%;height:350px;"></div>
	
											<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	9f89e51ba866b9d4758288c99261e895&libraries=services"></script>
											<script>
											var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
											    mapOption = {
											        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											        level: 3 // 지도의 확대 레벨
											    };  
											
											// 지도를 생성합니다    
											var map = new kakao.maps.Map(mapContainer, mapOption); 
											
											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new kakao.maps.services.Geocoder();
											
											// 주소로 좌표를 검색합니다   << '제주특별자치도 ... 여기에다가 값 넣기!'
											geocoder.addressSearch('${param.addr}', function(result, status) {
											
											    // 정상적으로 검색이 완료됐으면 
											     if (status === kakao.maps.services.Status.OK) {
											
											        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
											
											        // 결과값으로 받은 위치를 마커로 표시합니다
											        var marker = new kakao.maps.Marker({
											            map: map,
											            position: coords
											        });
											
											        // 인포윈도우로 장소에 대한 설명을 표시합니다
											        var infowindow = new kakao.maps.InfoWindow({
											            content: '<div style="width:150px;text-align:center;padding:6px 0;">Here!</div>'
											        });
											        infowindow.open(map, marker);
											
											        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											        map.setCenter(coords);
											    } 
											});    
											</script>
										</div>													        															        
						      	</div>
						      <div class="swiper-button-next"></div>
						      <div class="swiper-button-prev"></div>
						      <div class="swiper-pagination"></div>
					   		 </div>
							
						</span>
					</td>
				</tr>
				
				<tr style="border-top: none;">
					<td colspan="5"><textarea style="background: transparent;">${rvo.rcontent}</textarea></td>
				</tr>
				
				
			</table>
				
				
			<form method="post" action="review.do?rnum=${rvo.rnum}">
				<div class="row gtr-uniform">
					<!-- Break -->
					<div class="col-6 col-12-xsmall">
						<input type="text" placeholder="댓글을 입력해보세요" class="fit" style="height:24px; "/>
					</div>
					
					<!-- Break -->
					<div class="col-3">			    
						<div id="star" ></div>
	
	
						    <script type="text/javascript">
						        $(function() {
						            $('div#star').raty({
						            	
						                score: 3
						                ,path : "./images"
						                ,width : 200
						                ,click: function(score, evt) {
						                    $("#starRating").val(score);
						                    $("#displayStarRating").html(score);
						                },half:     true,
						                starHalf: 'star-half.png'
						            });
						        });
						    </script>	       										    
					</div>		
					
					<!-- Break -->
					<div class="col-2">
						<input type="submit" value="등록" class="primary" name="searchSubject" />												
					</div>
				</div>
			</form>
				
			<table>	
				<tr>
					<td style="width:10%;">작성자</td>
					<td style=" width:75%; text-align: left">내용</td>
					<td>별점</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>${cvo.mid}</td>
					<td>${cvo.ccontent}</td>
					<td>★${cvo.cthumbsup}</td>
					<td>${cvo.cdate}</td>
				</tr>
				
			</table>							
		</div>												
	</div>
</c:if>

<c:if test="${member.mid!=rvo.mid}">
			<div class="row gtr-uniform">
<!-- c태그로 div생성 및 내용물 넣기 -->
	
											
	<div class="col-8 off-2"  style="justify-content:center;">
		
		<table>
			
			<tr style="background: transparent; border: none;">
				<td style="width:5%;">
					<div id="review_mphoto" style=" display:inline-block; border-radius: 70%; width:40px; height:40px; overflow: hidden; margin-bottom: -10px;">
						<a href="myReviewBoard.do?mid=${rvo.mid}"><img alt="이미지" src="${rvo.mphoto}" style="width:100%; height:100%; object-fit:cover;"></a>
					</div>
				</td>
				<td style=" width:65%; text-align: left">
					<div id="review_mname" style="display:inline-block;">
						<a href="myReviewBoard.do?mid=${rvo.mid}" style="font-size:30px;">${rvo.mid}</a>
					</div>
					
				</td>
				<td style=" width:10%; text-align: left">
					
					<a href="#" class="icon" style="font-size: 30px;">★<span>${rvo.rthumbsup}</span></a>
				</td>
				<td style=" width:15%; text-align: left">
					
					<span>${rvo.rdate}</span>
				</td>																								
			</tr>
			
			<tr style="background: transparent; border: none;">
				<td colspan="5">														 
					<span style="width:100%; height:100%; overflow: hidden" class="image fit">
						<!-- Swiper -->
				    	<div class="swiper mySwiper">
					    	<div class="swiper-wrapper">
						        <div class="swiper-slide"><img alt="리뷰이미지" src='${rvo.rfile}'></div>
						        <div class="swiper-slide">
						        	<div id="map" style="width:100%;height:350px;"></div>

										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	9f89e51ba866b9d4758288c99261e895&libraries=services"></script>
										<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();
										
										// 주소로 좌표를 검색합니다   << '제주특별자치도 ... 여기에다가 값 넣기!'
										geocoder.addressSearch('${param.addr}', function(result, status) {
										
										    // 정상적으로 검색이 완료됐으면 
										     if (status === kakao.maps.services.Status.OK) {
										
										        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										
										        // 결과값으로 받은 위치를 마커로 표시합니다
										        var marker = new kakao.maps.Marker({
										            map: map,
										            position: coords
										        });
										
										        // 인포윈도우로 장소에 대한 설명을 표시합니다
										        var infowindow = new kakao.maps.InfoWindow({
										            content: '<div style="width:150px;text-align:center;padding:6px 0;">Here!</div>'
										        });
										        infowindow.open(map, marker);
										
										        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										        map.setCenter(coords);
										    } 
										});    
										</script>
									</div>													        															        
					      	</div>
					      <div class="swiper-button-next"></div>
					      <div class="swiper-button-prev"></div>
					      <div class="swiper-pagination"></div>
				   		 </div>
						
					</span>
				</td>
			</tr>
			
			<tr style="border-top: none;">
				<td colspan="5"><textarea readonly="readonly" style="background: transparent;">${rvo.rcontent}</textarea></td>
			</tr>
			
			
		</table>
			
			
		<form method="post" action="review.do?rnum=${rvo.rnum}">
			<div class="row gtr-uniform">
				<!-- Break -->
				<div class="col-6 col-12-xsmall">
					<input type="text" placeholder="댓글을 입력해보세요" class="fit" style="height:24px; "/>
				</div>
				
				<!-- Break -->
				<div class="col-3">			    
					<div id="star" ></div>


					    <script type="text/javascript">
					        $(function() {
					            $('div#star').raty({
					            	
					                score: 3
					                ,path : "./images"
					                ,width : 200
					                ,click: function(score, evt) {
					                    $("#starRating").val(score);
					                    $("#displayStarRating").html(score);
					                },half:     true,
					                starHalf: 'star-half.png'
					            });
					        });
					    </script>	       										    
				</div>		
				
				<!-- Break -->
				<div class="col-2">
					<input type="submit" value="등록" class="primary" name="searchSubject" />												
				</div>
			</div>
		</form>
			
		<table>	
			<tr>
				<td style="width:10%;">작성자</td>
				<td style=" width:75%; text-align: left">내용</td>
				<td>별점</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>${cvo.mid}</td>
				<td>${cvo.ccontent}</td>
				<td>★${cvo.cthumbsup}</td>
				<td>${cvo.cdate}</td>
			</tr>
			
		</table>							
	</div>												
</div>
</c:if>