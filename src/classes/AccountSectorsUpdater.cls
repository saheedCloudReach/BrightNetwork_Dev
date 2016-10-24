public class AccountSectorsUpdater {
    
    private Map<Id, List<Sector_Junction_Obj__c>> sectorByAccountId;
    private List<Contact> contactsToUpdate;
    private Map<String, String> fieldMappings;
    
    private static final String PERSON_ACCOUNT_RECORD_TYPE_ID = '012200000002ZtpAAE';
    
    public AccountSectorsUpdater(Map<Id, Sector_Junction_Obj__c> updatedSectors) {
        defineMappings();

        List<Sector_Junction_Obj__c> filteredAccounts = filterNonPersonAccounts(updatedSectors);
        sectorByAccountId = getSectorJunctionByAccountId(filteredAccounts);
        contactsToUpdate = getContactsForAccounts(sectorByAccountId.keySet());      
    }
    
    public void defineMappings() {
        fieldMappings = new Map<String, String>();
        fieldMappings.put('Consumer & Retail', 'Sector_Consumer_Retail__c');
        fieldMappings.put('Professional Services', 'Sector_Professional_Services__c');
        fieldMappings.put('Technology', 'Sector_Technology__c');
        fieldMappings.put('Charity & Public Sector', 'Sector_Charity_Public_Sector__c');
        fieldMappings.put('Consulting', 'Sector_Consulting__c');
        fieldMappings.put('Law', 'Sector_Law__c');
        fieldMappings.put('Banking & Finance', 'Sector_Banking_Finance__c');
        fieldMappings.put('Entrepreneurship', 'Sector_Entrepreneurship__c');
        fieldMappings.put('Marketing & Media', 'Sector_Marketing_Media__c');
    }
    
    public void updateAccounts() {        
        List<Contact> updatedContacts = getUpdatedContacts(false);
        upsert updatedContacts;
    }
    
    public void cleanContacts() {        
        List<Contact> updatedContacts = getUpdatedContacts(true);
        upsert updatedContacts;
    }    
    
    private List<Contact> getUpdatedContacts(Boolean isClean) {
        List<Contact> updatedContacts = new List<Contact>();
        
        for(Contact contact : this.contactsToupdate) {
            List<Sector_Junction_Obj__c> sectorList = sectorByAccountId.get(contact.AccountId);
            
            if (sectorList == null || sectorList.isEmpty())
                continue;
            
            Contact c = updateContact(contact, sectorList, isClean);
          
            updatedContacts.add(c);
        }
        
        return updatedContacts;
    }
    
    public Contact updateContact(Contact contactToUpdate, List<Sector_Junction_Obj__c> sectorsToUpdate, boolean isClean) {
        // Because a bug in SFDC we need to create a new one.
        Contact updatedContact = new Contact(id = contactToUpdate.Id);
        
        for (Sector_Junction_Obj__c sector : sectorsToUpdate) {
            updateContactFromSector(updatedContact, sector, isClean);                                               
        }
        
        return updatedContact;
    }
 
    private void updateContactFromSector(Contact c, Sector_Junction_Obj__c sector, boolean isClean) {             
        String fieldNameToUpdate = fieldMappings.get(sector.Sector_Name__c);     
        String valueToSet = null;
        if (!isClean)
            valueToSet = sector.Sector_Name__c;
        
        c.put(fieldNameToUpdate, valueToSet);       
    }
    
    private static Map<Id, List<Sector_Junction_Obj__c>> getSectorJunctionByAccountId(List<Sector_Junction_Obj__c> sectorAccounts) {
        Map<Id, List<Sector_Junction_Obj__c>> sectorByAccountId = new Map<Id, List<Sector_Junction_Obj__c>>();
        
        for(Sector_Junction_Obj__c sectorAccount : sectorAccounts) {            
            List<Sector_Junction_Obj__c> sectorList = sectorByAccountId.get(sectorAccount.Account__c);
            
            if (sectorList == null) {
                sectorList = new List<Sector_Junction_Obj__c>();
                sectorByAccountId.put(sectorAccount.Account__c, sectorList);
            }
            
            sectorList.add(sectorAccount);
        }      
        return sectorByAccountId;
        
    }
    
    private List<Sector_Junction_Obj__c> filterNonPersonAccounts(Map<id, Sector_Junction_Obj__c> updatedSectorsMap) {
        List<Id> accountIds = new List<Id>();
        for (Sector_Junction_Obj__c s : updatedSectorsMap.values())
            accountIds.add(s.Account__c);
           
        Set<Account> filteredAccounts = new Set<Account>([SELECT Id FROM Account 
                WHERE RecordTypeId = :PERSON_ACCOUNT_RECORD_TYPE_ID 
                AND Id IN :accountIds]);
        
        List<Sector_Junction_Obj__c> result = new List<Sector_Junction_Obj__c>();
        for (Sector_Junction_Obj__c sector : updatedSectorsMap.values()) {
            if (filteredAccounts.contains(new Account(id = sector.Account__c))) {
                result.add(sector);
            }
        }
        
        return result;
        
//        return [SELECT Id, Account__c, Sector_name__c FROM Sector_Junction_Obj__c 
//                WHERE account__r.RecordTypeId = :PERSON_ACCOUNT_RECORD_TYPE_ID 
//                AND Id IN :updatedSectorIds];
    }
    
    private List<Contact> getContactsForAccounts(Set<Id> accounts) {
        return [select Id,
                Sector_Consumer_Retail__c,
                Sector_Professional_Services__c,
                Sector_Technology__c,
                Sector_Charity_Public_Sector__c,
                Sector_Consulting__c,
                Sector_Law__c,
                Sector_Banking_Finance__c,
                Sector_Entrepreneurship__c,
                Sector_Marketing_Media__c,
                AccountId
                from Contact where AccountId IN :accounts FOR UPDATE];
    }

}