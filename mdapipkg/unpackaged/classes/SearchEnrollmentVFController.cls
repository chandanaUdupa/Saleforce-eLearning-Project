public class SearchEnrollmentVFController {

    public Student__c stud{get;set;}    
    public List<Enrolment__c> enrollmentList {get;set;}
    
    // create a list of strings to hold the conditions
    List<string> conditions = new List<string>();

    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 10;
    
    // Constructor call to initialize the variables
    public SearchEnrollmentVFController(){
        system.debug('==>SearchEnrollmentVFController  is calling==>');
        stud = new Student__c();
        enrollmentList = new List<Enrolment__c>();
    }
    
    // searchEnroll() calls searchEnrollments() method inside by first clearing the variable values used for previous search 
    public void searchEnroll(){
        totalRecs = 0;
        OffsetSize = 0;
        if(enrollmentList !=null && enrollmentList.size()>0){
            stud = null;
            enrollmentList=null;
        }
        searchEnrollments();
        conditions.clear();
    }
    
	//  searchEnrollments() - Logic to search the record in Student object first and then using Student Id, search for all the enrollments    
    public void searchEnrollments(){
        
        System.debug('Total Records is ==>'+totalRecs);
        System.debug('OffsetSize is ==>'+OffsetSize);
        
        if(enrollmentList != null && !enrollmentList.isEmpty()){
            enrollmentList.clear();
        }
        String strQuery ='SELECT Id, Name__c, Email__c from Student__c';
        String enrollmentQuery = 'SELECT dateCompleted__c,dateEnrolled__c,Name,status__c, Course__r.Name__c FROM Enrolment__c WHERE Student__c= \'';
   
        if(stud.Name__c !=null && stud.Name__c !=''){
            conditions.add('Name__c Like \'%' + stud.Name__c +'%\' ');
        }
        if(stud.Email__c !=null && stud.Email__c !=''){
            conditions.add('Email__c Like\'%' +stud.Email__c +'%\' ');
        }
        
        if (conditions.size() > 0) {
            strQuery += '  WHERE ' + conditions[0];
            for (Integer i = 1; i < conditions.size(); i++)
                strQuery += '  AND ' + conditions[i];
        }
        if(totalRecs !=null && totalRecs ==0){
            Student__c[] stds =  Database.query(strQuery);
        	if(stds.size() > 0) {            
            enrollmentQuery += stds[0].Id+'\'';
        	system.debug('enrollmentQuery ==>'+enrollmentQuery );            
            List<Enrolment__c> enrlTemp = Database.query(enrollmentQuery);
            totalRecs = (enrlTemp !=null &&enrlTemp.size()>0)?enrlTemp.size():0;
            }
            else
            {          
            totalRecs = 0;    
            }
        }
        if(totalRecs !=null && totalRecs !=0){        
        // add sort and limits at the end  
        enrollmentQuery += ' ORDER BY Name  ASC, CreatedDate DESC LIMIT :LimitSize OFFSET :OffsetSize';
        
        enrollmentList  = Database.query(enrollmentQuery);
        }
    }

    // This method is called on the click of button 'Clear records' to initiate fresh search by clearing all the previous values
    public void clear(){
        stud = new Student__c();
        enrollmentList.clear();
    }
    
    // Pagination related calls
    // It is needed when the enrollment list is huge
    // First Page is just to set the OffsetSize
    public void FirstPage()
    {
        OffsetSize = 0;
        searchEnrollments();
    }
    public void previous()
    {
        OffsetSize = (OffsetSize-LimitSize);
        searchEnrollments();
    }
    public void next()
    {
        OffsetSize = OffsetSize + LimitSize;
        searchEnrollments();
    }
    public void LastPage()
    {
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
        searchEnrollments();
    }
    public boolean getprev()
    {
        
        if(OffsetSize == 0){
            
            return true;
        }
        else {
            
            return false;
        }
    }
    public boolean getnxt()
    {
        if((OffsetSize + LimitSize) > totalRecs){
            
            return true;
        }
        else {
            
            return false;
        }
    }
}