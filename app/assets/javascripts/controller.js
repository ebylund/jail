(function (){
	angular.module('jailBirds').controller('BookeePage', ['$scope', 'Bookee', 'Crime', 'ConvictOffense' , function ($scope, Bookee, Crime, ConvictOffense) {
		$scope.test = "Hello, world";
		$scope.bookees = Bookee.query();
		$scope.crimes = Crime.query();
		$scope.convict_offenses = ConvictOffense.query();
	}]);
})();