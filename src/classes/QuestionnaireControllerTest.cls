@isTest(seealldata = true)
private class QuestionnaireControllerTest {
    
    private static AVTRRT__Job__c job;
    private static Contact candidate;
    private static AVTRRT__Job__c job1;
    private static Account account;
    private static List<AVTRRT__Survey_Question__c> surveyQuestions;
    private static List<AVTRRT__Job_Applicant__c> jobApplicants;
    
    private static void initData() {
        
        
        /*TRGTFCMS__CustomSettingsComponent__c trgtCustomSettings = new TRGTFCMS__CustomSettingsComponent__c(
                Name ='Default',
                TRGTFCMS__Job_Application_Ajax_Apply_Button__c = false,
                TRGTFCMS__ShowReferencesBlock__c = true,
                TRGTFCMS__IsShowButtonLinkedIn__c= false,
                TRGTFCMS__Job_Application_Resume_Required__c = 'false',
                TRGTFCMS__UploadResumeError__c = 'test',
                TRGTFCMS__PasswordError__c = 'test1',
                TRGTFCMS__ConfirmPasswordError__c = 'test2',
                TRGTFCMS__Safe_Stage_Field_From_JobApplicant__c = false,
                TRGTFCMS__ETCObject_field_source_value_from_Site__c = 'test3',
                TRGTFCMS__Display_thank_you_message_on_new_page__c = false,
                TRGTFCMS__JonApplicantionPageApplicationMsg__c = 'test',
                TRGTFCMS__JobApplicationPageProfileMsg__c = 'testwww',
                TRGTFCMS__JobApplication_UpdateExtendProfile__c = 'false',
                Enable_Questionnaire__c = true
        );
        insert trgtCustomSettings;
        
        insert new AVTRRT__Config_Settings__c(
            Name = 'Default',
            AVTRRT__Trigger_Disabled_Trigger_JobApplicants__c = true
        );*/
        
        FCMS__Page__c newPage = new FCMS__Page__c(
                Name = 'CMSDefaultProfilePage',
                FCMS__Name__c = 'CMSDefaultProfilePages',
                FCMS__Active__c = true
        );
        insert newPage;
        
        account = new Account(Name = 'CMSDefaultProfileAccount');
        insert account;
        
        FCMS__CMSProfile__c cmsProfile = new FCMS__CMSProfile__c(
                Name = 'Candidate',
                FCMS__Name__c = 'Candidates',
                FCMS__Profile_Manager__c = UserInfo.getUserId(),
                FCMS__Default_Home_Page__c = newPage.Id,
                FCMS__Profile_Account__c = account.Id,
                FCMS__CMSCss__c = 'CMSCssCustom1',
                FCMS__Portal_Enabled__c = true,
                FCMS__User_Registration__c = true
        );
        insert cmsProfile;
        
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
        
        
        ApexPages.currentPage().getParameters().put('p', 'Candidate');
        ApexPages.currentPage().getParameters().put('jobSite', 'Default');
        ApexPages.currentPage().getParameters().put('page', 'QuestionairePage');
        
        jobApplicants = new List<AVTRRT__Job_Applicant__c> {
                new AVTRRT__Job_Applicant__c(
                        AVTRRT__Contact_Candidate__c = candidate.Id,
                        AVTRRT__Job__c = job.Id),
                new AVTRRT__Job_Applicant__c(
                        AVTRRT__Contact_Candidate__c = candidate.Id,
                        AVTRRT__Job__c = job1.Id)
        };
        insert jobApplicants;
        
        //ApexPages.currentPage().getParameters().put('jobAppIds', jobApplicants[0].Id+';'+jobApplicants[1].Id);
        ApexPages.currentPage().getParameters().put('jobIds', job.Id);
        
        surveyQuestions = new List<AVTRRT__Survey_Question__c>();
        /*createSurveyQuestion(job, 0, System.Label.AVTRRT__Multi_Select_Vertical, 'one\ntwo\nthree\n');
        createSurveyQuestion(job, 1, System.Label.AVTRRT__Single_Select_Vertical, 'one\ntwo\nthree\n');
        createSurveyQuestion(job, 2, System.Label.AVTRRT__Free_Text, 'one\ntwo\nthree\n');
        createSurveyQuestion(job, 3, System.Label.AVTRRT__Single_Select_Horizontal, 'one\ntwo\nthree\n');*/
        System.debug('survey Questions:'+surveyQuestions);
        surveyQuestions.add(new AVTRRT__Survey_Question__c(
        Name = 'Testing Question 0' ,
        AVTRRT__Job__c = job.Id,
        AVTRRT__Type__c = 'Multi Select Vertical',
        AVTRRT__Choices__c = 'one\ntwo\nthree\n',
        AVTRRT__Question__c = 'Testing Question question 0' ,
        AVTRRT__OrderNumber__c = 0,
        AVTRRT__Required__c = true));
        
        insert surveyQuestions;
        
        /*createSurveyQuestion(job, 0, 'Multi Select Vertical', 'one\ntwo\nthree\n');
        createSurveyQuestion(job, 1, 'Single Select Vertical', 'one\ntwo\nthree\n');
        createSurveyQuestion(job, 2, 'Free Text', 'one\ntwo\nthree\n');
        createSurveyQuestion(job, 3, 'Single Select Horizontal', 'one\ntwo\nthree\n');
        insert surveyQuestions;*/
        
        
        
        
    }
    
   
    
    static testMethod void testQuestionnaireController() {
        
        initData();
        
        Test.startTest();
        
        QuestionnaireController qc = new QuestionnaireController();
        
        qc.init();
       // qc.nextPage();
        //qc.previousPage();
        //qc.pageChanged();
        qc.finish();
        
    }

}