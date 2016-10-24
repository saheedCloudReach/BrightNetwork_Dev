@isTest
private class TEST_PersonAccountTriggerHandler {
	
	@isTest static void testTriggerHandler() {

        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);

		RecordType personAccountRT =  [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'];
		
		Account a1 = new Account(Name='Test',RecordType=personAccountRT);
		insert a1;

		Account a2 = new Account(Name='Test',RecordType=personAccountRT);
		insert a2;

		list<Account> accts = new list<Account>();
		accts.add(a1);
		accts.add(a2);

		for(Account a : accts){
			//a.Status__c = 'Accepted';
			//a.Hear_about_Events__c = true;
		}
		update accts;
		//System.assertEquals(accts[0].Hear_about_Events__c,true);
		delete accts;

	}
	
	
}