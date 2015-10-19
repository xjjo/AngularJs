<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="gemStore">
  <head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script type="text/javascript" src="javascript/lib/angular.min.js"></script>
    <script type="text/javascript" src="javascript/lib/app.js"></script>
  </head>
  <body ng-controller="StoreController as store">
    <div style="margin: 0 auto; width: 75%;">
	    <div class="product row">
	      <h3>
	        {{store.product.name}}
	        <em class="pull-right">{{store.product.price}}</em>
	      </h3>
	    </div>
    </div>
  </body>
</html>