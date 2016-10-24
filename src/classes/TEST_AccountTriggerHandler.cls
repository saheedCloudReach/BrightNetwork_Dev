@isTest
global class TEST_AccountTriggerHandler {

    @isTest
    public static void testInsert() {

        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        insert new Dotmailer_Properties__c(name = 'DM_INT_ENDPOINT', value__c = 'http://google.com');
        insert new Dotmailer_Properties__c(name = 'DM_INT_AUTH_KEY', value__c = '1234');

        DotMailerAttributeChangeRequest expectedRequest = new DotMailerAttributeChangeRequest();
        expectedRequest.email = 'test@test.com';
        expectedRequest.fields.add(new DotMailerAttributeChangeRequest.DotMailerField());
        expectedRequest.fields.get(0).fieldName = 'GENDER';
        expectedRequest.fields.get(0).fieldValue = 'Male';
        
        Test.setMock(HttpCalloutMock.class, 
                     new MockHttpResponseGenerator(expectedRequest, null));
        
        Id personAccountRecordType = 
            [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'].Id;

        Account a = new Account(RecordTypeId = personAccountRecordType,
								PersonEmail = 'test@test.com', 
                                Gender__c = 'Male',
                                FirstName ='TestName',
  								LastName ='TestLastName');
        insert a;
    }
    
    @isTest
    public static void testAcceptOnInsert() {

        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        
        AccountConversionMessage expectedConversionRequest = new AccountConversionMessage(new List<String> {'test@test.com'});
        
        
        
        Test.setMock(HttpCalloutMock.class, 
                     new MockHttpResponseGenerator(null, expectedConversionRequest));
        
        Id personAccountRecordType = 
            [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'].Id;

        Account a = new Account(RecordTypeId = personAccountRecordType,
								PersonEmail = 'test@test.com', 
                                Gender__c = 'Male',
                                FirstName ='TestName',
  								LastName ='TestLastName',
                               	Status__c = 'Accepted');
        insert a;

    }
    
    @isTest
    public static void testDeleteOnInsert() {

        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        
        AccountConversionMessage expectedConversionRequest = new AccountConversionMessage(new List<String> {'test@test.com'});
      
        Test.setMock(HttpCalloutMock.class, 
                     new MockHttpResponseGenerator(null, expectedConversionRequest));
        
        Id personAccountRecordType = 
            [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'].Id;

        Account a = new Account(RecordTypeId = personAccountRecordType,
								PersonEmail = 'test@test.com', 
                                Gender__c = 'Male',
                                FirstName ='TestName',
  								LastName ='TestLastName',
                               	Status__c = 'Deleted');
        insert a;

    }
    
    @isTest
    public static void testUnsubscribeOnInsert() {

        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        
        AccountConversionMessage expectedConversionRequest = new AccountConversionMessage(new List<String> {'test@test.com'});
      
        Test.setMock(HttpCalloutMock.class, 
                     new MockHttpResponseGenerator(null, expectedConversionRequest));
        
        Id personAccountRecordType = 
            [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'].Id;

        Account a = new Account(RecordTypeId = personAccountRecordType,
								PersonEmail = 'test@test.com',
                                PersonHasOptedOutOfEmail = true,
                                Gender__c = 'Male',
                                FirstName ='TestName',
  								LastName ='TestLastName');
        insert a;

    }
}