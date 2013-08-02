function ListingsCtrl($scope, $http) {
  $http.get('/listings.json').success(function(data) {
  	$scope.listings = data;
  });

  $scope.country = '';
}

ListingsCtrl.$inject = ['$scope', '$http'];
