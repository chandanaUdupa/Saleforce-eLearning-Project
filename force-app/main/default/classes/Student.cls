global class Student {
    
public static void studAdd(Set<Id> userIds) {

List<User> user = [select Id, firstname, lastname, Username, email from user where Id IN :userIds];

List<Student__c> studToUpdate = new List<Student__c>();

for (User usr : User) {

Student__c stud = new Student__c (
Username__c = usr.Username,   

FirstName__c = usr.FirstName,

Email__c = usr.Email,

LastName__c = usr.LastName,

Name__c = usr.FirstName + ' ' + usr.LastName,

Type__c = 'User'
);

studToUpdate.add(stud);

}

insert studToUpdate;

}

    
public static void studAddFromContact(Set<Id> contactIds) {

List<Contact> Contacts = [select Id, firstname, lastname, email from Contact where Id IN :contactIds];

List<Student__c> studToUpdate = new List<Student__c>();

for (Contact contact : Contacts) {

Student__c stud = new Student__c (

/* Since contact doesn't have the username field, copying email value to student's username value */    
Username__c = contact.Email,
    
FirstName__c = contact.FirstName,

Email__c = contact.Email,

LastName__c = contact.LastName,

Name__c = contact.FirstName + ' ' + contact.LastName,

Type__c = 'Contact'
);

studToUpdate.add(stud);

}

insert studToUpdate;

}
    
}