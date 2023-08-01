@isTest
public with sharing class EMSOValidator_Test {
    
    @IsTest
    static void TestValidate(){
        EMSOValidator validator = new EMSOValidator();
        String EMSO = '1705997505279';
        String expected = 'OK';

        Test.startTest();
        String actual = validator.Validate(EMSO);
        Test.stopTest();

        Assert.areEqual(expected, actual);
    }

    @IsTest
    static void TestValidateValue(){
        EMSOValidator validator = new EMSOValidator();
        String EMSO = 'test123';
        String expected = 'EMSO is invalid. EMSO must be numeric.';

        Test.startTest();
        String actual = validator.Validate(EMSO);
        Test.stopTest();

        Assert.areEqual(expected, actual);
    }

    @IsTest
    static void TestValidateLength(){
        EMSOValidator validator = new EMSOValidator();
        String EMSO = '123';
        String expected = 'EMSO is invalid. EMSO must be 13 numbers long.';

        Test.startTest();
        String actual = validator.Validate(EMSO);
        Test.stopTest();

        Assert.areEqual(expected, actual);
    }

    @IsTest
    static void TestValidateVerificationCode(){
        EMSOValidator validator = new EMSOValidator();
        String EMSO = '1705997505271';
        String expected = 'EMSO is invalid. Verification code is not correct.';

        Test.startTest();
        String actual = validator.Validate(EMSO);
        Test.stopTest();

        Assert.areEqual(expected, actual);
    }
}