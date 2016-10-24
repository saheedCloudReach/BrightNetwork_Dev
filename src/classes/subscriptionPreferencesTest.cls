@isTest
private class subscriptionPreferencesTest {
	@isTest static void addTwoPrefs(){
        
        // check the count of sub prefs junction object
        Subscription_preferences__c[] sub_pref_1 = [Select Id from Subscription_preferences__c];
        Integer sub_pref_before = sub_pref_1.size();
        
        // create the trigger enabled switch
        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        
        // create the subscription preferences static data
        insert new Subscription_preference__c(name='Video of the month',Dotmailer_field_name__c='foo');
        insert new Subscription_preference__c(name='Womens newsletter',Dotmailer_field_name__c='bar');
        
        // create a test account
        RecordType personAccountRecordType =  [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'];
		Account testAccount = new Account();
 		testAccount.FirstName = 'Fred';
 		testAccount.LastName = 'Smith';
 		testAccount.RecordType = personAccountRecordType;
 		insert testAccount;
        
        // update the two sub prefs
        testAccount.Video_of_the_month__c = True;
        testAccount.Women_Newsletter__c = True;
        System.debug('UPDATE account');
        update testAccount;
        
        // check the count of sub prefs junction object
        Subscription_preferences__c[] sub_pref_2 = [Select Id from Subscription_preferences__c];
        Integer sub_pref_after = sub_pref_2.size();
        
        // check two lines have been added to the subscription preferences junction object
        System.assertEquals(sub_pref_before + 2, sub_pref_after);
    }
    
    @isTest static void removeTwoPrefs(){
        
        // create the trigger enabled switch
        insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        
        // create the subscription preferences static data
		insert new Subscription_preference__c(name='Video of the month',Dotmailer_field_name__c='foo');
        insert new Subscription_preference__c(name='Womens newsletter',Dotmailer_field_name__c='bar');
        
        // create a test account
        RecordType personAccountRecordType =  [SELECT Id FROM RecordType WHERE Name = 'Person Account' and SObjectType = 'Account'];
		Account testAccount = new Account();
 		testAccount.FirstName = 'Fred';
 		testAccount.LastName = 'Smith';
 		testAccount.RecordType = personAccountRecordType;
 		insert testAccount;
        
        // update the two sub prefs
        testAccount.Video_of_the_month__c = True;
        testAccount.Women_Newsletter__c = True;
        update testAccount;
        
        // check the count of sub prefs junction object
        Subscription_preferences__c[] sub_pref_1 = [Select Id from Subscription_preferences__c];
        Integer sub_pref_before = sub_pref_1.size();
        
        // update the two sub prefs
        testAccount.Video_of_the_month__c = False;
        testAccount.Women_Newsletter__c = False;
        update testAccount;
        
        // check the count of sub prefs junction object
        Subscription_preferences__c[] sub_pref_2 = [Select Id from Subscription_preferences__c];
        Integer sub_pref_after = sub_pref_2.size();
        
        // check two lines have been removed from the subscription preferences junction object
        System.assertEquals(sub_pref_before - 2, sub_pref_after);
        
    }
}