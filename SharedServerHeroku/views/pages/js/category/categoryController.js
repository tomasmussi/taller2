mainApp.controller('categoryController', function($scope,$http,$window, $route, $routeParams,$rootElement,$location) {
	
    $scope.category = {
      name: "Ej: developer",
      description: "Ej: desarrollador web",
		reset : function(){
			$scope.category.name = "Ej: developer";
			$scope.category.description = "Ej: desarrollador web";
            $scope.category.error = "";
            $scope.category.errorState=false;
		},
		submit : function(){
			var data = {
                "name": $scope.category.name,
                "description": $scope.category.description
            };
            $http.post('http://localhost:5000/categories/', data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
                $window.location.href = 'http://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.category.error="Error al guardar categoria, por favor presione Reset y vuelva a intentar";
                $scope.category.errorState=true;
            });
		},
        edit : function(){
            var data = {
                "name": $scope.category.name,
                "description": $scope.category.description,
            };
            $http.put('http://localhost:5000/categories/'+$scope.nameOld, data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
                $window.location.href = 'http://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.category.error="Error al guardar categoria, por favor presione Reset y vuelva a intentar";
                $scope.category.errorState=true;
            });
        },
        cancel : function(){
            $window.location.href = 'http://localhost:5000';
        },
        delete : function(){
            var data = {
                "name":  $scope.nameToDelete
            };
            $http.delete('http://localhost:5000/categories/'+$scope.nameToDelete,data)
            .success(function (data, status, headers, config) {
                
                $window.location.href = 'http://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.category.error="Error al Borrar categoria, por favor presione Cancelar y vuelva a intentar";
                $scope.category.errorState=true;
            });
        }

		
	}
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    $scope.nameOld = getParameterByName('nameToEdit');
    $scope.categoryOld = getParameterByName('categoryToEdit');
    $scope.nameToDelete = getParameterByName('nameToDelete');
    $scope.categoryToDelete = getParameterByName('categoryToDelete');
});