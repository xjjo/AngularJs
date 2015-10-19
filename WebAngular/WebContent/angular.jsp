<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="gemStore">
  <head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="javascript/lib/angular.min.js"></script>
    <script type="text/javascript" src="javascript/lib/app.js"></script>
  </head>
  <body ng-controller="StoreController as store">
    <div style="margin: 0 auto; width: 75%;">
	    <div ng-repeat="product in store.products | orderBy:'-price'" ng-hide="product.soldOut" class="product row">
	      <h3>
	        {{product.name}}
	        <em class="pull-right">{{product.price |currency}}</em>
	      </h3>
	      <div class="gallery" ng-show="{{product.images.length}}">
				<div class="img-wrap">
					<img ng-src="{{product.images[0]}}" />
				</div>
				<ul class="img-thumbnails clearfix">
					<li class="small-image pull-left thumbnail"
						ng-repeat="image in product.images"><img ng-src="{{image}}" />
					</li>
				</ul>

			</div>
	      
	      <button ng-show="product.canPurchase">Add to Cart</button>
	    </div>
    </div>
  </body>
</html>