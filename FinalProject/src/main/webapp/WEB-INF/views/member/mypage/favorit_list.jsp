<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr />
<h3 class="text-info my-4 text-center">관심차량</h3>
<hr />
<div class="row my-4">
		<div class="w-100" >
			<!-- 슬라이드 -->
			<ul >
				<li data-ng-repeat="tmp in list" class="row  my-3 border" style="margin-top:15px;" >
					<img src="/mycar/upload/{{tmp.image}}" class="col-md-2 " />
					<span class="col-7  mt-3">
						<span class="badge badge-secondary">{{tmp.automotive_fuel}}</span>   
						<span class="badge badge-secondary">{{company_list[tmp.company]}}</span>
						<span class="badge badge-secondary">{{tmp.car_option}}</span>
						<span class="badge badge-secondary">{{c_sort_list[tmp.c_sort]}} </span>
						<h2  class="my-4">{{tmp.title}}</h2>
						<span>
							차량번호:{{tmp.car_num}} |
							주행거리:{{tmp.vehical_mile}}Km |
							색상:{{color_list[tmp.color]}} |
							연식:{{tmp.car_year}} |
							모델명:{{tmp.m_name}}
						</span>
					</span>
					<span class="col-3">
						<h3 class="text-danger mt-5">{{tmp.s_price}}원 </h3>
					</span>
				</li>
			</ul>
			<!-- 페이징처리 -->
			<div class="page-display d-flex justify-content-center mt-5">
				<ul class="pagination pagination-sm">
					<li data-ng-if="paging.startPageNum != 1" 
						class="page-item">
						<a data-ng-click="getPageF(paging.startPageNum-1)" 
							class="page-link" href="#/favorit_list">Prev</a>
					</li>
					<li data-ng-repeat="tmp in pageNums" 
							class="page-item"
							data-ng-class="{active: paging.pageNum == tmp }">
						<a data-ng-click="getPageF(tmp)"
							class="page-link" href="#/favorit_list">{{tmp}}</a>
					</li>
					<li data-ng-if="paging.endPageNum < paging.totalPageCount"
						class="page-item">
						<a data-ng-click="getPageF(paging.endPageNum+1)" 
							class="page-link" href="#/favorit_list">Next</a>
					</li>
				</ul>
			</div>
		</div>	
	</div>