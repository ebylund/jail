(function (){
	angular.module('jailBirds')
	.controller('BookeePage', ['$scope', 'Bookee', 'Crime', 'ConvictOffense' ,'Data', function ($scope, Bookee, Crime, ConvictOffense, Data) {
			Data.loadData();
			$scope.Bookees = Bookees;
			$scope.Crime = Crime;
			$scope.ConvictOffense = ConvictOffense;

	}]);
})();

ng-repeat = 'bookee in Bookee.all()'
--Bookee data--


ng-repeat = 'convict_offense_id in bookee.convict_offense_ids' ng-init="convict_offense = ConvictOffense.find(convict_offense_id)"
<div ng-init="crime = Crime.find(convict_offense.crime_id)"\
 +++crime data+++
 </div>

 <div
 	offense data