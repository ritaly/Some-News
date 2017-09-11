 angular.module('flapperNews')
    .controller('MainCtrl', [
    '$scope','posts',
    function($scope, posts){
        $scope.posts = posts.posts;
/*
        $scope.btnSwitch = function (btnIndex) {
          //Sort by title
          if (btnIndex == 1){
            //alert(tabIndex);
            $scope.sortPosts = function(post) {
           return post.title;
            };
          }   
          //Sort by upvotes 
          if (btnIndex == 2){
            $scope.sortPosts = function(post) {
              return post.upvotes;
            };
          }
          //Sort by username
          if (btnIndex == 3){
            $scope.sortPosts = function(post) {
               return post.username;
            };
          }
        };
        dopisac sortowanie
*/ 

        // tu wyciagnac sortPost

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