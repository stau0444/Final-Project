<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row my-4">
		<h3 class="text-info">판매 중인 차량</h3>
		<div class="w-100" style="height:auto;">
			<ul >
				<li data-ng-repeat="tmp in salesList" class="row  my-3 border" style="margin-top:15px;" >
					<img src="/mycar/upload/{{tmp.image}}" class="col-2 " width="180" height="180" />
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
			</ul>
		</div>
		<hr class="my-2"/>
	</div>