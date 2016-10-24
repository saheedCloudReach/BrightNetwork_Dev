@isTest(SeeAllData=True)
private class JobApplicationComponentController1Test {

    private static AVTRRT__Job__c job;
    private static Contact candidate;
    private static AVTRRT__Job__c job1;
    private static Account account;
    private static List<AVTRRT__Survey_Question__c> surveyQuestions;
    
    private static void initData(Boolean isNewCandidate) {
    
      AVTRRT__Config__c duplicateDetectionRule = new AVTRRT__Config__c(
          AVTRRT__Name__c = 'Duplicates Detection Rule',
          AVTRRT__Value__c = 'LastName = \'{!LastName}\'');
        insert duplicateDetectionRule;
    
    /*TRGTFCMS__CustomSettingsComponent__c trgtCustomSettings = new TRGTFCMS__CustomSettingsComponent__c(
                Name ='Default',
                Job_Application_Ajax_Apply_Button__c = false,
                ShowReferencesBlock__c = true,
                IsShowButtonLinkedIn__c= true,
                Job_Application_Resume_Required__c = 'false',
                UploadResumeError__c = 'test',
                PasswordError__c = 'test1',
                ConfirmPasswordError__c = 'test2',
                Safe_Stage_Field_From_JobApplicant__c = false,
                ETCObject_field_source_value_from_Site__c = 'test3',
                Display_thank_you_message_on_new_page__c = false,
                JonApplicantionPageApplicationMsg__c = 'test',
                JobApplicationPageProfileMsg__c = 'testwww',
                JobApplication_UpdateExtendProfile__c = 'false',
                Enable_Questionnaire__c = true
        );
        insert trgtCustomSettings;
        
    FCMS__CustomSettingsComponent__c linkedInSetting = new FCMS__CustomSettingsComponent__c(
          Name = 'Default',
          FCMS__LinkedIn_Redirect_Uri__c = 'https://fcms-developer-edition.ap1.force.com/',
          FCMS__LinkedIn_Client_Id__c = '75n4vp24esl36t' ,
          FCMS__LinkedIn_Client_Secret__c = 'IRh8mNKxg8RmMwDf',
          FCMS__ErrorsReceiver__c = 'rakesh.r@targetrecruit.net',
          FCMS__SessionTimeout__c = 60
     );
    insert linkedInSetting;*/
    
    FCMS__Page__c newPage = new FCMS__Page__c(
                Name = 'CMSDefaultProfilePage',
                FCMS__Name__c = 'CMSDefaultProfilePagess',
                FCMS__Active__c = true
        );
        insert newPage;
        
      //  FCMS__Page__c newPage = [SELECT Id FROM FCMS__Page__c WHERE Name = 'CMSDefaultProfilePage'];
        
        account = new Account(Name = 'CMSDefaultProfileAccount');
        insert account;
        
         FCMS__CMSProfile__c cmsProfile = new FCMS__CMSProfile__c(
                Name = 'Candidate',
                FCMS__Name__c = 'Candidatess',
                FCMS__Profile_Manager__c = UserInfo.getUserId(),
                FCMS__Default_Home_Page__c = newPage.Id,
                FCMS__Profile_Account__c = account.Id,
                FCMS__CMSCss__c = 'CMSCssCustom1',
                FCMS__Portal_Enabled__c = true,
                FCMS__User_Registration__c = true
        );
        insert cmsProfile;
        
        

      
        
      //  FCMS__CMSProfile__c cmsProfile = [SELECT Id FROM FCMS__CMSProfile__c WHERE Name = 'Candidate'];
        
        /*CustomSettingsComponent__c customSettings = new CustomSettingsComponent__c(
                Name ='Default',
                ShowReferencesBlock__c = false,
                Job_Application_Resume_Required__c = 'true' );
        insert customSettings;*/
        
        /*insert new FCMS__CustomSettingsComponent__c(
                Name = 'Default',
                FCMS__SessionTimeout__c = 60,
                FCMS__ErrorsReceiver__c = 'email@email.com');*/
        
        job = new AVTRRT__Job__c(
            AVTRRT__Job_Title__c = 'Test',
            AVTRRT__Start_Date__c = Date.today()
        );
        insert job;
        
        job1 = new AVTRRT__Job__c(
            AVTRRT__Job_Title__c = 'Test',
            AVTRRT__Start_Date__c = Date.today()
        );
        insert job1;

        PageReference pageRef = new PageReference('apex/JobApplicationPage?/');
        Test.setCurrentPageReference(pageRef);

        candidate = new Contact(
            LastName = 'Test123',
            FirstName = 'Test123',
            Email = 'test123@test.com',
            Phone = '111111',
            FCMS__CMSProfile__c = cmsProfile.Id,
            AVTRRT__Source__c = 'Blog',
            RecordTypeId = AVTRRT.RecordTypeUtil.getCandidateRecordTypeIdList()[0]
        );
        insert candidate;
        
        Contact refCont = new Contact(
            LastName = 'test1',
            FirstName = 'test2',
            Email = 'test2@test.com',
            FCMS__CMSProfile__c = cmsProfile.Id,
            AVTRRT__Source__c = 'Blog',
            AVTRRT__Phone__c = '999999999',
            RecordTypeId = AVTRRT.RecordTypeUtil.getCandidateRecordTypeIdList()[0]
        );
        insert refCont;

        if (!isNewCandidate) {
            String sessionId = '62486944141904';
            Map<String,String> headerMap = System.currentPageReference().getHeaders();

            FCMS__Session__c session = new FCMS__Session__c(
                FCMS__Is_Valid__c = true,
                FCMS__IP_Address__c = headerMap.get('X-Salesforce-SIP'),
                FCMS__Session_For__c = candidate.Id,
                FCMS__User_Agent__c = headerMap.get('User-Agent'),
                FCMS__SessionId__c = sessionId
            );
            insert session;

            ApexPages.currentPage().getParameters().put('sessionId', sessionId);
            Cookie cookie = new Cookie(ApexPages.currentPage().getParameters().get('sessionId'), ApexPages.currentPage().getParameters().get('sessionId'), null, -1, false);
            ApexPages.currentPage().setCookies(new Cookie[]{cookie});
      

        }
        
        ApexPages.currentPage().getParameters().put('jobIds', job.Id+';'+job1.Id);
        ApexPages.currentPage().getParameters().put('p', 'Candidate');
        ApexPages.currentPage().getParameters().put('jobSite', 'Default');
    }

    static testMethod void testJobApplicationComponentController1_newCandidate() {

        initData(true);
        
         //References
        List<AVTRRT__References__c> referenceList = new List<AVTRRT__References__c>();
        AVTRRT__References__c reference = new AVTRRT__References__c();
        reference.AVTRRT__First_Name__c = 'test';
        reference.AVTRRT__Last_Name__c = 'test';
        reference.AVTRRT__Email__c = 'test@test.com';
        reference.AVTRRT__Phone__c = '999999999';
        reference.AVTRRT__Notes__c = 'test';
        referenceList.add(reference);
        
        
        surveyQuestions = new List<AVTRRT__Survey_Question__c>();
        
        System.debug('survey Questions:'+surveyQuestions);
        surveyQuestions.add(new AVTRRT__Survey_Question__c(
        Name = 'Testing Question 0' ,
        AVTRRT__Job__c = job.Id,
        AVTRRT__Type__c = 'Multi Select Vertical',
        AVTRRT__Choices__c = 'one\ntwo\nthree\n',
        AVTRRT__Question__c = 'Testing Question question 0' ,
        AVTRRT__OrderNumber__c = 0,
        AVTRRT__Required__c = true));
        
        surveyQuestions.add(new AVTRRT__Survey_Question__c(
        Name = 'Testing Question 1' ,
        AVTRRT__Job__c = job1.Id,
        AVTRRT__Type__c = 'Multi Select Vertical',
        AVTRRT__Choices__c = 'one\ntwo\nthree\n',
        AVTRRT__Question__c = 'Testing Question question 1' ,
        AVTRRT__OrderNumber__c = 1,
        AVTRRT__Required__c = true));
        
        insert surveyQuestions;
        
        Test.startTest();

        JobApplicationComponentController1 con1 = new JobApplicationComponentController1();
        con1.init();

        con1.referencesLoginList = referenceList;
        con1.referencesNoLoginList = referenceList;
        System.assertEquals(0, con1.getJobAppliedForList().size());
        System.assertEquals(job.Id, con1.getJobApplyingForList()[0].Id);

        con1.setPassword('TTThelloTT');
        con1.confirmPassword = 'TTThelloTT';

        Attachment attachment2 = con1.getAttachment();
        attachment2.name = 'Resume.doc';
        attachment2.Body = Blob.valueof('myString');
        attachment2.parentId = candidate.id;
        con1.setAttachmentName('resume.pdf');
        con1.setAttachment(attachment2);

        con1.getCmsCssCustom();
        con1.getSuccessMSG();
        con1.getAttachmentName();
        con1.getPageURL();
        
        
        con1.getJobList();
        
        con1.setContact(candidate);
        Contact cont = con1.getContact();
        cont = con1.getContactObject();
        //con1.setErrorMessage(false);
        con1.getErrorMessage();
        con1.setReApplyMessage(false);
        con1.getReApplyMessage();
        con1.setSuccessMessage(false);
        con1.getSuccessMessage();
        con1.getNumberOfJobs();
        con1.setPaste(false);
        con1.getPaste();
        con1.setUpload(true);
        con1.getUpload();
        con1.getNoJobSelected();
        con1.getIsFileError();
        con1.LinkedInButtonBlockIsShow = true;
        
        //con1.getJobIDsWithQuestionnaire();
        
        con1.save();
        
        
         
        List<AVTRRT__Job_Applicant__c> jobApplicationList = [SELECT Id FROM AVTRRT__Job_Applicant__c];
        System.debug('!!!!!!!!!!!!!!jobApplicationList=' + jobApplicationList.size());
        delete jobApplicationList;
        con1.reset();

        JobApplicationComponentController1 con = new JobApplicationComponentController1();
        con.init();
        con.setPassword('ThelloTT');
        con.getPassword();
        con.confirmPassword = 'ThelloT';
        String str = con.confirmPassword;
        
        

        Attachment attachment1 = con.getAttachment();
        attachment1.name = 'Resume.doc';
        attachment1.Body = Blob.valueof('myString');
        attachment1.parentId = candidate.id;
        con.setAttachmentName('ddd.doc');
        con.setAttachment(attachment1);

        attachment1 = con.getSecondAttachment();
        con.setSecondAttachment(attachment1);
        attachment1 = con.getThirdAttachment();
        con.setThirdAttachment(attachment1);
        attachment1 = con.getCoverLetterAttachment();
        con.setCoverLetterAttachment(attachment1);
        con.getResumeRequirement();
        
        con.newContactId = candidate.Id;
        //con.updateWithAttachment();
        con.resumeErrorMessage();
        con.displayErrorMessage();
        //con.displayExcMessage();
        con.passwordErrorMessage();
        
        JobApplicationComponentController1.AdditionalParameters addlParam = new JobApplicationComponentController1.AdditionalParameters();
        addlParam.account = '';
        addlParam.confirmPassword = 'test';
        addlParam.jobIds = job.Id;
        addlParam.jobSite = 'Default';
        addlParam.profile = 'Candidate';
        addlParam.page = 'JobApplicationPage';
        addlParam.realContactId = null;
        JobApplicationComponentController1.saveNewContact(candidate, new List<AVTRRT__References__c>(), addlParam);
        
        

        Test.stopTest();
    }
    
    static testMethod void testJobApplicationComponentController1_updateCandidate() {

        initData(false);
        ApexPages.currentPage().getParameters().put('jobIds', job.Id+';'+job1.Id);
        //added by Rakesh
        FCMS__CMSProfile__c cmsProfile = [SELECT Id FROM FCMS__CMSProfile__c WHERE Name = 'Candidate' LIMIT 1];
        Contact newCandidate = new Contact(
            LastName = 'Test123',
            FirstName = 'Test123',
            Email = 'test123@test.com',
            Phone = '111111',
            FCMS__CMSProfile__c = cmsProfile.Id,
            AVTRRT__Source__c = 'Blog',
            RecordTypeId = AVTRRT.RecordTypeUtil.getCandidateRecordTypeIdList()[0]
        );

        Test.startTest();

        Attachment attach = new Attachment(
            Name = 'Resume.doc',
            Body = Blob.valueof('myString'),
            parentId = candidate.id
        );
        insert attach;

        JobApplicationComponentController1 con1 = new JobApplicationComponentController1();
        con1.init();
        con1.setPassword('TTThelloTT');
        con1.confirmPassword = 'TTThelloTT';
        con1.setContact(newCandidate);
       
        Attachment attachment1 = con1.getAttachment();
        attachment1.name = 'Resume.doc';
        attachment1.Body = Blob.valueof('myString');
        attachment1.parentId = candidate.id;
        con1.setAttachmentName('ddd.doc');
        con1.setAttachment(attachment1);

        attachment1 = con1.getSecondAttachment();
        con1.setSecondAttachment(attachment1);
        attachment1 = con1.getThirdAttachment();
        con1.setThirdAttachment(attachment1);
        attachment1 = con1.getCoverLetterAttachment();
        con1.setCoverLetterAttachment(attachment1);
        
        con1.getResumeRequirement();
         
        con1.save();
        List<AVTRRT__Job_Applicant__c> jobApplicationList = [SELECT Id FROM AVTRRT__Job_Applicant__c];
        System.debug('!!!!!!!!!!!!!!jobApplicationList=' + jobApplicationList.size());
        delete jobApplicationList;
        
       
        
        Test.stopTest();
    }
}