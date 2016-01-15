/* global angular */
(function() {
  'use strict';
  angular.module('app').controller('applicationCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/events').then(function(response) {
        $scope.events = response.data;
      });
    };

    












  });
})();