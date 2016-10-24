public class SubscriptionPreferenceTriggerHandler extends Reach.TriggerHandlerFactory {
    
    public override void afterInsert() {
 		sendPreferences(Trigger.newMap.KeySet());
    }

       
    public override void beforeDelete() {
    	sendPreferences(Trigger.oldMap.KeySet());
    }
    
    private void sendPreferences(Set<Id> ids) {
      	List<Subscription_preferences__c> preferences = [SELECT Id, 
                                                         	Account__c,
                                                         	Account__r.PersonEmail,
                                                         	Account__r.PersonHasOptedOutOfEmail
                                                         FROM Subscription_preferences__c 
                                                         WHERE Id IN :ids];
        
        for (Subscription_Preferences__c pref : preferences) {
            if (pref.Account__c != null 
                && pref.Account__r.PersonEmail != null 
                && !pref.Account__r.PersonHasOptedOutOfEmail)
            	DotMailerService.submitPreference(pref.Account__c, pref.Account__r.PersonEmail);
        }
    }
}