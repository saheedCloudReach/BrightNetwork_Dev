public class SectorMessageBuilder implements DotMailerMessageBuilder {

   	private Id accountId;
    private String email;
    
    public SectorMessageBuilder(Id accountId, String email) {
        this.accountId = accountId;
        this.email = email;
    }
    
	public DotMailerAttributeChangeRequest build() {
    	List<Sectors__c> sectors = [
            SELECT Dotmailer_field_name__c, 
           		(SELECT Account__r.personemail 
                 FROM Sectors__r 
                 WHERE account__c = :accountId) 
            FROM Sectors__c
            WHERE Dotmailer_field_name__c != null
            ORDER BY Dotmailer_field_name__c ASC];

		Account a = [SELECT Status__c FROM Account WHERE id = :accountId];
        
        return buildMessage(sectors, email, a);
    }
    
    private DotMailerAttributeChangeRequest buildMessage(List<Sectors__c> sectors,
                                                                String email, Account a) {
        if (sectors == null || sectors.isEmpty())
            return null;

		DotMailerAttributeChangeRequest message = new DotMailerAttributeChangeRequest();   
        message.email = email;
        message.lead = false;
       message.accepted = a != null && a.Status__c != null && a.Status__c == 'Accepted';


        for (Sectors__c sec : sectors) {
            DotMailerAttributeChangeRequest.DotMailerField field = 
                new DotMailerAttributeChangeRequest.DotMailerField();
            field.fieldName = sec.Dotmailer_field_name__c;
            
            field.fieldValue = String.valueOf(sec.Sectors__r != null 
                && !sec.Sectors__r.isEmpty());
            
            message.fields.add(field);
        }
        
        return message;
    }
}