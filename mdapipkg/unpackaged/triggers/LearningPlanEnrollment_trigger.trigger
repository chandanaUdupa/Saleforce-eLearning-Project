trigger LearningPlanEnrollment_trigger on LearningPlanEnrollment__c (after insert) {
    List<Enrolment__c> enrlList = new List<Enrolment__c>();
	List<LearningPlanCourseEnrollment__c> lpCourseEnrollmentList = new List<LearningPlanCourseEnrollment__c>();
    
	// Fetch the student id and learning plan id from Learning Plan Enrollment to create Enrollment records
    for(LearningPlanEnrollment__c lpenrollment : [Select Student__c, enrollmentDate__c, LearningPlan__r.Id from LearningPlanEnrollment__c where Id in: trigger.newmap.keyset() ] ) { 
		
        // Fetch all the associated courses's course id from Learning Plan Course to create Enrollment records
        for(LearningPlanCourse__c lpcourse : [Select Course__c FROM LearningPlanCourse__c WHERE LearningPlan__c =: lpenrollment.LearningPlan__c]){
        	Enrolment__c enrollment = new Enrolment__c();            
            enrollment.Student__c = lpenrollment.Student__c;
            enrollment.Course__c = lpcourse.Course__c;
            enrollment.dateEnrolled__c = lpenrollment.enrollmentDate__c;
            enrollment.status__c = 'Subscribed';
            enrlList.add(enrollment);
        }
    }
        
	insert enrlList;

    // Create learning plan course enrollments for the corresponding enrollment and lp enrollment
    for(LearningPlanEnrollment__c lpenrollment : [Select Id, Student__c, LearningPlan__r.Id from LearningPlanEnrollment__c where Id in: trigger.newmap.keyset() ] ) {    
        for(Enrolment__c enrollment : enrlList)
        {	
            LearningPlanCourseEnrollment__c lpCourseEnrollment = new LearningPlanCourseEnrollment__c();
            lpCourseEnrollment.Completed__c = False;
            lpCourseEnrollment.Enrollment__c = enrollment.Id;
        	lpCourseEnrollment.Status__c = 'Subscribed';
            lpCourseEnrollment.LearningPlanEnrollment__c = lpenrollment.Id;
            lpCourseEnrollmentList.add(lpCourseEnrollment);
        }
    }
    
    insert lpCourseEnrollmentList;
}