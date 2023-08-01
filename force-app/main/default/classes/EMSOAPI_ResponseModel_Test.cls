@isTest
public with sharing class EMSOAPI_ResponseModel_Test {
    @IsTest
    static void TestParseJson(){
        
        String json = '{"success":true,"message":"OK"}';
        String expected = 'OK';

        Test.startTest();
        EMSOAPI_ResponseModel model = EMSOAPI_ResponseModel.parse(json);
        Test.stopTest();
        
        Assert.areEqual(expected, model.message);
        Assert.isTrue(model.success);
    }
}