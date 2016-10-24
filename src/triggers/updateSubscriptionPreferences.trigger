trigger updateSubscriptionPreferences on Account (after update, after insert) {
   
    List<Subscription_preference__c> videoPref = [SELECT Id from Subscription_preference__c where Name = 'Video of the month'];
    List<Subscription_preference__c> womenPref = [SELECT Id from Subscription_preference__c where Name = 'Womens newsletter'];
    
    // if the preferences are not there, skip
    if (videoPref.size() == 0 || womenPref.size() == 0)
        return;
        
    
    System.debug('Video: ' + videoPref);
    System.debug('Women: ' + womenPref);
   
    // Query and get a map accountId --> Subscription_preferences__c for 'Video of the month'
    Subscription_preferences__c[] videoPrefs = [SELECT Id, Account__c FROM Subscription_preferences__c WHERE Subscription_preference__c = :videoPref.get(0).Id AND Account__c IN :Trigger.newMap.keySet()];
    Map<Object, SObject> videoPrefsByAccId = Reach.Utils.collect(videoPrefs).byField(Subscription_preferences__c.Account__c).noDuplicates();
 
    System.debug('Video by ID: ' + videoPrefsByAccId);

    // Query and get a map accountId --> Subscription_preferences__c for 'Womens newsletter'
    Subscription_preferences__c[] womenPrefs = [SELECT Id, Account__c FROM Subscription_preferences__c WHERE Subscription_preference__c = :womenPref.get(0).Id AND Account__c IN :Trigger.newMap.keySet()];
    Map<Object, SObject> womenPrefsByAccId = Reach.Utils.collect(womenPrefs).byField(Subscription_preferences__c.Account__c).noDuplicates();

    System.debug('Women by ID: ' + womenPrefsByAccId);

    Subscription_preferences__c[] toDelete = new List<Subscription_preferences__c>();
    Subscription_preferences__c[] toCreate = new List<Subscription_preferences__c>();

    for (Account newAccount : Trigger.new) {
        // get the old account (before update)
        Account oldAccount = null;
        if (!Trigger.isInsert)
        	oldAccount = Trigger.oldMap.get(newAccount.Id);
        
        System.debug('PROCESS ACCOUNT : newsletter new: ' 
                     + newAccount.Women_Newsletter__c 
                     + ' video new: ' + newAccount.Video_of_the_month__c);

        // if women newsletter checkbox has changed 
        if (oldAccount == null || oldAccount.Women_Newsletter__c != newAccount.Women_Newsletter__c) {
            System.debug('newsletter updated');

            if (newAccount.Women_Newsletter__c) {
                toCreate.add(new Subscription_preferences__c(Account__c=newAccount.Id, Subscription_preference__c = womenPref.get(0).Id));
            } else {
                Subscription_preferences__c existingPref = (Subscription_preferences__c) womenPrefsByAccId.get(newAccount.Id);
                if (existingPref != null)
                	toDelete.add(existingPref);
            }
        }
        
        // if video of the month checkbox has changed 
        if (oldAccount == null || oldAccount.Video_of_the_month__c != newAccount.Video_of_the_month__c) {
            System.debug('video updated');

            if (newAccount.Video_of_the_month__c) {
                toCreate.add(new Subscription_preferences__c(Account__c=newAccount.Id, Subscription_preference__c=videoPref.get(0).Id));
            } else {
                Subscription_preferences__c existingPref = (Subscription_preferences__c) videoPrefsByAccId.get(newAccount.Id);
                if (existingPref != null)
                	toDelete.add(existingPref);
        	}       
        
    	}
    }
    System.debug('To Delete: ' + toDelete);
    delete toDelete;
    System.debug('To Create: ' + toCreate);
    insert toCreate;
}