Liferay.Address = {
	getRegions: function() {
		Liferay.Service(
				  '/region/get-regions',
				  function(obj) {
				    console.log(obj);
				  }
				);
	}
};