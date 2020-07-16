@isTest public class TestTriggers {  
    @isTest static void userTest() {
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='testmyinterview4@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='testmyinterview4@testorg.com');
      
        insert u;
        
        Student__c st = [SELECT Email__c FROM Student__c WHERE Email__c = :u.Email LIMIT 1];
        System.assertEquals(st.Email__c,u.Email);
  }
    
  @isTest static void lpEnrollmentTest() {
        //Student__c[] stds = [SELECT Id from docebosalesfor__Student__c WHERE docebosalesfor__Email__c LIKE: 'chandana.udupa@gmail.com' LIMIT 1];
		//Learning_plan__c[] lps = [SELECT Id from docebosalesfor__Learning_plan__c WHERE docebosalesfor__Code__c LIKE: 'SFDC_LP_DEV' LIMIT 1];      
        //LearningPlanEnrollment__c lpEnrollment = new LearningPlanEnrollment__c(docebosalesfor__Student__c = stds[0].Id, docebosalesfor__LearningPlan__c= lps[0].Id);
	  	LearningPlanEnrollment__c lpEnrollment = new LearningPlanEnrollment__c(docebosalesfor__Student__c = 'a0A6F00001BUD8eUAH', docebosalesfor__LearningPlan__c= 'a056F00001ANEAEQA5');	
      
        insert lpEnrollment;
  } 

  @isTest static void lpEnrollmentTest1() {
        //Student__c[] stds = [SELECT Id from docebosalesfor__Student__c WHERE docebosalesfor__Email__c LIKE: 'chandana.udupa@gmail.com' LIMIT 1];
		//Learning_plan__c[] lps = [SELECT Id from docebosalesfor__Learning_plan__c WHERE docebosalesfor__Code__c LIKE: 'SFDC_LP_DEV' LIMIT 1];      
        //LearningPlanEnrollment__c lpEnrollment = new LearningPlanEnrollment__c(docebosalesfor__Student__c = stds[0].Id, docebosalesfor__LearningPlan__c= lps[0].Id);
	  	LearningPlanEnrollment__c lpEnrollment = new LearningPlanEnrollment__c(docebosalesfor__Student__c = 'a0A6F00001BUD8eUAH', docebosalesfor__LearningPlan__c= 'a056F00001ANEAEQA5');	
      
        insert lpEnrollment;
  }   
    
  @isTest static void contactTest() {
        Contact ct = new Contact(Email='standardcontact@testorg.com', LastName='standardcontact');

        insert ct;
        
        Student__c st = [SELECT Email__c FROM Student__c WHERE Email__c = :ct.Email LIMIT 1];
        System.assertEquals(st.Email__c,ct.Email);
  }   

  @isTest static void contactTest_Class() {
        Contact ct = new Contact(Email='standardcontact1@testorg.com', LastName='standardcontact1');

        insert ct;
        Set<Id> contactId = new Set<Id>();
        contactId.Add(ct.Id);
        Student.studAddFromContact(contactId);
        Student__c st = [SELECT Email__c FROM Student__c WHERE Email__c = :ct.Email LIMIT 1];
        System.assertEquals(st.Email__c,ct.Email);
  }      
     
}