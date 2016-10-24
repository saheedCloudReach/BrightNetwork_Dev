@isTest
public class TEST_SectorTriggerHandler {

    @isTest
    public static void insertNewSector() {

        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        insert new Dotmailer_Properties__c(name = 'DM_INT_ENDPOINT', value__c = 'http://google.com');
        insert new Dotmailer_Properties__c(name = 'DM_INT_AUTH_KEY', value__c = '1234');
        
        DotMailerAttributeChangeRequest expectedRequest = new DotMailerAttributeChangeRequest();
        expectedRequest.email = 'test@test.com';
        expectedRequest.fields.add(new DotMailerAttributeChangeRequest.DotMailerField());
        expectedRequest.fields.get(0).fieldName = 'FIELD1';
        expectedRequest.fields.get(0).fieldValue = 'true';
        
        Id personAccountRecordType = 
            [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'].Id;

        Account a = new Account(RecordTypeId = personAccountRecordType,
								PersonEmail = 'test@test.com', 
                                Gender__c = 'Male',
                                FirstName ='TestName',
  								LastName ='TestLastName');
        insert a;
        
        Test.setMock(HttpCalloutMock.class, 
                 new MockHttpResponseGenerator(expectedRequest, null));
        
        Sectors__c sec = new Sectors__c(Name = 'Technology', Dotmailer_field_name__c = 'FIELD1');
        insert sec;
        
        Sector_Junction_Obj__c secAccount = new Sector_Junction_Obj__c(Account__c = a.Id, Sectors__c = sec.Id);
        Test.startTest();
        
        insert secAccount;
        
        Test.stopTest();

    }
}