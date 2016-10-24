public class ContactsUpdater {
    private Map<Id, Account> filteredAccounts;
    private List<Contact> contactsToUpdate;
    
    private static final String PERSON_ACCOUNT_RECORD_TYPE_ID = '012200000002ZtpAAE';
    
    public ContactsUpdater(Map<Id, Account> updatedAccounts) {
        filteredAccounts = filterNonPersonAccounts(updatedAccounts.keySet());
        contactsToUpdate = queryContactsToUpdate(filteredAccounts.keySet());
    }
    
    public void updateContacts() {
        List<Contact> updatedContacts = new List<Contact>();
        
        for (Contact c : contactsToUpdate) {
            Account a = filteredAccounts.get(c.AccountId);
            updatedContacts.add(copyFields(c, a));
        }
        
        upsert updatedContacts;
    }
    
    private Contact copyFields(Contact originalContact, Account a) {
        Contact c = new Contact(id = originalContact.id);
        
        c.A_level_or_equivalent_grade_1__c = a.A_level_or_equivalent_grade_1__c;
        c.A_level_or_equivalent_grade_2__c = a.A_level_or_equivalent_grade_2__c;
        c.A_level_or_equivalent_grade_3__c = a.A_level_or_equivalent_grade_3__c;
        c.A_level_or_equivalent_grade_4__c = a.A_level_or_equivalent_grade_4__c;
        c.A_level_or_equivalent_grade_5__c = a.A_level_or_equivalent_grade_5__c;
        c.A_level_or_equivalent_subject_1__c = a.A_level_or_equivalent_subject_1__r.name;
        c.A_level_or_equivalent_subject_2__c = a.A_level_or_equivalent_subject_2__r.name;
        c.A_level_or_equivalent_subject_3__c = a.A_level_or_equivalent_subject_3__r.name;
        c.A_level_or_equivalent_subject_4__c = a.A_level_or_equivalent_subject_4__r.name;
        c.A_level_or_equivalent_subject_5__c = a.A_level_or_equivalent_subject_5__r.name;
        c.Birth_Day__c = a.Birth_Day__c;
        c.Birth_Month__c = a.Birth_Month__c;
        c.Gender__c = a.Gender__c;
        if(a.Graduation_Year__c != null) {
            c.Graduation_Year__c = Integer.valueOf(a.Graduation_Year__c);
        } else {
            c.Graduation_Year__c = null;
        }
        c.Maths_A_level_Grade_or_equivalent__c = a.Maths_A_level_Grade_or_equivalent__c;
        c.Maths_A_level_or_equivalent__c = a.Maths_A_level_or_equivalent__c;
        c.Right_To_Work_In_UK__c = a.Right_To_Work_In_UK__c;
        c.School_Type__c = a.School_Type__c;
        c.Status__c = a.Status__c;
        c.Twitter_Handle__c = a.Twitter_Handle__c;
        c.Undergraduate_Degree_Grade__c = a.Undergraduate_Degree_Grade__c;
        c.Undergraduate_Degree_Subject_1__c = a.Undergraduate_Degree_Subject_1__r.name;
        c.Undergraduate_Degree_Subject_2__c = a.Undergraduate_Degree_Subject_2__r.name;
        c.Undergraduate_Degree_Subject_3__c = a.Undergraduate_Degree_Subject_3__r.name;
        c.Undergraduate_Degree_Subject_4__c = a.Undergraduate_Degree_Subject_4__r.name;
        c.Undergraduate_Degree_Subject_5__c = a.Undergraduate_Degree_Subject_5__r.name;
        c.University__c = a.University__c;
        
        return c;
    }

    private Map<Id, Account> filterNonPersonAccounts(Set<Id> updatedAccountIds) {
        List<Account> filteredAccounts = [SELECT Id,
                                          A_level_or_equivalent_grade_1__c,
                                          A_level_or_equivalent_grade_2__c,
                                          A_level_or_equivalent_grade_3__c,
                                          A_level_or_equivalent_grade_4__c,
                                          A_level_or_equivalent_grade_5__c,
                                          A_level_or_equivalent_subject_1__r.name,
                                          A_level_or_equivalent_subject_2__r.name,
                                          A_level_or_equivalent_subject_3__r.name,
                                          A_level_or_equivalent_subject_4__r.name,
                                          A_level_or_equivalent_subject_5__r.name,
                                          Birth_Day__c,
                                          Birth_Month__c,
                                          Gender__c,
                                          Graduation_Year__c,
                                          Maths_A_level_Grade_or_equivalent__c,
                                          Maths_A_level_or_equivalent__c,
                                          Right_To_Work_In_UK__c,
                                          School_Type__c,
                                          Status__c,
                                          Twitter_Handle__c,
                                          Undergraduate_Degree_Grade__c,
                                          Undergraduate_Degree_Subject_1__r.name,
                                          Undergraduate_Degree_Subject_2__r.name,
                                          Undergraduate_Degree_Subject_3__r.name,
                                          Undergraduate_Degree_Subject_4__r.name,
                                          Undergraduate_Degree_Subject_5__r.name,
                                          University__c                     
                                          FROM Account 
                                          WHERE RecordTypeId = :PERSON_ACCOUNT_RECORD_TYPE_ID
                                          AND Id IN :updatedAccountIds];
        Map<Id, Account> result = new Map<Id, Account>();
        
        for (Account a : filteredAccounts) {
            result.put(a.Id, a);
        }
        
        return result;
    }
    
    private List<Contact> queryContactsToUpdate(Set<Id> accountIds) {
        return [SELECT Id,
                A_level_or_equivalent_grade_1__c,
                A_level_or_equivalent_grade_2__c,
                A_level_or_equivalent_grade_3__c,
                A_level_or_equivalent_grade_4__c,
                A_level_or_equivalent_grade_5__c,
                A_level_or_equivalent_subject_1__c,
                A_level_or_equivalent_subject_2__c,
                A_level_or_equivalent_subject_3__c,
                A_level_or_equivalent_subject_4__c,
                A_level_or_equivalent_subject_5__c,
                Birth_Day__c,
                Birth_Month__c,
                Gender__c,
                Graduation_Year__c,
                Maths_A_level_Grade_or_equivalent__c,
                Maths_A_level_or_equivalent__c,
                Right_To_Work_In_UK__c,
                School_Type__c,
                Status__c,
                Twitter_Handle__c,
                Undergraduate_Degree_Grade__c,
                Undergraduate_Degree_Subject_1__c,
                Undergraduate_Degree_Subject_2__c,
                Undergraduate_Degree_Subject_3__c,
                Undergraduate_Degree_Subject_4__c,
                Undergraduate_Degree_Subject_5__c,
                University__c,
                AccountId
                FROM Contact WHERE AccountId IN :accountIds];
    }
}