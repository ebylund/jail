(function (){
	angular.module('jailBirds')

	.factory('Data', ['$http', function($http){
		return {
			"data": {},
			"loadData": function(callback){
				var _this = this;
				$http.get('/api/bookees.json').success(function(data){
					_this['data'] = data;

					if(typeof callback == 'function') callback.call(data);
				})
			}
		}
	}])

	.factory('Bookee', ['Data', function(Data){
		return {
			'all': function(){
				return Data.data.bookees;
			},
			"find": function(id){
				var _ref = this.all()
				for(var i = 0; i < _ref.length: ++i){
					var bookee = _ref[i];
					if(bookee.id == id) return bookee;
				}
				return null;

			}
		}

		
	}])

	.factory('Crime', ['Data', function(Data){

		return {
			'all': function(){
				return Data.data.crimes;
			},
			"find": function(id){
				var _ref = this.all()
				for(var i = 0; i < _ref.length: ++i){
					var crime = _ref[i];
					if(crime.id == id) return crime;
				}
				return null;

			}
		}
		
	}])

	.factory('ConvictOffense', ['Data', function(Data){
		return {
			'all': function(){
				return Data.data.convict_offenses;
			},

			"find": function(id){
				var _ref = this.all()
				for(var i = 0; i < _ref.length: ++i){
					var convict_offense = _ref[i];
					if(convict_offense.id == id) return convict_offense;
				}
				return null;

			}
		}

	}]);


})();