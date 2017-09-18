angular.module('flapperNews')
	.controller('AuthCtrl', [
	'$scope',
	'$state',
	'Auth',
	function($scope, $state, Auth){
		
		$scope.login = function() {
				
		    Auth.login($scope.user).then(function(user){
		      //console.log(user)
		      $scope.user = user;
		      $state.go('home');
		    });
		  };


	 	$scope.register = function() {
	    	Auth.register($scope.user).then(function(){
	      	$state.go('home');
	    	});
	  	};
	}
]);