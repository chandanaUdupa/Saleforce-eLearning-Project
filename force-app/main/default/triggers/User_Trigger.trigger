trigger User_Trigger on User (after insert) {
// Add user record to student
Student.studAdd(Trigger.newMap.keySet());
}