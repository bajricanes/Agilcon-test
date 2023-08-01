public with sharing class ExamRegistrationsHelper  {

    @AuraEnabled(cacheable=true)
    public static List<Exam_Registration__c> GetExamRegistrationsByExamId(Id examID) {
        return [SELECT Id, Student_Name__c 
                FROM Exam_Registration__c 
                WHERE Exam__c = :examID];
    }
    
}