@isTest
public with sharing class ExamRegistrationsHelper_Test {

    @IsTest
    static void TestGetExamRegistrationsByExamId(){
        List<Exam_Registration__c> actual = new List<Exam_Registration__c>();
        
        Test.startTest();
        actual = ExamRegistrationsHelper.GetExamRegistrationsByExamId(null);
        Test.stopTest();

        Assert.isTrue(actual.Size() == 0);
    }
}