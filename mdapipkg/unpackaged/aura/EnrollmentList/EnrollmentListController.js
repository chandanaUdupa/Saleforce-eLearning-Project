({
    onEnrollmentsLoaded: function( component, event, helper ) {
        var cols = [
            {
                'label': 'Name',
                'fieldName': 'Name',
                'type': 'text'
            },
            {
                'label': 'Course',
                'fieldName': 'Course__r.Name__c',
                'type': 'text'
            },            
            {
                'label': 'Status',
                'fieldName': 'status__c',
                'type': 'text'
            }, 
            {
                'label': 'Enrolled Date',
                'fieldName': 'dateEnrolled__c',
                'type': 'date'
            },
            {
                'label': 'Completion Date',
                'fieldName': 'dateCompleted__c',
                'type': 'date'
            },           
            {
                'label': 'Action',
                'type': 'button',
                'typeAttributes': {
                    'label': 'View details',
                    'name': 'view_details'
                }
            }
        ];
        component.set( 'v.cols', cols );
        component.set( 'v.rows', event.getParam( 'enrollments' ) );
    },
    onRowAction: function( component, event, helper ) {
        var action = event.getParam( 'action' );
        var row = event.getParam( 'row' );
        if ( action.name == 'view_details' ) {
            var navigation = component.find( 'navigation' );
            navigation.navigate({
                'type': 'standard__recordPage',
                'attributes': {
                    'objectApiName': 'Enrolment__c',
                    'recordId': row.Id,
                    'actionName': 'view'
                }
            });
        }
    }
})