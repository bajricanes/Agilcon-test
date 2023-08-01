@isTest
public with sharing class EMSOAPI_RequestHandler_Test {

    @IsTest
    static void TestExecute(){
        String EMSO = '1705997505279';
        String expected = 'OK';

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        EMSOAPI_RequestHandler handler = new EMSOAPI_RequestHandler();
        EMSOAPI_ResponseModel actual = handler.Execute(EMSO);
        Test.stopTest();

        Assert.areEqual(expected, actual.message);
        Assert.isTrue(actual.success);        
    }
}