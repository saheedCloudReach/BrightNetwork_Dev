trigger SyncToContact on Account (after insert,after update) {
    
    Trigger_Enabled__c triggerswitch = Trigger_Enabled__c.getValues('SyncToContact');
    if(triggerswitch.isEnabled__c) {
        if(!SyncStateHolder.triggerRunning) {
            SyncStateHolder.triggerRunning = true;
            
            ContactsUpdater updater = new ContactsUpdater(trigger.newMap);
            updater.updateContacts();
            
        }
        SyncStateHolder.triggerRunning = false;
    }
}