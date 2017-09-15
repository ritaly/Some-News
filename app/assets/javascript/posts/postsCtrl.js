 angular.module('flapperNews')
 .controller('PostsCtrl', [
        '$scope', '$window',
        'posts',
        'post',
        function($scope, $window, posts, post){
            $scope.post = post;

            $scope.addComment = function(){
              
            if($scope.body === '' || $scope.body == null) { return; }
            posts.addComment(post.id, {
              body: $scope.body,
              upvotes: 0
            //  username: 'user'
            }).then(function onSuccess(comment){
              
              //$scope.post.comments = comment.post.comments;
              $scope.post.comments.push(comment.comment) //lastone po dodaniu serializera z comment zorbilo sie comment.comment

            });
          };
          $scope.incrementUpvotes = function(comment) {
            posts.upvoteComment(post, comment);
          };
          $scope.decrementUpvotes = function(comment) {
            posts.downvoteComment(post, comment);
          };

          $scope.deleteComment = function(comment){  
            var confirmDeleteComment = $window.confirm('Are you absolutely sure you want to delete this element?');

            if (confirmDeleteComment){
              posts.deleteComment(post, comment).then(function onSuccess(){
              //to samo co w post.js , gdzie lepiej?
              pos = $scope.post.comments.findIndex(i => i.id === comment.id );
              $scope.post.comments.splice(pos, 1);
            });
            } else { return; }
            
          };
        }])
 //przyciski do sortowania