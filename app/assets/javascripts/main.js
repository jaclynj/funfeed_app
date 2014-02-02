var funFeedApp = angular.module("funFeedApp", []);

function PostController($scope, $http) {
  $scope.updatePosts = function() {
    $http.get('/posts.json').success(function(data, status, headers, config) {
      $scope.data = data;
    }).error(function(data, status) {
      // console.log(data);
      // console.log(status);
    });
  };

  $scope.submitPost = function(data) {
    var params = {post: {content: data, media_type: "txt"} } ;
    $http.post('/posts.json', params ).success(function(data){
      $scope.updatePosts();
    }).error(function(data){
      // console.log(data);
    });
  };
  $scope.deletePost = function(data) {
    $http.delete('/posts/' + data.id + '.json', data).success(function() {
      $scope.updatePosts();
    }).error(function(data){
      // console.log(data);
    });
  };
  $scope.updatePosts();
}
