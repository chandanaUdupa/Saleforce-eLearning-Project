//Apex controller file to search the enrollment based on user/contact details
public with sharing class SearchEnrollment {
    //The @AuraEnabled annotation exposes this method to SearchEnrollment and other lightning components
    @AuraEnabled
    public static List<Enrolment__c> searchEnrollments(String searchTerm) {
        String searchKey = searchTerm + '%';
        List<Enrolment__c> returnList = new List<Enrolment__c>();
        
        //First search the student for the given email, name or username
        Student__c[] stds = [SELECT Id, Name__c, Email__c, Username__c from Student__c WHERE Name__c LIKE: searchKey OR Email__c LIKE: searchKey OR Username__c LIKE: searchKey];
        if(stds.size() > 0) {
        //Then, search the enrollment details for the fetched student 
        String enrollmentQuery = 'SELECT Id, dateCompleted__c,dateEnrolled__c,Name,status__c, Course__r.Name__c FROM Enrolment__c WHERE Student__c= \'';
        enrollmentQuery += stds[0].Id+'\'';
        enrollmentQuery += ' ORDER BY Name  ASC, CreatedDate DESC';        
        system.debug('enrollmentQuery ==>'+enrollmentQuery );          
        returnList = Database.query(enrollmentQuery);       
        }
        //Return enrollment list to the component
        return returnList;
        
    }
}