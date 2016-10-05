angular.module("FinalApp")
.controller("MainController",function($scope,$resource){
	var employee = $resource("http://localhost:5000/job_positions");
	var employee2 = $resource("http://localhost:5000/categories");
	var employee3 = $resource("http://localhost:5000/skills");

	employee.get(function(job) {
		console.table(job);
		 $scope.jobs = job.job_positions;
		//console.table(jobs);
	}, function(error) {
		altert("Something has failed"); 
	});
	
	employee2.get(function(category) {
		console.table(category);
		 $scope.categories = category.categories;
		//console.table(categories);
	}, function(error) {
		altert("Something has failed"); 
	}

	);

	employee3.get(function(skill) {
		console.table(skill);
		 $scope.skills = skill.skills;
		//console.table(categories);
	}, function(error) {
		altert("Something has failed"); 
	}

	);
});
