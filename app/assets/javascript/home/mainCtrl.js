 angular.module('flapperNews')
    .controller('MainCtrl', [
    '$scope','posts',
    function($scope, posts){
        $scope.posts = posts.posts;
        $scope.addPost = function(){
          
            posts.create({
              id: $scope.posts.length,
              title: $scope.title,
              link: $scope.link,
              upvotes: 0,
              comments: []
            });
            
        };
        $scope.incrementUpvotes = function(post) {
          post.upvotes += 1;
        };
    }]);