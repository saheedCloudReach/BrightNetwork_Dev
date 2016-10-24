public class SectorTriggerHandler extends Reach.TriggerHandlerFactory {
    
    public override void afterInsert() {
 		sendSectorsToDotmailer(Trigger.newMap.KeySet());
    }
     
    public override void beforeDelete() {
    	sendSectorsToDotmailer(Trigger.oldMap.KeySet());
    }
    
    private void sendSectorsToDotmailer(Set<Id> ids) {
      	for (List<Sector_Junction_Obj__c > sectors  : [SELECT Id, 
                                                         	Account__c,
                                                         	Account__r.PersonEmail,
                                                 			Account__r.PersonHasOptedOutOfEmail
                                                         FROM Sector_Junction_Obj__c 
                                                      WHERE Id IN :ids]) {
        
            for (Sector_Junction_Obj__c sec : sectors) {
                if (sec.Account__c != null 
                    && sec.Account__r.PersonEmail != null 
                    && !sec.Account__r.PersonHasOptedOutOfEmail)
                    DotMailerService.submitSector(sec.Account__c, sec.Account__r.PersonEmail);
            }
        }
    }
}