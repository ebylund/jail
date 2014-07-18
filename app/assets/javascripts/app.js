(function () {
	angular.module('jailBirds', ['ngResource']).config([
	  '$httpProvider', function($httpProvider) {
	    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
	    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
	  }
	]);

	$(document).on('page:load', function() {
	  angular.bootstrap(document.body, ['jailBirds']);
	});	  

})();