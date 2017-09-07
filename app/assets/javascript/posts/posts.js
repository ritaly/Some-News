angular.module('flapperNews')
 .factory ('posts', ['$http', function($http){
            var o = {
            posts: []
             };
    o.getAll = function() {
      return $http.get('/posts').then(function onSuccess(response) {
        angular.copy(response.data, o.posts);
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " +response.statusText);
      });
    };
    o.create = function(post) {
      return $http.post('/posts', post).then(function onSuccess(response) {
        o.posts.push(response.data);
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " +response.statusText);
      });
    };
    o.upvote = function(post) {
      return $http.put('/posts/' + post.id + '/upvote')
        .then(function onSuccess(response){
          console.log(o);
          for (i = 0; i < o.posts.length; i++) {
              if (o.posts[i].id == response.data.id) {
                o.posts[i].upvotes+=1;
            }
          }
          //underscore
          angular.copy(response.data, o.posts.filter(x => x.id === response.data.id))
        }, function onError(response) {
        window.alert('Error: ' + response.status + " - " +response.statusText);
      });
    };
    return o;
  }])