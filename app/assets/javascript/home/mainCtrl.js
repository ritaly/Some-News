 angular.module('flapperNews')
    .controller('MainCtrl', [
    '$scope','$window','posts',
    function($scope, $window, posts){
        //debugger
        $scope.posts = posts.posts;

        $scope.currentBtn = '';
        $scope.sortBy = function (btn) {
          if ($scope.currentBtn == btn) {
            $scope.currentBtn = '-'+ btn;
          } else {
            $scope.currentBtn = btn;
          }
          //alert($scope.currentBtn);
          return $scope.currentBtn;
           };
          //dopisac sortowanie
          //search tylko dla tytulow

        $scope.addPost = function(){
          debugger
          
            posts.create({
              id: $scope.posts.length,
              title: $scope.title,
              link: $scope.link,
              text: $scope.text,
              upvotes: 0,
              comments: []
            });
            
        };
        $scope.deletePost = function(post){
          debugger
           var confirmDeletePost = $window.confirm('Are you absolutely sure you want to delete this element?');
           posts.delete(post);
        };
        $scope.incrementUpvotes = function(post) {
          posts.upvote(post);
        };
        $scope.decrementUpvotes = function(post) {
          posts.downvote(post);
        };
    }]);