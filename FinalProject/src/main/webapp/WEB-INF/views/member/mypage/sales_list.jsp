<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr />
<h3 class="text-info my-4 text-center">판매 중인 차량</h3>
<hr />
<div class="row my-4">
		<div class="w-100" style="height:auto;">
			<ul >
				<a style="text-decoration: none;" href="/mycar/car/detail.do?num={{tmp.car_num}}" data-ng-repeat="tmp in listS">
					<li class="row  my-3 border" style="margin-top:15px;" >
						<img src="/mycar/upload/{{tmp.image}}" class="col-md-2  " width="180" height="180" />
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
							<h2 class="text-danger mt-5">{{tmp.s_price}}원 </h2>
						</span>
					</li>
				</a>
			</ul>
			<!-- 페이징처리 -->
			<div class="page-display d-flex justify-content-center mt-5">
				<ul class="pagination pagination-sm">
					<li data-ng-if="pagingS.startPageNum != 1" 
						class="page-item">
						<a data-ng-click="getPageS(pagingS.startPageNum-1)" 
							class="page-link" href="#/sales_list">Prev</a>
					</li>
					<li data-ng-repeat="tmp in pageNumsS" 
							class="page-item"
							data-ng-class="{active: pagingS.pageNum == tmp }">
						<a data-ng-click="getPageS(tmp)"
							class="page-link" href="#/sales_list">{{tmp}}</a>
					</li>
					<li data-ng-if="pagingS.endPageNum < pagingS.totalPageCount"
						class="page-item">
						<a data-ng-click="getPageS(pagingS.endPageNum+1)" 
							class="page-link" href="#/sales_list">Next</a>
					</li>
				</ul>
			</div>
		</div>
		<hr class="my-2"/>
	</div>