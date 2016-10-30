mainApp.controller('jobPositionController', function($scope,$http) {
	
    $scope.jobPosition = {
      name: "Ej: developer",
      description: "Ej: desarrollador web",
	  category: "Ej: software",
		reset : function(){
			$scope.jobPosition.name = "Ej: developer";
			$scope.jobPosition.description = "Ej: desarrollador web";
			$scope.jobPosition.category = "Ej: software";
		},
		submit : function(){
			var data = {
                "name": $scope.jobPosition.name,
                "description": $scope.jobPosition.description
            };
            $http.post('http://localhost:5000/job_positions/categories/'+$scope.jobPosition.category, data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
            })
            .error(function (data, status, header, config) {
                $scope.ResponseDetails = "Data: " + data +
                    "<hr />status: " + status +
                    "<hr />headers: " + header 
            });
		}

		
	}
    
});