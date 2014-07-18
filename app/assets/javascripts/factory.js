(function (){
	angular.module('jailBirds')

	.factory('Data'), [function($http){
		return {
			"data": {}
			"load data": function(){}
		}
	}]

	.factory('Bookee', ['$resource','Data' function($resource, Data){
		return $resource('/api/bookees/:id', { id: '@id'}, {
			update: { method: 'PATCH' }
		});
	}])

	.factory('Crime', ['$resource', function($resource){
		return $resource('/api/crimes/:id', { id: '@id'}, {
			update: { method: 'PATCH' },
			"find": function(id){
				Data.data.bookees
			}
		});
	}])

	.factory('ConvictOffense', ['$resource', function($resource){
		return $resource('/api/convict_offenses/:id', { id: '@id'}, {
			update: { method: 'PATCH' }
		});
	}]);


})();