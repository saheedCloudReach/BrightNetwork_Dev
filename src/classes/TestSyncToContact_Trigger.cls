@isTest
public class TestSyncToContact_Trigger{
    static Id getSubjectId(String subjectName) {
        List<Subject__c> subjectList = [select Id from Subject__c where name = :subjectName];
        if(!subjectList.isEmpty()) {
            return subjectList.get(0).Id;
        }
        
        return null;
    }
    
    static Id addSector(String sector) {
        Sectors__c sec = new Sectors__c();
        sec.Name = sector;
        System.assert(Database.insert(sec).isSuccess());
        
        return sec.Id;
    }
    
    static void addSubject(String subjectName) {
        Subject__c subject = new Subject__c();
        subject.name = subjectName;
        System.assert(Database.insert(subject).isSuccess());
    }
    
    static void addSectorToAccount(Id accountId,Id sectorId) {
        Sector_Junction_Obj__c accountSector = new Sector_Junction_Obj__c();
        accountSector.Account__c = accountId;
        accountSector.Sectors__c = sectorId;
        System.assert(Database.insert(accountSector).isSuccess());
    }
    
    static testMethod void verifyInsertOrUpdate() {
		insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        //add all of the 9 sectors
        Id sector1 = addSector('Consumer & Retail');
     /*   Id sector2 = addSector('Professional Services');
        Id sector3 = addSector('Technology');
        Id sector4 = addSector('Charity & Public Sector');
        Id sector5 = addSector('Consulting');
        Id sector6 = addSector('Law');
        Id sector7 = addSector('Banking & Finance');
        Id sector8 = addSector('Entrepreneurship');
        Id sector9 = addSector('Marketing & Media');*/
        
 /*       String physicsName = 'Physics';        
        String spanishName = 'Spanish';
        addSubject(physicsName);
        addSubject(spanishName);
        Id spanishId = getSubjectId(spanishName);
        Id physicsId = getSubjectId(physicsName);
        
        /*test decoding*/
        //System.assertEquals(spanishName, , 'spanish Id is: '+spanishId+' spanish name is: '+spanishName);
        Account a = new Account();
        a.RecordTypeId = '012200000002ZtpAAE';
        a.A_level_or_equivalent_grade_1__c = 'A';
        a.A_level_or_equivalent_grade_2__c = 'B';
        a.A_level_or_equivalent_grade_3__c = 'C';
        a.A_level_or_equivalent_grade_4__c = 'D';
        a.A_level_or_equivalent_grade_5__c = 'F';
 //       a.A_level_or_equivalent_subject_1__c = physicsId;
 //       a.A_level_or_equivalent_subject_2__c = physicsId;
  //      a.A_level_or_equivalent_subject_3__c = physicsId;
  //      a.A_level_or_equivalent_subject_4__c = physicsId;
 //       a.A_level_or_equivalent_subject_5__c = physicsId;
        a.Birth_Day__c = '1';
        a.Birth_Month__c = '1';
        a.Gender__c = 'Male';
        a.Graduation_Year__c = '2006';
        //a.Hear_about_Advice__c = true;
        //a.Hear_about_Events__c = true;
        //a.Hear_about_Jobs__c = true;
        //a.Hear_about_Partner_Offers__c = true;
        a.Maths_A_level_Grade_or_equivalent__c = 'yes';
        a.Maths_A_level_or_equivalent__c = true;
        a.Right_To_Work_In_UK__c = true;
        a.School_Type__c = 'Private';
        a.Status__c = 'Pending';
        a.Twitter_Handle__c = '@test';
        a.Undergraduate_Degree_Grade__c = '1st';
  //      a.Undergraduate_Degree_Subject_1__c = physicsId;
 //      a.Undergraduate_Degree_Subject_2__c = physicsId;
  //      a.Undergraduate_Degree_Subject_3__c = physicsId;
 //       a.Undergraduate_Degree_Subject_4__c = physicsId;
 //       a.Undergraduate_Degree_Subject_5__c = physicsId;
        a.University__c = 'Aberystwyth University';
        a.LastName = 'Test';
        System.assert(Database.insert(a).isSuccess());
        
        //add the account to all of the sectors
        addSectorToAccount(a.Id, sector1);
      /*  addSectorToAccount(a.Id, sector2);
        addSectorToAccount(a.Id, sector3);
        addSectorToAccount(a.Id, sector4);
        addSectorToAccount(a.Id, sector5);
        addSectorToAccount(a.Id, sector6);
        addSectorToAccount(a.Id, sector7);
        addSectorToAccount(a.Id, sector8);
        addSectorToAccount(a.Id, sector9);*/
        
       /* Account a2 = new Account();
        a2.RecordTypeId = '012200000002ZtpAAE';        
        a2.LastName = 'Test 2';
        System.assert(Database.insert(a2).isSuccess());
        
        
        //check if all of the contacts have the correct value after insert.
        List<Contact> contactList = [select A_level_or_equivalent_grade_1__c,
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
                                            Hear_about_Advice__c,
                                            Hear_about_Events__c,
                                            Hear_about_Jobs__c,
                                            Hear_about_Partner_Offers__c,
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
                                     		Sector_Consumer_Retail__c,
                                            Sector_Professional_Services__c,
                                            Sector_Technology__c,
                                            Sector_Charity_Public_Sector__c,
                                            Sector_Consulting__c,
                                            Sector_Law__c,
                                            Sector_Banking_Finance__c,
                                            Sector_Entrepreneurship__c,
                                            Sector_Marketing_Media__c,
                                            University__c
                                     from Contact where AccountId = :a.Id];
        for(Contact c : contactList) {
            System.assertEquals('A', c.A_level_or_equivalent_grade_1__c);
            System.assertEquals('B', c.A_level_or_equivalent_grade_2__c);
            System.assertEquals('C', c.A_level_or_equivalent_grade_3__c);
            System.assertEquals('D', c.A_level_or_equivalent_grade_4__c);
            System.assertEquals('F', c.A_level_or_equivalent_grade_5__c);
            System.assertEquals(physicsName, c.A_level_or_equivalent_subject_1__c);
            System.assertEquals(physicsName, c.A_level_or_equivalent_subject_2__c);
            System.assertEquals(physicsName, c.A_level_or_equivalent_subject_3__c);
            System.assertEquals(physicsName, c.A_level_or_equivalent_subject_4__c);
            System.assertEquals(physicsName, c.A_level_or_equivalent_subject_5__c);
            System.assertEquals('1', c.Birth_Day__c);
            System.assertEquals('1', c.Birth_Month__c);
            System.assertEquals('Male', c.Gender__c);
            System.assertEquals(2006, c.Graduation_Year__c);
            System.assertEquals(true, c.Hear_about_Advice__c);
            System.assertEquals(true, c.Hear_about_Events__c);
            System.assertEquals(true, c.Hear_about_Jobs__c);
            System.assertEquals(true, c.Hear_about_Partner_Offers__c);
            System.assertEquals('yes', c.Maths_A_level_Grade_or_equivalent__c);
            System.assertEquals(true, c.Maths_A_level_or_equivalent__c);
            System.assertEquals(true, c.Right_To_Work_In_UK__c);
            System.assertEquals('Private', c.School_Type__c);
            System.assertEquals('Pending', c.Status__c);
            System.assertEquals('@test', c.Twitter_Handle__c);
            System.assertEquals('1st', c.Undergraduate_Degree_Grade__c);
            System.assertEquals(physicsName, c.Undergraduate_Degree_Subject_1__c);
            System.assertEquals(physicsName, c.Undergraduate_Degree_Subject_2__c);
            System.assertEquals(physicsName, c.Undergraduate_Degree_Subject_3__c);
            System.assertEquals(physicsName, c.Undergraduate_Degree_Subject_4__c);
            System.assertEquals(physicsName, c.Undergraduate_Degree_Subject_5__c);
            System.assertEquals('Aberystwyth University', c.University__c);
            System.assertEquals('Consumer & Retail', c.Sector_Consumer_Retail__c);
            System.assertEquals('Professional Services', c.Sector_Professional_Services__c);
            System.assertEquals('Technology', c.Sector_Technology__c);
           /* System.assertEquals('Charity & Public Sector', c.Sector_Charity_Public_Sector__c);
			System.assertEquals('Consulting', c.Sector_Consulting__c);
            System.assertEquals('Law', c.Sector_Law__c);
            System.assertEquals('Banking & Finance', c.Sector_Banking_Finance__c);
            System.assertEquals('Entrepreneurship', c.Sector_Entrepreneurship__c);
            System.assertEquals('Marketing & Media', c.Sector_Marketing_Media__c);
        }        */
        
        //delete all of the sectors
        List<Sector_Junction_Obj__c> sectorList = [select Id from Sector_Junction_Obj__c where Account__c = :a.id];
        Test.startTest();
       	 delete sectorList;
        Test.stopTest();
        /*for(Sector_Junction_Obj__c sec : sectorList) {
            System.assert(Database.delete(sec).isSuccess());
        }*/
        
		/*contactList = [select Sector_Consumer_Retail__c,
                                            Sector_Professional_Services__c,
                                            Sector_Technology__c,
                                            Sector_Charity_Public_Sector__c,
                                            Sector_Consulting__c,
                                            Sector_Law__c,
                                            Sector_Banking_Finance__c,
                                            Sector_Entrepreneurship__c,
                                            Sector_Marketing_Media__c
                                     from Contact where AccountId = :a.Id];
        for(Contact c : contactList) {
            System.assertEquals(null, c.Sector_Consumer_Retail__c);
            System.assertEquals(null, c.Sector_Professional_Services__c);
            System.assertEquals(null, c.Sector_Technology__c);
            System.assertEquals(null, c.Sector_Charity_Public_Sector__c);
            System.assertEquals(null, c.Sector_Consulting__c);
            System.assertEquals(null, c.Sector_Law__c);
            System.assertEquals(null, c.Sector_Banking_Finance__c);
            System.assertEquals(null, c.Sector_Entrepreneurship__c);
            System.assertEquals(null, c.Sector_Marketing_Media__c);
        }
        
        //now update the data
        a.A_level_or_equivalent_grade_1__c = 'B';
        a.A_level_or_equivalent_grade_2__c = 'A';
        a.A_level_or_equivalent_grade_3__c = 'C1';
        a.A_level_or_equivalent_grade_4__c = 'D1';
        a.A_level_or_equivalent_grade_5__c = 'F1';
        a.A_level_or_equivalent_subject_1__c = spanishId;
        a.A_level_or_equivalent_subject_2__c = spanishId;
        a.A_level_or_equivalent_subject_3__c = spanishId;
        a.A_level_or_equivalent_subject_4__c = spanishId;
        a.A_level_or_equivalent_subject_5__c = spanishId;
        a.Birth_Day__c = '2';
        a.Birth_Month__c = '2';
        a.Gender__c = 'Female';
        a.Graduation_Year__c = '2005';
        a.Hear_about_Advice__c = false;
        a.Hear_about_Events__c = false;
        a.Hear_about_Jobs__c = false;
        a.Hear_about_Partner_Offers__c = false;
        a.Maths_A_level_Grade_or_equivalent__c = 'no';
        a.Maths_A_level_or_equivalent__c = false;
        a.Right_To_Work_In_UK__c = false;
        a.School_Type__c = 'Grammar';
        a.Status__c = 'Pending';
        a.Twitter_Handle__c = '@test1';
        a.Undergraduate_Degree_Grade__c = '2.1';
        a.Undergraduate_Degree_Subject_1__c = spanishId;
        a.Undergraduate_Degree_Subject_2__c = spanishId;
        a.Undergraduate_Degree_Subject_3__c = spanishId;
        a.Undergraduate_Degree_Subject_4__c = spanishId;
        a.Undergraduate_Degree_Subject_5__c = spanishId;
        a.University__c = 'Anglia Ruskin University';
        Test.startTest();
        System.assert(Database.upsert(a).isSuccess());
        
        contactList = [select A_level_or_equivalent_grade_1__c,
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
                       Hear_about_Advice__c,
                       Hear_about_Events__c,
                       Hear_about_Jobs__c,
                       Hear_about_Partner_Offers__c,
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
                       University__c
                       from Contact where AccountId = :a.Id];
        for(Contact c : contactList) {
            System.assertEquals('B', c.A_level_or_equivalent_grade_1__c);
            System.assertEquals('A', c.A_level_or_equivalent_grade_2__c);
            System.assertEquals('C1', c.A_level_or_equivalent_grade_3__c);
            System.assertEquals('D1', c.A_level_or_equivalent_grade_4__c);
            System.assertEquals('F1', c.A_level_or_equivalent_grade_5__c);
            System.assertEquals(spanishName, c.A_level_or_equivalent_subject_1__c);
            System.assertEquals(spanishName, c.A_level_or_equivalent_subject_2__c);
            System.assertEquals(spanishName, c.A_level_or_equivalent_subject_3__c);
            System.assertEquals(spanishName, c.A_level_or_equivalent_subject_4__c);
            System.assertEquals(spanishName, c.A_level_or_equivalent_subject_5__c);
            System.assertEquals('2', c.Birth_Day__c);
            System.assertEquals('2', c.Birth_Month__c);
            System.assertEquals('Female', c.Gender__c);
            System.assertEquals(2005, c.Graduation_Year__c);
            System.assertEquals(false, c.Hear_about_Advice__c);
            System.assertEquals(false, c.Hear_about_Events__c);
            System.assertEquals(false, c.Hear_about_Jobs__c);
            System.assertEquals(false, c.Hear_about_Partner_Offers__c);
            System.assertEquals('no', c.Maths_A_level_Grade_or_equivalent__c);
            System.assertEquals(false, c.Maths_A_level_or_equivalent__c);
            System.assertEquals(false, c.Right_To_Work_In_UK__c);
            System.assertEquals('Grammar', c.School_Type__c);
            System.assertEquals('Pending', c.Status__c);
            System.assertEquals('@test1', c.Twitter_Handle__c);
            System.assertEquals('2.1', c.Undergraduate_Degree_Grade__c);
            System.assertEquals(spanishName, c.Undergraduate_Degree_Subject_1__c);
            System.assertEquals(spanishName, c.Undergraduate_Degree_Subject_2__c);
            System.assertEquals(spanishName, c.Undergraduate_Degree_Subject_3__c);
            System.assertEquals(spanishName, c.Undergraduate_Degree_Subject_4__c);
            System.assertEquals(spanishName, c.Undergraduate_Degree_Subject_5__c);
            System.assertEquals('Anglia Ruskin University', c.University__c);
        }
        Test.stopTest();*/

    } 
    static testMethod void testMassUpdateSectors() {
		insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);
        
        //add all of the 9 sectors

		List<Sectors__c> sectors = new List<Sectors__c>(); 
        Sectors__c sec = new Sectors__c();        
        sec.Name = 'Consumer & Retail';
        insert sec;
        sectors.add(sec);
        
        sec = new Sectors__c();        
        sec.Name = 'Professional Services';
        insert sec;
        sectors.add(sec);

        sec = new Sectors__c();        
        sec.Name = 'Technology';
        insert sec;
        sectors.add(sec);
        
        upsert sectors;
        
        Account a = new Account();
        a.RecordTypeId = '012200000002ZtpAAE';
        a.LastName = 'Test';
        upsert a;
        
        List<Sector_Junction_Obj__c> accountSectors = new List<Sector_Junction_Obj__c>();
        
        for (integer i = 0; i< 100; i++) {
            Sector_Junction_Obj__c accountSector1 = new Sector_Junction_Obj__c();
            accountSector1.Account__c = a.Id;
            accountSector1.Sectors__c = sectors.get(0).Id;
            accountSectors.add(accountSector1);
            
            Sector_Junction_Obj__c accountSector2 = new Sector_Junction_Obj__c();
            accountSector2.Account__c = a.Id;
            accountSector2.Sectors__c = sectors.get(1).Id;
            accountSectors.add(accountSector2);
            
            Sector_Junction_Obj__c accountSector3 = new Sector_Junction_Obj__c();
            accountSector3.Account__c = a.Id;
            accountSector3.Sectors__c = sectors.get(2).Id;
            accountSectors.add(accountSector3);
   		 }

        
        System.debug('Insert sectors!');
        insert accountSectors;
        System.debug('Insert finish!');
        
        Contact c = [SELECT Sector_Technology__c,Sector_Professional_Services__c FROM Contact WHERE AccountId = :a.id];
        
        System.assertEquals('Technology', c.Sector_Technology__c);
        System.assertEquals('Professional Services', c.Sector_Professional_Services__c);
        
    }
    
    public static testmethod void testMassUpdateMoveToContact() {
		insert new Trigger_Enabled__c(name = 'SyncToContact', isEnabled__c = true);

        //add all of the 9 sectors
        Id sector1 = addSector('Consumer & Retail');
        Id sector2 = addSector('Professional Services');
        Id sector3 = addSector('Technology');
        Id sector4 = addSector('Charity & Public Sector');
        Id sector5 = addSector('Consulting');
        Id sector6 = addSector('Law');
        Id sector7 = addSector('Banking & Finance');
        Id sector8 = addSector('Entrepreneurship');
        Id sector9 = addSector('Marketing & Media');
        
        String physicsName = 'Physics';        
        String spanishName = 'Spanish';
        addSubject(physicsName);
        addSubject(spanishName);
        Id spanishId = getSubjectId(spanishName);
        Id physicsId = getSubjectId(physicsName);
        
        /*test decoding*/
        //System.assertEquals(spanishName, SyncStateHolder.decodeSubject(spanishId), 'spanish Id is: '+spanishId+' spanish name is: '+spanishName);
        
        List<Account> accounts = new List<Account>();
        
        for (integer i = 0; i < 1; i++) {
            Account a = new Account();
            a.RecordTypeId = '012200000002ZtpAAE';
            a.A_level_or_equivalent_grade_1__c = 'A';
            a.A_level_or_equivalent_grade_2__c = 'B';
            a.A_level_or_equivalent_grade_3__c = 'C';
            a.A_level_or_equivalent_grade_4__c = 'D';
            a.A_level_or_equivalent_grade_5__c = 'F';
            a.A_level_or_equivalent_subject_1__c = physicsId;
            a.A_level_or_equivalent_subject_2__c = physicsId;
            a.A_level_or_equivalent_subject_3__c = physicsId;
            a.A_level_or_equivalent_subject_4__c = physicsId;
            a.A_level_or_equivalent_subject_5__c = physicsId;
            a.Birth_Day__c = '1';
            a.Birth_Month__c = '1';
            a.Gender__c = 'Male';
            a.Graduation_Year__c = '2006';
            //a.Hear_about_Advice__c = true;
            //a.Hear_about_Events__c = true;
            //a.Hear_about_Jobs__c = true;
            //a.Hear_about_Partner_Offers__c = true;
            a.Maths_A_level_Grade_or_equivalent__c = 'yes';
            a.Maths_A_level_or_equivalent__c = true;
            a.Right_To_Work_In_UK__c = true;
            a.School_Type__c = 'Private';
            a.Status__c = 'Pending';
            a.Twitter_Handle__c = '@test';
            a.Undergraduate_Degree_Grade__c = '1st';
            a.Undergraduate_Degree_Subject_1__c = physicsId;
            a.Undergraduate_Degree_Subject_2__c = physicsId;
            a.Undergraduate_Degree_Subject_3__c = physicsId;
            a.Undergraduate_Degree_Subject_4__c = physicsId;
            a.Undergraduate_Degree_Subject_5__c = physicsId;
            a.University__c = 'Aberystwyth University';
            a.LastName = 'Test' + i;
            a.Video_of_the_month__c = false;
            a.Women_Newsletter__c = false;
            accounts.add(a);
        }
        
        Test.startTest();
        upsert accounts;
        Test.stopTest();
    }

}