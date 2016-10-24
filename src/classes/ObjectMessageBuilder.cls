public class ObjectMessageBuilder implements DotMailerMessagesBuilder {
    
    private Id objectId;
    private Set<Id> objectIdList;
    private String email;
    private Schema.SObjectType type;
    private Map<String, String> mapping;
    private Map<Id,String> accountIdEmailMap;
    private List<SObject> objs;
    
    public ObjectMessageBuilder(Id objectId, String email, Schema.SObjectType type, Map<String, String> mapping) {
        this.objectId = objectId;
        this.email = email;
        this.type = type;
        this.mapping = mapping;
    }
    
     public ObjectMessageBuilder(Map<Id, String> accountIdEmailMap, Schema.SObjectType type, Map<String, String> mapping) {
        this.accountIdEmailMap = accountIdEmailMap;
        this.type = type;
        this.mapping = mapping;
        
        Reach.QueryFactory query =  
            new Reach.QueryFactory(type);
        
        for (String field : mapping.keySet()) {
            query.selectField(field);
        }
        
        if (type == Account.SObjectType)
        	query.selectField(Account.Status__c);
        	
       	Set<Id> accountIds = accountIdEmailMap.keySet();
        
        objs = Database.query(query.setCondition('Id = :accountIds').toSOQL());
    }
    
    public List<DotMailerAttributeChangeRequest> buildAll() {
		//Build a list of DotMailerAttributes
        if (objs == null || objs.isEmpty()){
            return null;
        }
        
        List<DotMailerAttributeChangeRequest> messages = new List<DotMailerAttributeChangeRequest>();
        
        for(SObject obj  : objs){
	        DotMailerAttributeChangeRequest message = new DotMailerAttributeChangeRequest();
	        message.email = email;
			message.lead = type == Lead.SObjectType;
	        message.accepted = type == Account.SObjectType && obj.get(Account.Status__c) == 'Accepted';
	        for (String field : mapping.keySet()) {
	            DotMailerAttributeChangeRequest.DotMailerField fieldMes = new DotMailerAttributeChangeRequest.DotMailerField();
	            fieldMes.fieldName = mapping.get(field);
	            Object value = getValue(obj, field);
	            fieldMes.fieldValue = value != null ? String.valueOf(value) : null;
	            message.fields.add(fieldMes);
	        }
	        messages.add(message);
        }
        
        return messages;
    }
    
     public DotMailerAttributeChangeRequest build() {
         
        Reach.QueryFactory query =  
            new Reach.QueryFactory(type);
        
        for (String field : mapping.keySet()) {
            query.selectField(field);
        }
        
        if (type == Account.SObjectType)
        	query.selectField(Account.Status__c);
        
        List<SObject> objs = Database.query(query.setCondition('Id = :objectId').toSOQL());
        
        if (objs == null || objs.isEmpty())
            return null;
        
        DotMailerAttributeChangeRequest message = new DotMailerAttributeChangeRequest();
        message.email = email;
		message.lead = type == Lead.SObjectType;
        message.accepted = type == Account.SObjectType && objs[0].get(Account.Status__c) == 'Accepted';
        for (String field : mapping.keySet()) {
            DotMailerAttributeChangeRequest.DotMailerField fieldMes = new DotMailerAttributeChangeRequest.DotMailerField();
            fieldMes.fieldName = mapping.get(field);
            Object value = getValue(objs[0], field);
            fieldMes.fieldValue = value != null ? String.valueOf(value) : null;
            message.fields.add(fieldMes);
        }
        
        return message;
    }
    
    private Object getValue(SObject a, String field) {
    	String[] splittedField = field.split('\\.');
        
        SObject sobj = a;
        for (integer i = 0; i < splittedField.size() - 1; i++) {
            sobj = sobj.getSObject(splittedField[i]);
            if (sobj == null)
            	return null;
        }

        return sobj.get(splittedField[splittedField.size() - 1]);
    }


}