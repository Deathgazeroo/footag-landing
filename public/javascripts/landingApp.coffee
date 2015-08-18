angular.module 'landingApp', ['ngRoute']

.controller 'MainCtrl', () ->
  return

.controller 'newsletterCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.newsletter = {
    email: 'me@example.com'
    confirmed: false
  }

  $scope.close = () ->
    $scope.newsletter.confirmed = false
    return

  $scope.save = (email) ->
    $http.post '/newsletter', email
    .success (result) ->
      if (result == "OK")
        $scope.newsletter.confirmed = true
      return
    return
  return
]

.controller 'tabCtrl', ['$scope', ($scope) ->
  $scope.currentTab = 0

  $scope.updateTab = (tab) ->
    $scope.currentTab = tab
    return

  $scope.isActiveTab = (tab) ->
    if $scope.currentTab == tab
      return true
    else
      return false
]

.config [ '$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider
  .when '', {
      redirectTo: '/home'
      controller: 'newsletterCtrl'
  }
  .when '/home', {
      templateUrl: 'templates/home.html'
  }
  .when '/', {
      redirectTo: '/home'
  }
  .otherwise {
      redirectTo: '/home'
  }
  return
]
