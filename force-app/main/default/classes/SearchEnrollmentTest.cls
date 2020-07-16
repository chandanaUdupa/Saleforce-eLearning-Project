@isTest
public class SearchEnrollmentTest { 

    @isTest
    private static void testSearchEnrollment_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();
        seController.stud = new Student__c();
        seController.stud.Email__c = 'test.test@gmail.com';
        seController.searchEnrollments();
        System.assert(seController.enrollmentList.size() == 0);
    } 
    @isTest
    private static void testSearchEnrollment_positive_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();
        
        seController.stud = new Student__c();
        seController.stud.Email__c = 'chandana.udupa@gmail.com';
          
        
        seController.searchEnrollments();
    } 
    @isTest
    private static void testSearchEnrollment1_positive_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();
        
        seController.stud = new Student__c();
        seController.stud.Email__c = 'chandana.udupa@gmail.com';
          
        
        seController.searchEnroll();
    } 
    
    @isTest
    private static void testclear_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();          
        
        seController.clear();
    } 

    @isTest
    private static void testgetprev_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();          
        
        seController.getprev();
    } 
    
    @isTest
    private static void testgetnxt_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();          
        
        seController.getnxt();
    } 
    
    @isTest
    private static void testSearchEnrollment_FirstPage_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();
        
        seController.stud = new Student__c();
        seController.stud.Email__c = 'chandana.udupa@gmail.com';
          
        
        seController.FirstPage();
    } 

    @isTest
    private static void testSearchEnrollment_previous_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();
        
        seController.stud = new Student__c();
        seController.stud.Email__c = 'chandana.udupa@gmail.com';
          
        
        seController.previous();
    }     


    @isTest
    private static void testSearchEnrollment_next_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();
        
        seController.stud = new Student__c();
        seController.stud.Email__c = 'chandana.udupa@gmail.com';
          
        
        seController.next();
    } 

    @isTest
    private static void testSearchEnrollment_LastPage_vf(){
        SearchEnrollmentVFController seController = new SearchEnrollmentVFController();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();
        
        seController.stud = new Student__c();
        seController.stud.Email__c = 'chandana.udupa@gmail.com';
          
        
        seController.LastPage();
    }      
    @isTest
    private static void testSearchEnrollment_lightningcomponent(){
        List<Enrolment__c> returnList = new List<Enrolment__c>();
        //returnList = SearchEnrollment.searchEnrollments('test.test@gmail.com');
        System.assertEquals(SearchEnrollment.searchEnrollments('test.test@gmail.com') , returnList);
    }

    @isTest
    private static void testSearchEnrollment1_lightningcomponent(){
        List<Enrolment__c> returnList = new List<Enrolment__c>();
        //returnList = SearchEnrollment.searchEnrollments('test.test@gmail.com');
        System.assertEquals(SearchEnrollment.searchEnrollments('testxyzzzz') , returnList);
    }
    
    @isTest
    private static void testSearchEnrollment_positive_lightningcomponent(){
        List<Enrolment__c> returnList = new List<Enrolment__c>();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();

        //Student__c[] stds = [SELECT Id, Name__c, Email__c, Username__c from Student__c WHERE Email__c LIKE: 'chandana.udupa@gmail.com'];
        
        //enrollmentList = [SELECT Id, dateCompleted__c,dateEnrolled__c,Name,status__c, Course__r.Name__c FROM Enrolment__c WHERE Student__c=: stds[0].Id];        
        
        returnList = SearchEnrollment.searchEnrollments('chandana.udupa@gmail.com');
        //System.assert(returnList.size() > 0);
        //System.assertEquals(enrollmentList, returnList);
    }

    @isTest
    private static void testSearchEnrollment1_positive_lightningcomponent(){
        List<Enrolment__c> returnList = new List<Enrolment__c>();
        List<Enrolment__c> enrollmentList = new List<Enrolment__c>();
        
        returnList = SearchEnrollment.searchEnrollments('chandana.udupa@gmail.com');
    }    
   
}