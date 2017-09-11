 angular.module('flapperNews')
    .controller('MainCtrl', [
    '$scope','posts',
    function($scope, posts){
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
          posts.upvote(post);
        };
    }]);