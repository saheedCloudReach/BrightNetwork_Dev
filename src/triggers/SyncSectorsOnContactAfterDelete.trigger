trigger SyncSectorsOnContactAfterDelete on Sector_Junction_Obj__c (after delete) {
    if(!SyncStateHolder.triggerRunning) {
        SyncStateHolder.triggerRunning = true;
        
        AccountSectorsUpdater updater = new AccountSectorsUpdater(Trigger.oldMap);
        updater.cleanContacts();

        SyncStateHolder.triggerRunning = false;
    }
}