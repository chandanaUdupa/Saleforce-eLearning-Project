({
	//the client-side helper to call the server-side controller to perform the search
    handleSearch: function( component, searchTerm ) {
        var action = component.get( "c.searchEnrollments" );
        action.setParams({
            searchTerm: searchTerm
        });
        //The helper will also fire the c:EnrollmentLoaded event to notify other components of the search results
        action.setCallback( this, function( response ) {
            var event = $A.get( "e.c:EnrollmentLoaded" );
            event.setParams({
                "enrollments": response.getReturnValue()
            });
            event.fire();
        });
        $A.enqueueAction( action );
    }
})