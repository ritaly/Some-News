angular.module('flapperNews')
 .factory ('posts', ['$http', function($http){
            var o = {
            posts: []
             };
    o.getAll = function() {
      return $http.get('/posts.json').then(function onSuccess(response) {
        angular.copy(response.data, o.posts);
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " +response.statusText);
      });
    };
    return o;
  }])