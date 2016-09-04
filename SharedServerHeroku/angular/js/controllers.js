//angular.module("FinalApp")
//.controller("MainController",function($scope,$resource){
	//Post = $resource("http://jsonplaceholder.typicode.com/posts/:id",{id: "@id"});
	//Post = $resource("http://localhost:5000/job_positions");	
	//$scope.posts = Post.query();
//});

angular.module("FinalApp")
.controller("MainController",function($scope,$resource){
	var employee = $resource("http://localhost:5000/job_positions");
	employee.get(function(job) {
		console.table(job);
		 $scope.jobs = job.job_positions;
		console.table(jobs);
	}, function(error) {
		altert("Something has failed"); 
	});
});
