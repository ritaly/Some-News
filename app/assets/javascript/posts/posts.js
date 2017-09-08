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
          /*
          for (i = 0; i < o.posts.length; i++) {
              if (o.posts[i].id === response.data.id) {
                o.posts[i].upvotes+=1;
            }
          }*/
           i = o.posts.findIndex(i => i.id === response.data.id); //ES2015  
            o.posts[i].upvotes +=1;
      
          angular.copy(response.data, o.posts.filter(x => x.id === response.data.id))
        }, function onError(response) {
        window.alert('Error: ' + response.status + " - " +response.statusText);
      });
    };
    o.get = function(id) {
      return $http.get('/posts/' + id ).then(function onSuccess(response){
        return response.data;
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " + response.statusText);
      });
    };
    o.addComment = function(id, comment) {
     
      return $http.post('/posts/' + id + '/comments', comment).then(function onSuccess(response){
        return response.data;
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " + response.statusText);
      });
    };
    return o;
  }])