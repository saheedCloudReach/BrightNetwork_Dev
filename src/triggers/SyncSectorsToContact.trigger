trigger SyncSectorsToContact on Sector_Junction_Obj__c (after insert, after update) {
    if(!SyncStateHolder.triggerRunning) {
        SyncStateHolder.triggerRunning = true;
        AccountSectorsUpdater sectorUpdater = new AccountSectorsUpdater(trigger.newMap);
        sectorUpdater.updateAccounts();
    }
    SyncStateHolder.triggerRunning = false;
}