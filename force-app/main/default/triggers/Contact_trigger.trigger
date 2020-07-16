trigger Contact_trigger on Contact (after insert) {
// Add contact record to Student
Student.studAddFromContact(Trigger.newMap.keySet());

}