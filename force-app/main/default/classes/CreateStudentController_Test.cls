@isTest
public with sharing class CreateStudentController_Test {
    @IsTest
    static void TestValidateEMSO(){        
        String EMSO = '1705997505279';
        String expected = 'OK';

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String actual = CreateStudentController.ValidateEMSO(EMSO);
        Test.stopTest();

        Assert.areEqual(expected, actual);
    }

    @IsTest
    static void TestValidateEMSOCustom(){        
        String EMSO = '1705997505279';
        String expected = 'OK';

        Test.startTest();
        String actual = CreateStudentController.ValidateEMSOCustom(EMSO);
        Test.stopTest();
        Assert.areEqual(expected, actual);
    }
}