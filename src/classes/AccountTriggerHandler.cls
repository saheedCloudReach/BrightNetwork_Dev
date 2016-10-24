public class AccountTriggerHandler extends Reach.TriggerHandlerFactory {
    
    public override void afterUpdate() {
        updateMassFieldsInDotmailer(false); 
    }
    
    public override void afterInsert() {
        updateMassFieldsInDotmailer(true); 
    }
        
    private void updateMassFieldsInDotmailer(boolean isInsert) {
        String[] unsubscribeEmails = new List<String>();
        String[] acceptedEmails = new List<String>();
        String[] deletedEmails = new List<String>();
        
        Map<Id,String> accountIdEmailMap = new Map<Id,String>();

        Set<String> fieldsToCheck =  DotMailerAccountMapping.getAccountMapping().keySet();
        for (Account acc : (List<Account>) Trigger.new) {
            if (String.isBlank(acc.PersonEmail))
                continue;
            
            Account oldAccount = isInsert? null : (Account) Trigger.oldMap.get(acc.Id);
            
            if (acc.Status__c == 'Deleted' && (isInsert || oldAccount.Status__c != acc.Status__c)) {
                deletedEmails.add(acc.PersonEmail);
            }
            
            if (isInsert 
                || anyFieldUpdated(acc, oldAccount, fieldsToCheck)
                || (acc.Status__c == 'Accepted' && oldAccount.Status__c != acc.Status__c )) {
                        
                if (!acc.PersonHasOptedOutOfEmail && acc.Status__c != 'Deleted' && acc.PersonEmail != null){
                	accountIdEmailMap.put(acc.Id,acc.PersonEmail);
                }
                	
            }

            if (acc.Status__c == 'Accepted' && (isInsert || anyFieldUpdated(acc, 
                                (Account) Trigger.oldMap.get(acc.Id), 
            					new Set<String> {'Status__c'}))) {
            	if (!acc.PersonHasOptedOutOfEmail)
                	acceptedEmails.add(acc.PersonEmail);                    
            }
            
            if (acc.PersonHasOptedOutOfEmail &&
                	(isInsert || 
                		acc.PersonHasOptedOutOfEmail 
                     		!= oldAccount.PersonHasOptedOutOfEmail)) {
                unsubscribeEmails.add(acc.PersonEmail);
            }
        }
        
        if (!unsubscribeEmails.isEmpty())
        	DotMailerService.submitUnsubscribe(unsubscribeEmails);
        if (!acceptedEmails.isEmpty())
        	DotMailerService.submitAccept(acceptedEmails);
        if (!deletedEmails.isEmpty())
        	DotMailerService.submitDelete(deletedEmails);
        if(!accountIdEmailMap.isEmpty())	
       		DotMailerService.submitAccounts(accountIdEmailMap);
       		
    }
    
    private void updateFieldsInDotmailer(boolean isInsert) {
        String[] unsubscribeEmails = new List<String>();
        String[] acceptedEmails = new List<String>();
        String[] deletedEmails = new List<String>();

        Set<String> fieldsToCheck =  DotMailerAccountMapping.getAccountMapping().keySet();
        for (Account acc : (List<Account>) Trigger.new) {
            if (String.isBlank(acc.PersonEmail))
                continue;
            
            Account oldAccount = isInsert? null : (Account) Trigger.oldMap.get(acc.Id);
            
            if (acc.Status__c == 'Deleted' && (isInsert || oldAccount.Status__c != acc.Status__c)) {
                deletedEmails.add(acc.PersonEmail);
            }
            
            if (isInsert 
                || anyFieldUpdated(acc, oldAccount, fieldsToCheck)
                || (acc.Status__c == 'Accepted' && oldAccount.Status__c != acc.Status__c )) {
                        
                if (!acc.PersonHasOptedOutOfEmail && acc.Status__c != 'Deleted')
                	DotMailerService.submitAccount(acc.Id, acc.PersonEmail);
            }

            if (acc.Status__c == 'Accepted' && (isInsert || anyFieldUpdated(acc, 
                                (Account) Trigger.oldMap.get(acc.Id), 
            					new Set<String> {'Status__c'}))) {
            	if (!acc.PersonHasOptedOutOfEmail)
                	acceptedEmails.add(acc.PersonEmail);                    
            }
            
            if (acc.PersonHasOptedOutOfEmail &&
                	(isInsert || 
                		acc.PersonHasOptedOutOfEmail 
                     		!= oldAccount.PersonHasOptedOutOfEmail)) {
                unsubscribeEmails.add(acc.PersonEmail);
            }
        }
        
        if (!unsubscribeEmails.isEmpty())
        	DotMailerService.submitUnsubscribe(unsubscribeEmails);
        if (!acceptedEmails.isEmpty())
        	DotMailerService.submitAccept(acceptedEmails);
        if (!deletedEmails.isEmpty())
        	DotMailerService.submitDelete(deletedEmails);
    }
    
    private Boolean anyFieldUpdated(Account acc, Account oldAccount, Set<String> fieldsToCheck) {        
        for (String field : fieldsToCheck) {
            if (Utils.getValue(acc, field) != Utils.getValue(oldAccount, field))
                return true;
        }
        
        return false;
    }
}