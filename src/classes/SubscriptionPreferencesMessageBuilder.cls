public class SubscriptionPreferencesMessageBuilder implements DotMailerMessageBuilder {
	private Id accountId;
    private String email;
    
    public SubscriptionPreferencesMessageBuilder(Id accountId, String email) {
        this.accountId = accountId;
        this.email = email;
    }
    
	public DotMailerAttributeChangeRequest build() {
    	List<Subscription_preference__c> preferences = [
            SELECT Dotmailer_field_name__c, 
           		(SELECT Account__r.personemail
                 FROM Subscription_preferences__r 
                 WHERE account__c = :accountId) 
            FROM Subscription_preference__c 
            WHERE Dotmailer_field_name__c != null
            ORDER BY Dotmailer_field_name__c ASC];
        
		Account a = [SELECT Status__c FROM Account WHERE id = :accountId];
        
        return buildMessage(preferences, email, a);
    }
    
    private DotMailerAttributeChangeRequest buildMessage(List<Subscription_preference__c> preferences,
                                                                String email, Account a) {
        if (preferences == null || preferences.isEmpty())
            return null;

		DotMailerAttributeChangeRequest message = new DotMailerAttributeChangeRequest();   
        message.email = email;
        message.lead = false;
        message.accepted = a != null && a.Status__c != null && a.Status__c == 'Accepted';
                                                                  
        for (Subscription_preference__c pref : preferences) {
            DotMailerAttributeChangeRequest.DotMailerField field = 
                new DotMailerAttributeChangeRequest.DotMailerField();
            field.fieldName = pref.Dotmailer_field_name__c;
            
            field.fieldValue = String.valueOf(pref.Subscription_preferences__r != null 
                && !pref.Subscription_preferences__r.isEmpty());
            
            message.fields.add(field);
        }
        
        return message;
    }
}