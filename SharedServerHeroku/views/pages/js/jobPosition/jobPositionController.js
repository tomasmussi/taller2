mainApp.controller('jobPositionController', function($scope,$http,$window) {
	
    $scope.jobPosition = {
      name: "Ej: developer",
      description: "Ej: desarrollador web",
	  category: "Ej: software",
		reset : function(){
			$scope.jobPosition.name = "Ej: developer";
			$scope.jobPosition.description = "Ej: desarrollador web";
			$scope.jobPosition.category = "Ej: software";
            $scope.jobPosition.error = "";
            $scope.jobPosition.errorState=false;
		},
		submit : function(){
			var data = {
                "name": $scope.jobPosition.name,
                "description": $scope.jobPosition.description
            };
            $http.post('http://localhost:5000/job_positions/categories/'+$scope.jobPosition.category, data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
                $window.location.href = 'http://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.jobPosition.error="Error al guardar Job Position, por favor presione Reset y vuelva a intentar";
                $scope.jobPosition.errorState=true;
            });
		}

		
	}

});