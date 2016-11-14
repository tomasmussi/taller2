mainApp.controller('jobPositionController', function($scope,$http,$window, $route, $routeParams,$rootElement,$location) {
    
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
            $http.post('https://localhost:5000/job_positions/categories/'+$scope.jobPosition.category, data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
                $window.location.href = 'https://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.jobPosition.error="Error al guardar Job Position, por favor presione Reset y vuelva a intentar";
                $scope.jobPosition.errorState=true;
            });
        },
        edit : function(){
            var data = {
                "name": $scope.jobPosition.name,
                "description": $scope.jobPosition.description,
                "category": $scope.jobPosition.category
            };
            $http.put('https://localhost:5000/job_positions/categories/'+$scope.categoryOld+'/'+$scope.nameOld, data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
                $window.location.href = 'https://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.jobPosition.error="Error al guardar Job Position, por favor presione Reset y vuelva a intentar";
                $scope.jobPosition.errorState=true;
            });
        },
        cancel : function(){
            $window.location.href = 'https://localhost:5000';
        },
        delete : function(){
            var data = {
                "name":  $scope.nameToDelete,
                "category": $scope.categoryToDelete
            };
            $http.delete('https://localhost:5000/job_positions/categories/'+$scope.categoryToDelete+'/'+$scope.nameToDelete,data)
            .success(function (data, status, headers, config) {
                
                $window.location.href = 'https://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.jobPosition.error="Error al Borra Job Position, por favor presione Cancelar y vuelva a intentar";
                $scope.jobPosition.errorState=true;
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