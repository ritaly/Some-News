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
           i = o.posts.findIndex(i => i.id === response.data.id); //ES2015  
            o.posts[i].upvotes +=1;
      
          angular.copy(response.data, o.posts.filter(x => x.id === response.data.id))
        }, function onError(response) {
        window.alert('Error: ' + response.status + " - " +response.statusText);
      });
    };
    o.downvote = function(post) {
      return $http.put('/posts/' + post.id + '/downvote')
        .then(function onSuccess(response){
           i = o.posts.findIndex(i => i.id === response.data.id); //ES2015  
            o.posts[i].upvotes -=1;
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
    o.upvoteComment = function(post, comment) {
      //debuger
      return $http.put('/posts/' + post.id + '/comments/'+ comment.id + '/upvote')
      .then(function onSuccess(response){
          comment.upvotes += 1;
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " + response.statusText);
      });
    };
    o.downvoteComment = function(post, comment) {
      //debuger
      return $http.put('/posts/' + post.id + '/comments/'+ comment.id + '/downvote')
      .then(function onSuccess(response){
          comment.upvotes -= 1;
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " + response.statusText);
      });
    };
    o.deleteComment = function(post, comment) {
     // debugger
      return $http.delete('/posts/' + post.id + '/comments/'+ comment.id)
      .then(function onSuccess(response){
          comment.destroy;
      }, function onError(response) {
        window.alert('Error: ' + response.status + " - " + response.statusText);
      });
    };
    return o;
  }])