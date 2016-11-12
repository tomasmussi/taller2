mainApp.controller('skillController', function($scope,$http,$window, $route, $routeParams,$rootElement,$location) {
    
    $scope.skill = {
      name: "Ej: developer",
      description: "Ej: desarrollador web",
      category: "Ej: software",
        reset : function(){
            $scope.skill.name = "Ej: developer";
            $scope.skill.description = "Ej: desarrollador web";
            $scope.skill.category = "Ej: software";
            $scope.skill.error = "";
            $scope.skill.errorState=false;
        },
        submit : function(){
            var data = {
                "name": $scope.skill.name,
                "description": $scope.skill.description
            };
            $http.post('http://localhost:5000/skill/categories/'+$scope.skill.category, data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
                $window.location.href = 'http://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.skill.error="Error al guardar Job Position, por favor presione Reset y vuelva a intentar";
                $scope.skill.errorState=true;
            });
        },
        edit : function(){
            var data = {
                "name": $scope.skill.name,
                "description": $scope.skill.description,
                "category": $scope.skill.category
            };
            $http.put('http://localhost:5000/skill/categories/'+$scope.categoryOld+'/'+$scope.nameOld, data)
            .success(function (data, status, headers, config) {
                $scope.PostDataResponse = data;
                $window.location.href = 'http://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.skill.error="Error al guardar Job Position, por favor presione Reset y vuelva a intentar";
                $scope.skill.errorState=true;
            });
        },
        cancel : function(){
            $window.location.href = 'http://localhost:5000';
        },
        delete : function(){
            var data = {
                "name":  $scope.nameToDelete,
                "category": $scope.categoryToDelete
            };
            $http.delete('http://localhost:5000/skill/categories/'+$scope.categoryToDelete+'/'+$scope.nameToDelete,data)
            .success(function (data, status, headers, config) {
                
                $window.location.href = 'http://localhost:5000';
            })
            .error(function (data, status, header, config) {
                $scope.skill.error="Error al Borra Job Position, por favor presione Cancelar y vuelva a intentar";
                $scope.skill.errorState=true;
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