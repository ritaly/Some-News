angular.module('flapperNews')
	.controller('NavCtrl', [
	'$scope',
	'Auth',
	function($scope, Auth){
		//debugger
		console.log($scope.user)

	  if (Auth.isAuthenticated()) {
	  	debugger
	  	Auth.currentUser().then(function (user){
	  		debugger
	    	$scope.user = user;	   
	  	}, function(error) {
			console.log('ugabufa');
	    })
	  } else {
	  	//debugger
	  }

	   $scope.$on('devise:new-registration', function (e, user){
	   	debugger
	    $scope.user = user;
	    debugger
	  });

	  $scope.$on('devise:login', function (e, user){
	  	debugger
	    $scope.user = user;
	  });

	  $scope.$on('devise:logout', function (e, user){
	  	debugger
	    $scope.user = {};

	  });
	  $scope.logout = function() {
	 		debugger
	 		Auth.logout().then(function(oldUser) {
            alert(oldUser.name + "you're signed out now.");
         })
	 	};
}]);