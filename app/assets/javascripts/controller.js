(function (){
	angular.module('jailBirds')
	.controller('BookeePage', [
		'$scope', '$sce', 'Bookee', 'Crime', 'ConvictOffense' ,'Data',
		function ($scope, $sce, Bookee, Crime, ConvictOffense, Data) {
			Data.loadData();
			$scope.Bookee = Bookee;
			$scope.Crime = Crime;
			$scope.ConvictOffense = ConvictOffense;


			$scope.location_bookee = {};
			$scope.setLocationBookee = function(bookee){
				$scope.location_bookee = bookee;
			};
			$scope.getMapLocation = function(){
				return $sce.trustAsResourceUrl("https://www.google.com/maps/embed/v1/place?key=AIzaSyAgWjEPdtvd6suUT-KekuL0xzZukTHp2YY&q="+encodeURI($scope.location_bookee.address+",+"+$scope.location_bookee.city_state)+"&zoom=16&maptype=roadmap")
			};


			$scope.bookee_details = function(bookee){
				$scope.bookee_info = bookee;
			};
		}
	]);
})();

// ng-repeat = 'bookee in Bookee.all()'
// --Bookee data--


// ng-repeat = 'convict_offense_id in bookee.convict_offense_ids' ng-init="convict_offense = ConvictOffense.find(convict_offense_id)"
// <div ng-init="crime = Crime.find(convict_offense.crime_id)"\
//  +++crime data+++
//  </div>

//  <div
//  	offense data
