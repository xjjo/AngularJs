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
		<div ng-repeat="product in store.products | orderBy:'-price'"
			ng-hide="product.soldOut" class="product row">
			<h3>
				{{product.name}} <em class="pull-right">{{product.price |
					currency}}</em>
			</h3>
			<section ng-show="product.images.length"
				ng-controller="GalleryController as gallery">
			<div class="img-wrap">
				<img ng-src="{{product.images[gallery.current]}}" />
			</div>
			<ul class="img-thumbnails clearfix">
				<li class="small-image pull-left thumbnail"
					ng-repeat="image in product.images"><img ng-src="{{image}}" />
				</li>
			</ul>
			</section>
			<section class="tab" ng-controller="TabController as tab">
			<ul class="nav nav-pills">
				<li ng-class="{active: tab.isSet(1)}"><a href
					ng-click="tab.setTab(1)">Description</a></li>
				<li ng-class="{active: tab.isSet(2)}"><a href
					ng-click="tab.setTab(2)">Specs</a></li>
				<li ng-class="{active: tab.isSet(3)}"><a href
					ng-click="tab.setTab(3)">Reviews</a></li>
			</ul>
			<div ng-show="tab.isSet(1)">
				<h4>Description</h4>
				<blockquote>{{product.description}}</blockquote>
			</div>
			<div ng-show="tab.isSet(2)">
				<h4>Specs</h4>
				<blockquote>Shine: {{product.shine}}</blockquote>
			</div>
			<!--  Review Tab's Content  -->
			<div ng-show="tab.isSet(3)">
				<!--  Product Reviews List -->
				<ul>
					<h4>Reviews</h4>
					<li ng-repeat="review in product.reviews">
						<blockquote>
							<strong>{{review.stars}} Stars</strong> {{review.body}} <cite
								class="clearfix">— {{review.author}}</cite>
						</blockquote>
					</li>
				</ul>
				<!--  Review Form -->
				<form name="reviewForm">
					<!--  Live Preview -->
					<blockquote>
						<strong> Stars</strong> <cite class="clearfix">—</cite>
					</blockquote>

					<!--  Review Form -->
					<h4>Submit a Review</h4>
					<fieldset class="form-group">
						<select class="form-control"
							ng-options="stars for stars in [5,4,3,2,1]" title="Stars">
							<option value="">Rate the Product</option>
						</select>
					</fieldset>
					<fieldset class="form-group">
						<textarea class="form-control"
							placeholder="Write a short review of the product..."
							title="Review"></textarea>
					</fieldset>
					<fieldset class="form-group">
						<input type="email" class="form-control"
							placeholder="jimmyDean@example.org" title="Email" />
					</fieldset>
					<fieldset class="form-group">
						<input type="submit" class="btn btn-primary pull-right"
							value="Submit Review" />
					</fieldset>
				</form>
			</div>
			</section>
			<button ng-show="product.canPurchase">Add to Cart</button>
		</div>
	</div>
</body>
</html>