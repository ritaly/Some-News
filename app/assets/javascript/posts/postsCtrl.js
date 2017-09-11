 angular.module('flapperNews')
 .controller('PostsCtrl', [
        '$scope',
        'posts',
        'post',
        function($scope, posts, post){
            $scope.post = post;

            $scope.addComment = function(){
            if($scope.body === '' || $scope.body == null) { return; }
            posts.addComment(post.id, {
              body: $scope.body,
              upvotes: 0,
              username: 'user'
            }).then(function onSuccess(comment){
              //$scope.post.comments = comment.post.comments;
              $scope.post.comments.push(comment) //lastone

            });
          };
          $scope.incrementUpvotes = function(comment) {
            comment.upvotes += 1;
          };
        }])
 //przyciski do sortowania