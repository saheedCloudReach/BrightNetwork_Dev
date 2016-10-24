public class DotMailerService {
    
//    private final static String BASE_ENDPOINT = [SELECT Value__c FROM Dotmailer_Properties__c WHERE Name = 'DM_INT_ENDPOINT'].Value__c;
    //'https://cloudreach-connect-shared.herokuapp.com/ccsvc/bn/test';
 //   private final static String AUTH_KEY = [SELECT Value__c FROM Dotmailer_Properties__c WHERE Name = 'DM_INT_AUTH_KEY'].Value__c;
        //'77579a68-503b-422e-8e9e-865cc98d8717';
        
    @Future(callout = true)
    public static void submitPreference(Id accountId, String email) {      
        submit('/preference/update', new SubscriptionPreferencesMessageBuilder(accountId, email));  
    }
    
    @Future(callout = true)
    public static void submitAccount(Id accountId, String email) {
		submit('/preference/update', new ObjectMessageBuilder(accountId, email, Account.SObjectType, DotMailerAccountMapping.getAccountMapping()));
    }
    
     @Future(callout = true)
    public static void submitAccounts(Map<Id, String> accountIdEmailMap) {
    	
		submitMass('/preference/update', new ObjectMessageBuilder(accountIdEmailMap, Account.SObjectType, DotMailerAccountMapping.getAccountMapping()));
    }

    @Future(callout = true)
    public static void submitSector(Id accountId, String email) {
		submit('/preference/update', new SectorMessageBuilder(accountId, email));
    }
    
    @Future(callout = true)
    public static void submitConversions(String[] emails) {
        
        if (emails != null && !emails.isEmpty())
        	postJson('/account/convert', JSON.serializePretty(new AccountConversionMessage(emails)));
    }
    
    @Future(callout = true)
    public static void submitUnsubscribe(String[] emails) {
        if (emails != null && !emails.isEmpty())
        	postJson('/account/unsubscribe', JSON.serializePretty(new AccountConversionMessage(emails)));     
    }
    
    @Future(callout = true)
    public static void submitAccept(String[] emails) {
        if (emails != null && !emails.isEmpty())
        	postJson('/account/accept', JSON.serializePretty(new AccountConversionMessage(emails)));     
    }
    
    @Future(callout = true)
    public static void submitDelete(String[] emails) {
        if (emails != null && !emails.isEmpty())
        	postJson('/account/delete', JSON.serializePretty(new AccountConversionMessage(emails)));     
    }
    
    @Future(callout = true)
    public static void submitLead(Id leadId, String email) {
		submit('/preference/update', new ObjectMessageBuilder(leadId, email, Lead.SObjectType, DotMailerAccountMapping.getLeadMapping()));
    }
    
    private static void submit(String endpoint, DotMailerMessageBuilder builder) {
         DotMailerAttributeChangeRequest request = builder.build();

         if (request != null && request.email != null)
            postJson(endpoint, JSON.serializePretty(request));
    }
    
    private static void submitMass(String endpoint, DotMailerMessagesBuilder builder) {
    	List<DotMailerAttributeChangeRequest> requests = builder.buildAll();

         if (requests != null || !requests.isEmpty())
            postJson(endpoint, JSON.serializePretty(requests));
    }
    
    private static String getEndpoint() {
        return getProperty('DM_INT_ENDPOINT');
    }

    private static String getAuthKey() {
        return getProperty('DM_INT_AUTH_KEY');
    }
    private static String getProperty(String propName) {
        List<Dotmailer_Properties__c> props = [SELECT Value__c FROM Dotmailer_Properties__c WHERE Name = :propName];
		if (props == null || props.isEmpty())
            return 'test';
       	
        return props.get(0).Value__c;       
    }  
    private static void postJson(String endpoint, String json) {
        HttpRequest req = new HttpRequest();
		req.setEndpoint(getEndpoint() + endpoint);
        req.setHeader('AuthKey', getAuthKey());
        req.setHeader('Content-Type',  'application/json; charset=utf-8');
        req.setBody(json); //pass JSON into body of request
        req.setMethod('POST');

        HttpResponse res = new HttpResponse(); //instantiate response
        Http http = new Http();

        try {
            System.debug('Sending message: ' + json  + ' to endpoint: ' + req.getEndpoint());

            res = http.send(req); //send request
            String result = res.getBody();
            System.debug('Result received: ' + result);
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            Reach.Utils.createSystemException(e);
        }
    }
}