public class LeadTriggerHandler extends Reach.TriggerHandlerFactory {
    
    public override void afterUpdate() {
        updateFieldsInDotmailer(false);
        
    }
    
    public override void afterInsert() {
        updateFieldsInDotmailer(true);
        
    }
    
    private void updateFieldsInDotmailer(Boolean isInsert) {
        List<String> convertedEmails = new List<String>();

        for (Lead ld : (List<Lead>) Trigger.new) {
            System.debug('LEAD: ' + isInsert + ' ' + ld.IsConverted);

            if (isInsert || anyFieldUpdated(ld, 
                                (Lead) Trigger.oldMap.get(ld.Id),
                                DotMailerAccountMapping.getLeadMapping().keySet())) {
            	
             	if (!ld.IsConverted) 
                  DotMailerService.submitLead(ld.Id, ld.Email);
                                    
                                    
                                    
                                    
            }
            if (ld.IsConverted && !isInsert) {
                System.debug('Converted! ' + ld);
            	convertedEmails.add(ld.Email);
            }
        }
        
        System.debug('Converted Emails ' + convertedEmails);

        if (!convertedEmails.isEmpty())
        	DotMailerService.submitConversions(convertedEmails);
        
    }
    
    private Boolean anyFieldUpdated(Lead ld, Lead oldLd, Set<String> fieldsToCheck) {
        for (String field : fieldsToCheck) {
        	System.debug('FIELD : ' + field + ' VALUE ld : ' + Utils.getValue(ld, field) + ' VALUE oldLd : ' + Utils.getValue(oldLd, field));

            if (Utils.getValue(ld, field) != Utils.getValue(oldLd, field))
                return true;
        }
        
        return false;
    }

}