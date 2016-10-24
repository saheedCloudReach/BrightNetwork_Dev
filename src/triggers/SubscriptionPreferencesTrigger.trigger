trigger SubscriptionPreferencesTrigger on Subscription_preferences__c (before insert, after insert, before update, after update, before delete) {
    
	new SubscriptionPreferenceTriggerHandler().run();
}