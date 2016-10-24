// TODO: Full refactoring is needed.

global class JobApplicationComponentController1 {

  
  global String selectLanguage { get; set; }
  global Contact contact {get; set;}
  global Contact realContact; //change private to global (Kans 8.2.11)

  global List<AVTRRT__References__c> referencesLoginList { get; set; }

  global Boolean noJobSelected { get { return jobList == null; } }
  global Boolean applyingFor { get { return jobApplyingForList.size() > 0; } set; }
  global Boolean appliedFor { get { return jobAppliedForList.size() > 0; } set; }

  global Boolean ForceComAutorization { get; set; }
  global Boolean displayThankYouMessageOnNewPage { get; set;}
  global String cmsCssCustom { get; set; }
  global String metaKeywords { get; set; }
  global String currentUrlJobApplicationPage {get; set;}

  global Boolean applyButton { get;set; }
  global String password { get; set; }
  global String confirmPassword { get; set; }

  global Boolean resumeRequirmentforLabel { get; set; }

  // Deprecated
  global List<String> linkedinParamsList { get; set;}

  global String linkedInApiKey { get; set;}
  global String linkedInRedirectUrl { get; set;}
  global String linkedInJobIds { get; set;}

  global Boolean ReferencesBlockIsShow { get; set; }// added by Kans (8.2.2011)
  global Boolean LinkedInButtonBlockIsShow { get; set; }

  public String page { get; set; }
  public List<AVTRRT__References__c> referencesNoLoginList { get; set; }
  public Contact contactApplyFromVendorProfile { get; set; }
  public List<String> EmailDBNoLoginList { get; set; }
  public List<String> EmailPageNoLoginList { get; set; }

  //added by Rakesh
  global String jobIds { get; set; }
  global String jobSite { get; set; }
  global String pageParam { get; set; }
  global String profile { get; set; }
  global String accountName { get; set; }
  global String sessionId { get; set; }

  global String realContactId {get; set;}
  global String newContactId { get; set; }
  global String excMsg { get; set; }
  global Integer jobApplyingForListSize { get; set; }
  global Boolean renderApplyButton { get; set; }
  global Boolean renderAjaxApplyButton { get; set; }

  private List<FCMS__CMSProfile__c> ForceComAutorizationList { get; set; }

    global String getPassword() {
    return password;
  }

  global void setPassword(String password) {
    this.password=password;
  }

  global AVTRRT__Job_Applicant__c jobApplicant {get; set;}
  global Contact getContactObject() { return null; }
  global String getCmsCssCustom() { return null; }

  global String getSuccessMSG() { return null; }
  global String getAttachmentName() { return null; }
  global String getPageURL() { return null; }
  global PageReference reset() { return null; }
  global void setAttachmentName(String attachmentName) { }
  global PageReference applyNow() { return null; }
  global String getMetaKeywords() { return null; }
  global static  void tstJobApplication() { }

  global List<AVTRRT__Job__c> getJobApplyingForList() {
    return jobApplyingForList;
  }

  global List<AVTRRT__Job__c> getJobAppliedForList() {
    return jobAppliedForList;
  }

  // JobList contains the total number of Jobs has to be displayed on the page or candidate applied for
  global List<AVTRRT__Job__c> getJobList() {
    return jobList;
  }
  // Contact object instance is used to show fields on the page choosed by client. below are the get and set methods for it
  global Contact getContact() {
    return this.contact;
  }

  global void setContact(Contact contact) {
    this.contact = contact;
  }

  // Standard Attachment object is initiated or used to get resumes as file of some proper formates. below the get and set methods of it.
  global Attachment getAttachment() {
    attachment = new Attachment();
    return attachment;
  }

  global void setAttachment(Attachment attachment) {
    this.attachment = attachment;
  }

  global Attachment getSecondAttachment() {
    secondAttachment = new Attachment();
    return secondAttachment;
  }

  global void setSecondAttachment(Attachment attachment) {
    this.secondAttachment = attachment;
  }

  global Attachment getThirdAttachment() {
    thirdAttachment = new Attachment();
    return thirdAttachment;
  }

  global void setThirdAttachment(Attachment attachment) {
    this.thirdAttachment = attachment;
  }

  global Attachment getCoverLetterAttachment() {
    coverLetterAttachment = new Attachment();
    return coverLetterAttachment;
  }

  global void setCoverLetterAttachment(Attachment attachment) {
    this.coverLetterAttachment = attachment;
  }

  // To show total number of jobs
  global Integer getNumberOfJobs() { return jobList.size(); }
  // Below are some getter and setter methods of Boolean type used to show and hide some elements or fields on the page according the flow
  global Boolean getSuccessMessage() {
    return successMessage;
  }

  global void setSuccessMessage(Boolean successMessage) {
    this.successMessage = successMessage;
  }

  global Boolean getReApplyMessage() {
    return reApplyMessage;
  }

  global void setReApplyMessage(Boolean reApplyMessage) {
    this.reApplyMessage = reApplyMessage;
  }

  global Boolean getErrorMessage() {
    return errorMessage;
  }

  global void setErrorMessage(Boolean errorMessage) {
    this.errorMessage = errorMessage;
  }

  global Boolean getNoJobSelected() {
    return noJobSelected;
  }

  global Boolean getPaste() {
    return paste;
  }

  global void setPaste(Boolean paste) {
    this.paste = paste;
  }

  global Boolean getUpload() {
    return upload;
  }

  global void setUpload(Boolean upload) {
    this.upload = upload;
  }

  global Boolean getIsFileError() {
    if (isFileError == true) { attachment.body = null; }
    return isFileError;
  }

/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description contact use insted Real Contact;
*/

  global String pageURL;
  global transient Boolean paste = false;
  global transient Boolean upload = true;
  global transient Boolean successMessage = false;
  global transient Boolean reApplyMessage = false;
  global transient Boolean errorMessage = false;
  global transient Boolean isFileError = false;

  global transient String successMSG;
  global transient Boolean resumeRequirment=false;
  
  /**
  * @author Rakesh
  * @date 23/02/2015
  * @description: Added boolean variable to ensure duplicate email is not getting updated.
  * @case:00037580
  */
  global Boolean duplicateContact = false;


  /* Edited by Aliaksandr Satskou, 06/23/2014 (case #00028360) */
  transient global Attachment attachment;
  transient global Attachment secondAttachment;
  transient global Attachment thirdAttachment;
  transient global Attachment coverLetterAttachment;

  public Boolean isAjaxCall = false;
  public Boolean displayNextButton { get; set; }
  public Integer quesCount { get; set; }

  private List<AVTRRT__Job__c> jobList;
  private List<AVTRRT__Job_Applicant__c> jobApplicationList;
  private List<AVTRRT__Job__c> jobAppliedForList = new List<AVTRRT__Job__c>();
  private List<AVTRRT__Job__c> jobApplyingForList = new List<AVTRRT__Job__c>();

  private String subject = 'JobApplicationPage';

  global JobApplicationComponentController1() {

    referencesLoginList = new List<AVTRRT__References__c>();
    referencesNoLoginList = new List<AVTRRT__References__c>();
    ForceComAutorizationList = new List<FCMS__CMSProfile__c>();

    EmailDBNoLoginList = new List<String>();
    EmailPageNoLoginList = new List<String>();

    selectLanguage = UserInfo.getLocale();

  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Modified;
  */
  global void init() {


    jobIds = ApexPages.currentPage().getParameters().get('jobIds');
    jobSite = ApexPages.currentPage().getParameters().get('jobSite');
    profile = ApexPages.currentPage().getParameters().get('p');
    pageParam = ApexPages.currentPage().getParameters().get('page');
    accountName = ApexPages.currentPage().getParameters().get('accountName');
    sessionId = ApexPages.currentPage().getParameters().get('sessionId');

    initialize();

  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Initializing the values;
  */
  global void initialize(){

    displayNextButton = false;
    if (TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Job_Application_Ajax_Apply_Button__c) {

      renderAjaxApplyButton = true;
      renderApplyButton = false;
    }
    else {
      renderAjaxApplyButton = false;
      renderApplyButton = true;
    }

    ReferencesBlockIsShow = TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__ShowReferencesBlock__c;// added by Kans (8.2.11)
    displayThankYouMessageOnNewPage =  false;
    try {

      if (!isAjaxCall) {
        // Gets css styles
        cmsCssCustom = FCMS.CMSHelper.getCSSStyles();
      }
/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description
*/
      contact = new Contact();
      contactApplyFromVendorProfile = new Contact();

      ForceComAutorizationList = [
                SELECT FCMS__Force_com_Authorization_and_Registration__c
                FROM FCMS__CMSProfile__c
                WHERE Name = :profile];

      System.debug ('0.01 =============================== ForceComAutorizationList' +
          ForceComAutorizationList );
      if (ForceComAutorizationList.size() > 0) {
        ForceComAutorization =
          ForceComAutorizationList[0].FCMS__Force_com_Authorization_and_Registration__c;
      }
      System.debug ('0.02 =============================== ForceComAutorization' + ForceComAutorization);
      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', '');

      jobApplicant = new AVTRRT__Job_Applicant__c();
      realContact = FCMS.CMSHelper.getLoggedInContact();
/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description not make copy current candidate if use Vendor profile for Page.
*/
    if (profile != null && profile != '') {
        if(!profile.contains('Vendor Profile'))
          contact = realContact.clone(false, false);
      }
      System.debug('0.1 =============================== realContact.Id' + realContact.Id );

      ///////// Begin of Reference Part
      //Select References by RealContact.ID(if Contact allready Exist)
      if (realContact.Id != null) {

        realContactId = realContact.Id;

        referencesLoginList = [
                SELECT AVTRRT__First_Name__c, AVTRRT__Last_Name__c,
                  TRGTFCMS__Organization_Institution__c, AVTRRT__Phone__c, AVTRRT__Notes__c,
                  AVTRRT__Email__c, AVTRRT__Candidate__c
                FROM AVTRRT__References__c
                WHERE AVTRRT__Candidate__c = :realContact.Id];

        System.debug('0.2 =============================== ReferencesLoginList' + ReferencesLoginList);

        //If Logged Contact have no Referenses
        if (referencesLoginList != null ) {
          if (!(profile.contains('Vendor Profile'))) {
            if (referencesLoginList.size() < 3) {
              for (Integer i = referencesLoginList.size(); i < 3; i++) {
                referencesLoginList.add(new AVTRRT__References__c());
  
                System.debug('0.21 =============================== ReferencesLoginList' +
                  ReferencesLoginList );
  
                referencesLoginList[i].AVTRRT__First_Name__c = '';
                referencesLoginList[i].AVTRRT__Last_Name__c = '';
                referencesLoginList[i].TRGTFCMS__Organization_Institution__c= '';
                referencesLoginList[i].AVTRRT__Phone__c = '';
                referencesLoginList[i].AVTRRT__Notes__c = '';
                referencesLoginList[i].AVTRRT__Email__c = '';
              }
            }
            System.debug('0.22 =============================== ReferencesLoginList' +
                ReferencesLoginList);
          } else {
            for (Integer i = 0; i <=2 ; i++)
            {
              referencesLoginList.add(new AVTRRT__References__c());
    
              System.debug('0.4 =============================== ReferencesLoginList' +
                  ReferencesLoginList);
    
              referencesLoginList[i].AVTRRT__First_Name__c = '';
              referencesLoginList[i].AVTRRT__Last_Name__c = '';
              referencesLoginList[i].TRGTFCMS__Organization_Institution__c= '';
              referencesLoginList[i].AVTRRT__Phone__c = '';
              referencesLoginList[i].AVTRRT__Notes__c = '';
              referencesLoginList[i].AVTRRT__Email__c = '';
            }
            
          }
          
        }

      }
      //Contact is no Logged
      else {

        realContactId = '0';

        System.debug('0.3 =============================== ReferencesLoginList' + ReferencesLoginList);

        for (Integer i = 0; i <=2 ; i++)
        {
          referencesLoginList.add(new AVTRRT__References__c());

          System.debug('0.4 =============================== ReferencesLoginList' +
              ReferencesLoginList);

          referencesLoginList[i].AVTRRT__First_Name__c = '';
          referencesLoginList[i].AVTRRT__Last_Name__c = '';
          referencesLoginList[i].TRGTFCMS__Organization_Institution__c = '';
          referencesLoginList[i].AVTRRT__Phone__c = '';
          referencesLoginList[i].AVTRRT__Notes__c = '';
          referencesLoginList[i].AVTRRT__Email__c = '';
        }
        System.debug('0.5 =============================== ReferencesLoginList' + ReferencesLoginList);
      }
      //////////// End of Reference Part

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'cmsCssCustom');


      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'jobIds= ' + jobIds);
      
      if (jobIds != 'null' && jobIds != null && jobIds != '') {
        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'if jobIds != null');

        jobList = [
            SELECT a.AVTRRT__Job_Title__c,a.Name, a.AVTRRT__Job_Industry__c,
              a.AVTRRT__Job_Contact_Name__c, a.AVTRRT__Job_Contact_Email__c,
              a.AVTRRT__Job_City__c, a.AVTRRT__Job_Category__c,
              a.AVTRRT__EEO_Job_Category__c, a.AVTRRT__Country_Locale__c,
              a.AVTRRT__AutoPopulated_Skills__c, a.AVTRRT__Account_Job_Name__c
            FROM AVTRRT__Job__c a
            WHERE a.id IN :jobIds.split(';')];

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'jobList' + jobList);
        
        quesCount = [
                SELECT count()
                FROM AVTRRT__Survey_Question__c
                WHERE AVTRRT__Job__c IN :jobIds.split(';')];
      
          System.debug('Question count:'+quesCount);
          if (quesCount > 0) 
              displayNextButton = true;
          else 
              displayNextButton = false;

      }
      
       
      
/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description not show linkidIn button if use Vendor profile
*/

        if (!profile.contains('Vendor Profile')) {
          LinkedInButtonBlockIsShow = TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__IsShowButtonLinkedIn__c;

          FCMS__CustomSettingsComponent__c cs =
              FCMS__CustomSettingsComponent__c.getInstance('Default');

          if (cs.FCMS__LinkedIn_Client_Id__c != null
              && LinkedInButtonBlockIsShow == true) {

            linkedInApiKey = cs.FCMS__LinkedIn_Client_Id__c;
            linkedInRedirectUrl = cs.FCMS__LinkedIn_Redirect_Uri__c;

            linkedInJobIds = '';

            if (jobList != null) {
              for (AVTRRT__Job__c job : jobList) {
                linkedInJobIds += ';' + job.Id;
              }
            }
            linkedInJobIds = linkedInJobIds != '' ? linkedInJobIds.substring(1) : '';

          }
        }
      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'jobList= ' + jobList);
      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'before GetListsOfJobs()');

      GetListsOfJobs();

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'after GetListsOfJobs()');

      if (!ApexPages.hasMessages(ApexPages.Severity.ERROR)) {

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init',
            '!ApexPages.hasMessages(ApexPages.Severity.ERROR');

        // Gets meta keywords
        if (jobList != null && jobList.size() > 0) {
          FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init',
            'jobList != null && jobList.size() > 0');

          for (AVTRRT__Job__c job : jobList) {
            List<String> jobIndustryList = new List<String>();

            if (job.AVTRRT__Job_Industry__c != null) {
              jobIndustryList = job.AVTRRT__Job_Industry__c.split('=');
            }
            else { jobIndustryList.add(''); }

            metaKeywords = metaKeywords + ',' + job.AVTRRT__Job_Title__c;
            metaKeywords = metaKeywords + ',' + job.AVTRRT__Job_Contact_Name__c;

            if (job.AVTRRT__AutoPopulated_Skills__c != null &&
                job.AVTRRT__AutoPopulated_Skills__c.length() > 0) {
              metaKeywords = metaKeywords + ',' +
                  job.AVTRRT__AutoPopulated_Skills__c.replace(';', ',');
            }

            metaKeywords = metaKeywords + ',' + job.AVTRRT__Job_Contact_Email__c;
            metaKeywords = metaKeywords + ',' + job.AVTRRT__Job_City__c;
            metaKeywords = metaKeywords + ',' + job.AVTRRT__Country_Locale__c;
            metaKeywords = metaKeywords + ',' + job.AVTRRT__Account_Job_Name__c;

            if (jobIndustryList.size() > 0) {
              metaKeywords = metaKeywords + ',' + jobIndustryList[0];
            }
          }
          metaKeywords = metaKeywords.replace('null', '');
        }

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'after if');

        currentUrlJobApplicationPage = ApexPages.currentPage().getUrl();

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init',
            'currentUrlJobApplicationPage' + currentUrlJobApplicationPage);

        Integer index = currentUrlJobApplicationPage.indexOf('?');

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'index' + index);

        currentUrlJobApplicationPage = currentUrlJobApplicationPage.substring(index);

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init',
            'currentUrlJobApplicationPage' + currentUrlJobApplicationPage);

        System.debug('1 =============================== TRGTFCMS.ConfigHelper.getConfigDataSet().' +
            'TRGTFCMS__Job_Application_Resume_Required__c' +
            TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Job_Application_Resume_Required__c );

        resumeRequirmentforLabel = Boolean.valueOf(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Job_Application_Resume_Required__c);

        System.debug('2 =============================== resumeRequirmentforLabel' +
            resumeRequirmentforLabel);

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init',
            'resumeRequirmentforLabel' + resumeRequirmentforLabel);
      }
    }
    catch(Exception e) {
      if (Test.isRunningTest()) {
        throw e;
      }
      FCMS.Logger.catchBlockMethod(e, subject);
    }
  }

  global Boolean getResumeRequirement() {
    return realContact.AVTRRT__Resume__c != null;
  }




  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Visual force remote action method;
  */
  @RemoteAction
  global static Map<String,String> saveNewContact (Contact contactObj, List <AVTRRT__References__c> referralList, AdditionalParameters addlParam) {

    JobApplicationComponentController1 jc = new JobApplicationComponentController1();
    jc.jobIds = addlParam.jobIds;
    jc.jobSite = addlParam.jobSite;
    jc.profile = addlParam.profile;
    jc.pageParam = addlParam.page;
    jc.accountName = addlParam.account;
    jc.confirmPassword = addlParam.confirmPassword;
    jc.isAjaxCall = true;
    jc.contact = contactObj;
    jc.ReferencesLoginList = referralList;
    
    if (addlParam.realContactId == null || addlParam.realContactId == '' || addlParam.realContactId == '0') {
      
      jc.realContact = new Contact();

    }
    else {
      
      jc.realContact =  Database.query(
                  ' SELECT ' + FCMS.ContactFieldsUtil.getAllFieldsString() + //' Name ' +
                  ' FROM Contact WHERE Id=\'' + (Id)addlParam.realContactId + '\'');

    }
    System.debug('realContact:'+ jc.realContact);

    jc.jobApplicant = new AVTRRT__Job_Applicant__c();

    if (jc.jobIds != 'null' && jc.jobIds != null && jc.jobIds != '') {
        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'if jobIds != null');

        jc.jobList = [
            SELECT a.AVTRRT__Job_Title__c,a.Name, a.AVTRRT__Job_Industry__c,
              a.AVTRRT__Job_Contact_Name__c, a.AVTRRT__Job_Contact_Email__c,
              a.AVTRRT__Job_City__c, a.AVTRRT__Job_Category__c,
              a.AVTRRT__EEO_Job_Category__c, a.AVTRRT__Country_Locale__c,
              a.AVTRRT__AutoPopulated_Skills__c, a.AVTRRT__Account_Job_Name__c
            FROM AVTRRT__Job__c a
            WHERE a.id IN :jc.jobIds.split(';')];

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'init', 'jobList' + jc.jobList);

      }
    jc.GetListsOfJobs();

    Map<String,String> contactDetails = jc.saveContact();
    
    return contactDetails;

  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Modified save method;
  */
  global PageReference save() {
    
    try {
      
      displayValidationMessages();
      
      if (!ApexPages.hasMessages(ApexPages.Severity.Error)) {
        Map<string,string> contactDetails = saveContact();
            
        /**
        * @author Rakesh
        * @date 23/02/2015
        * @description: Added If condition to ensure error message is shown if an existing user email is getting upated
        * @case:00037580
        */
        if(duplicateContact != true) {
          if (contactDetails.get('contactId') != null) {
            jobApplyingForListSize = Integer.valueOf( contactDetails.get('jobApplyingListSize'));
      
            PageReference pg = updateWithAttachment();
      
            return pg;
          }
        } else {
          
          //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.label.user_already_exists));
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, System.label.user_already_exists));
        }
      }
    }
    catch (Exception e) {
      System.debug('caught Exception :'+e);
      if (Test.isRunningTest()) {
        throw e;
      }

      if (e instanceOf System.DmlException && e.getDmlStatusCode(0) ==
          'FIELD_CUSTOM_VALIDATION_EXCEPTION') {
        System.debug('!!!!!!!!!valueException=' +  e.getDmlStatusCode(0) );


      }
      else {
        
        FCMS.Logger.catchBlockMethod(e, subject);
      }
    }
    return null;

  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description creating a contact without attachment;
  */
  global Map<string,string> saveContact() {


    Map<string, string> returnValues = new Map<string,string>();
    Contact newContact = new Contact();
    try {

      
      Boolean validEmail = Pattern.matches('^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+' +
          '([a-zA-Z0-9]{2,4})+$', contact.Email);

      if (!validEmail) {
        FCMS.Logger.addErrorMessage(System.Label.TRGTFCMS.Invalid_Email);
      }

      String encryptedFirstName = String.escapeSingleQuotes(contact.FirstName);
      String encryptedLastName = String.escapeSingleQuotes(contact.LastName);

      if (!isAjaxCall) {


        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
            'attachment=' + attachment);

        System.debug('3 ============= checkValidAttachment(attachment)' +
            checkValidAttachment(attachment));
        System.debug('4 ============= realContact.Id' +  realContact.Id );

        System.debug('5 ============= TRGTFCMS.ConfigHelper.getConfigDataSet().Job_Application_' +
            'Resume_Required__c' +
            TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Job_Application_Resume_Required__c);

        System.debug('6 ============= contact.AVTRRT__Resume__c' + contact.AVTRRT__Resume__c);

        if (!checkValidAttachment(attachment)            
            && TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Job_Application_Resume_Required__c == 'true'
            && contact.AVTRRT__Resume__c == null) {

          System.debug('7========================= in error upload');
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__UploadResumeError__c));
          FCMS.Logger.addErrorMessage(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__UploadResumeError__c);
        }

        checkValidAttachment(secondAttachment);
        checkValidAttachment(thirdAttachment);
        checkValidAttachment(coverLetterAttachment);
        FCMS.Logger.addMessage('JobApplicationComponentController1', 'save',
          'contact.FCMS__Password__c=' + contact.FCMS__Password__c);
        FCMS.Logger.addMessage('JobApplicationComponentController1', 'save',
            'confirmPassword=' + confirmPassword);

        System.debug('Password:'+contact.FCMS__Password__c);

        if (password != null && password != '' && password.length() < 8) {
          FCMS.Logger.addErrorMessage(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__PasswordError__c);
        }

        if (password != null && password != ''){
          if (!password.equals(confirmPassword)) {
          
            FCMS.Logger.addErrorMessage(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__ConfirmPasswordError__c);
          }
        }

      }

      if (!ApexPages.hasMessages(ApexPages.Severity.Error)) {
        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save', 'no errors');



/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description not use record type of current user if that Vendor profile
*/
        // TODO: What is the purpose of this code? Why not use realContact?
        if ((realContact.Id != null) && (!profile.contains('Vendor Profile'))){
          Contact reSelectRealContact = [
                        SELECT RecordTypeId
                        FROM Contact
                        WHERE Id = :realContact.Id
                        LIMIT 1];
          contact.RecordTypeId = reSelectRealContact.RecordTypeId;

          System.debug(LoggingLevel.ERROR, '::::::::contact.RecordTypeId=' + contact.RecordTypeId);
        }
        else {
          contact.RecordTypeId = AVTRRT.RecordTypeUtil.getCandidateRecordTypeIdList()[0];
        }

        List<Account> accountList = [
            SELECT id
            FROM Account
            WHERE Name = :accountName
            LIMIT 1];

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
            'accountList=' + accountList);

        if (accountList.size() > 0) {
          contact.AccountId = accountList[0].id;
        } // withour resume can apply account name should take Candidate pool--added by venkat

        else {

          if (!isAjaxCall) {

            if (attachment.Name == null && attachment.Body == null) {

              List<Account> accountListPool = [
                    SELECT id
                    FROM Account
                    WHERE Name = :'Candidate Pool' LIMIT 1];

              if (accountListPool.size() > 0)
                  contact.AccountId = accountListPool[0].Id;
            }
          }
        }

/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description not make update all field contact from Visual force page.if use vendor profile.
*/
        if (!profile.contains('Vendor Profile'))
          FCMS.ContactFieldsUtil.updateRecords(contact, realContact);

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
            'updateRecords realContact=' + realContact);

        if (password != null && password != '') {
          realContact.FCMS__Password__c = password;
        }

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
            'realContact.FCMS__Password__c=' + realContact.FCMS__Password__c);

        List<Contact> realContactList = new List<Contact>();

/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description changed check Duplicate detection rules if Vendor create new candidate or update
*/

        if  (profile.contains('Vendor Profile')) {
          realContactList.add(contact);
          System.debug('!!!!!!!!!!!!!!!!yestest');
        } else {
          realContactList.add(realContact);
        }
        Map<Id, Contact> oldContactsMap = null;
        
        System.debug('Real contact list:'+realContactList);

        List<AVTRRT.CheckCandidatesForDuplicates.WrapperClass> wrapperList =
            AVTRRT.CheckCandidatesForDuplicates.getListOfDuplicatesCandidates(
                realContactList, oldContactsMap, true);
                
        System.debug('wrapper List Size:'+wrapperList.size()+'wrapperList:'+wrapperList);

        ////////Begin of Reference Part
        System.debug('7.001 ============================ ReferencesLoginList' + ReferencesLoginList);

        //Remove empty records from  RefList ??????????????
        for (integer j = ReferencesLoginList.size() - 1; j > -1; j--) {
          System.debug('7.002 ========= j' +' '+ j + ' ' +
              'ReferencesLoginList' + ' ' + ReferencesLoginList);
          if ((ReferencesLoginList[j].AVTRRT__Email__c == '' ||
                  ReferencesLoginList[j].AVTRRT__Email__c == null) &&
                (ReferencesLoginList[j].AVTRRT__First_Name__c == '' ||
                  ReferencesLoginList[j].AVTRRT__First_Name__c == null) &&
                (ReferencesLoginList[j].AVTRRT__Last_Name__c == '' ||
                  ReferencesLoginList[j].AVTRRT__Last_Name__c == null) &&
                (ReferencesLoginList[j].TRGTFCMS__Organization_Institution__c == '' ||
                  ReferencesLoginList[j].TRGTFCMS__Organization_Institution__c == null) &&
                (ReferencesLoginList[j].AVTRRT__Phone__c == '' ||
                  ReferencesLoginList[j].AVTRRT__Phone__c == null) &&
                (ReferencesLoginList[j].AVTRRT__Notes__c == '' ||
                  ReferencesLoginList[j].AVTRRT__Notes__c == null)) {

            ReferencesLoginList.remove(j);
          }
        }
        System.debug('7.003 =========================== ReferencesLoginList' + ReferencesLoginList);

        //Contact exist in DB
        if (wrapperList.size() == 0) {
          
          duplicateContact = false;
          System.debug('7.01 ======================= ReferencesNoLoginList' + ReferencesLoginList);
/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description . if Vendor create new candidate from his team
*/
          if (profile.contains('Vendor Profile')){
            contact.TRGTFCMS__Vendor_Contact__c = realContact.Id;
            contact.TRGTFCMS__Vendor__c = realContact.AccountId;
            FCMS.ContactFieldsUtil.updateRecords(contact, contactApplyFromVendorProfile);
            contactApplyFromVendorProfile.TRGTFCMS__Vendor_Contact__c = realContact.Id;
            contactApplyFromVendorProfile.TRGTFCMS__Vendor__c = realContact.AccountId;
            System.debug('!!!!!!!!!!!!!!!!!!!!!!!!go to insert'+ contactApplyFromVendorProfile);
            upsert contactApplyFromVendorProfile;

            //added by Rakesh
            newContactId = contactApplyFromVendorProfile.Id;

          }else{
            upsert realContact;

            //added by Rakesh
            newContactId = realContact.Id;
          }

        }
        //Contact is not Exist in DB
        else {
          String fields = FCMS.ContactFieldsUtil.getAllFieldsString();
          
          /**
          * @author Rakesh
          * @date 23/02/2015
          * @description: If the email is updated with existing user, 
            verifying weather the duplicate detection code fetches the current candidate Id or not
          * @case:00037580
          */
          
          //modified
          if (!profile.contains('Vendor Profile') || (pageParam.contains('Update Profile') && profile.contains('Vendor Profile'))) {
            
            if(realContact.Id != wrapperList[0].matchId) {
              duplicateContact = true;
              //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.label.user_already_exists));
              
              return returnValues;
              
            } else {
              System.debug('else:');
              duplicateContact = false;
              realContact = Database.query(
                    ' SELECT ' + fields +
                    ' FROM Contact ' +
                    ' WHERE id = \''+ wrapperList[0].matchId + '\'' +
                    ' LIMIT 1');
  
              FCMS.ContactFieldsUtil.updateRecords(contact, realContact);
              update realContact;
            }

            //added by Rakesh
            newContactId = realContact.Id;
          }
/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description if vendor update candidate from his team
*/
          else {

            contactApplyFromVendorProfile = Database.query(
                  ' SELECT ' + fields +
                  ' FROM Contact ' +
                  ' WHERE id = \''+ wrapperList[0].matchId + '\'' +
                  ' LIMIT 1');

            FCMS.ContactFieldsUtil.updateRecords(contact, contactApplyFromVendorProfile);
            System.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!go to update');
            contactApplyFromVendorProfile.TRGTFCMS__Vendor_Contact__c = realContact.Id;
            contactApplyFromVendorProfile.TRGTFCMS__Vendor__c = realContact.AccountId;
            update contactApplyFromVendorProfile;


            newContactId = contactApplyFromVendorProfile.Id;

          }


        }

        insertReferences();

        if (!ApexPages.hasMessages(ApexPages.Severity.Error)) {

          //If there are jobs on the page then have to create records in Applicant if applicant record exist then update it simplly

          FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save', 'GetListsOfJobs');

          GetListsOfJobs();

          System.debug('job Applying list:'+jobApplyingForList.size());
          List<Schema.SObjectField> mapValuesList =
            Schema.SObjectType.AVTRRT__Job_Applicant__c.fields.getMap().values();
          List<AVTRRT__Job_Applicant__c> newJobApplicantList = new List<AVTRRT__Job_Applicant__c>();


          for (AVTRRT__Job__c job : jobApplyingForList) {
            AVTRRT__Job_Applicant__c newJobApplication = new AVTRRT__Job_Applicant__c();
            newJobApplication.AVTRRT__Job__c = job.Id;
            newJobApplication.AVTRRT__Job_Title__c = job.AVTRRT__Job_Title__c;
/**
* @author Sergey Prishepo
* @date 02/04/2013
* @description  Change create job Applicant if Vendor create contact record or update from his team
*/
            if (!profile.contains('Vendor Profile')) {
              newJobApplication.AVTRRT__Contact_Candidate__c = realContact.Id;
            } else {
              newJobApplication.AVTRRT__Contact_Candidate__c = contactApplyFromVendorProfile.Id;
            }
            newJobApplication.AVTRRT__Type__c = System.Label.TRGTFCMS.Online;
            newJobApplication.AVTRRT__Stage__c = System.Label.TRGTFCMS.New_Application;

            for (Schema.SObjectField mapValue : mapValuesList) {
              if (jobApplicant.get(mapValue) != null) {
                newJobApplication.put(mapValue, jobApplicant.get(mapValue));
              }
            }

            newJobApplicantList.add(newJobApplication);
          }

          System.debug('NewjobApplicationList:'+newJobApplicantList);

          insert newJobApplicantList;

          FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
              'newJobApplicantList=' + newJobApplicantList);


            for (AVTRRT__Job_Applicant__c jobApp : jobApplicationList) {

              if (TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Safe_Stage_Field_From_JobApplicant__c == false) {
                jobApp.AVTRRT__Stage__c = System.Label.TRGTFCMS.Reapplied_By_Candidate;
              }

              for (Schema.SObjectField mapValue : mapValuesList) {
                if (jobApplicant.get(mapValue) != null) {
                  jobApp.put(mapValue, jobApplicant.get(mapValue));
                }
              }
            }

            update jobApplicationList;
            System.debug('jobApplicationList:'+jobApplicationList);

          FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
              'newJobApplicantList=' + newJobApplicantList);

          FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
              'jobApplicationList=' + jobApplicationList);


        }
      }
    }
    catch (Exception e) {
      System.debug('caught Exception :'+e);
      if (Test.isRunningTest()) {
        throw e;
      }

      if (e instanceOf System.DmlException && e.getDmlStatusCode(0) ==
          'FIELD_CUSTOM_VALIDATION_EXCEPTION') {
        System.debug('!!!!!!!!!valueException=' +  e.getDmlStatusCode(0) );


      }
      else if (e instanceOf System.Dmlexception && e.getDmlStatusCode (0) == 'DUPLICATE_VALUE') {
          
          ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, e.getDmlMessage(0));
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, e.getDmlMessage(0)));
      }
      else {
        
        FCMS.Logger.catchBlockMethod(e, subject);
      }
    }



    returnValues.put('contactId',newContactId);
    returnValues.put('jobApplyingListSize', String.valueOf(jobApplyingForList.size()));
    
    return returnValues;
  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Attachment after creating a contact;
  */
  global PageReference updateWithAttachment() {

    try {

      //If user has select file to upload then has to attach it with contact and ETC Object records as attachment
      if (attachment != null && attachment.Name != null && attachment.Body != null) {

        //added by Rakesh
        Contact newContact = [SELECT LastName FROM Contact WHERE Id =: newContactId LIMIT 1];

        FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
                  'if attachment.Body != null');

        AVTRRT__ETCObject__c eTCObject = new AVTRRT__ETCObject__c();

        eTCObject.AVTRRT__Name__c = newContact.LastName + '- Resume';

        /**
        * @author Sergey Prishepo
        * @date 02/04/2013
        * @description Change create ETCobject if Vendor create contact record or update candidate from his team.
        */
        //Modified by Rakesh

        eTCObject.AVTRRT__Candidate__c = newContact.Id;

        eTCObject.AVTRRT__Status__c = 'New';

        if (TRGTFCMS.ConfigHelper.getConfigDataSet().
            TRGTFCMS__ETCObject_field_source_value_from_Site__c != null) {
          eTCObject.AVTRRT__Source__c =
          TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__ETCObject_field_source_value_from_Site__c;
        } else {
          eTCObject.AVTRRT__Source__c = System.Label.TRGTFCMS.Candidate_Portal;
        }
        insert eTCObject;

        Attachment eTCObjectAttachment = new Attachment(
          Name = attachment.Name,
          Body = attachment.Body,
          ParentId = eTCObject.Id
        );
        insert eTCObjectAttachment;

        attachment.Body = null;
      }

      /**
      * @author Sergey Prishepo
      * @date 02/04/2013
      * @description Change create Attacment if Vendor create contact record or update candidate from his team
      */
      
      attach(secondAttachment, newContactId);
      attach(thirdAttachment, newContactId);
      attach(coverLetterAttachment, newContactId);
      
      PageReference pg;
      /**
      * @author Rakesh Rangu
      * @date 03/25/2015
      * @description Enable questionnaire only if custom setting is enabled and profile doesn't contains vendor profile and jobIds not null
      */
      
      
      
     System.debug ('question count:'+quesCount);
      
      if (TRGTFCMS.ConfigHelper.getConfigDataSet().Enable_Questionnaire__c && !profile.contains('Vendor Profile') && quesCount > 0 ) {
        
        pg = questionnaireRedirect();
        pg.setRedirect(true);          
      }
      else {
        
        pg = displayMessage();
      }
      
      return pg;
    }
    catch (Exception e) {
      if (Test.isRunningTest()) {
        throw e;
      }
      return null;
    }


  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Display Validation Message;
  */
  global PageReference displayErrorMessage() {
    
    try {
      Boolean validEmail = Pattern.matches('^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+' +
            '([a-zA-Z0-9]{2,4})+$', contact.Email);

      if (!validEmail) {
        FCMS.Logger.addErrorMessage('Invalid Email');
      }

      insert contact;


    } catch (Exception e) {
      if (!Test.isRunningTest()) {
        throw e;
      }

      if (e instanceOf System.DmlException && e.getDmlStatusCode(0) ==
          'FIELD_CUSTOM_VALIDATION_EXCEPTION') {
        ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, e.getDmlMessage(0));
        
      }
      else {
        FCMS.Logger.catchBlockMethod(e, subject);
      }

    }
    return null;

  }
  
  /**
  * @author Rakesh R
  * @date 02/23/2015
  * @description Display Duplicate user error message;
  */
  global PageReference duplicateErrorMessage() { 
    
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.label.user_already_exists));
    return null;
  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Display validation Message for Resume;
  */
  global PageReference resumeErrorMessage() {
    //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Resume is Required'));
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Resume is Required'));
    return null;
  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Displays Exception message caught while Ajax call;
  */
  global PageReference displayExcMessage() {
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, excMsg));
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, excMsg));
    return null;
  }

  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Displays Password Error message caught while Ajax call;
  */
  global PageReference passwordErrorMessage() {

    if (password != null && password != '' && password.length() < 8) {
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__PasswordError__c));
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__PasswordError__c));
    }

    if (password != null && password != ''){
      if (!password.equals(confirmPassword)) {
        FCMS.Logger.addErrorMessage(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__ConfirmPasswordError__c);
      }
    }

    return null;
  }
  
  global void displayValidationMessages() {
    
    FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
    'attachment=' + attachment);

    System.debug('3 ============= checkValidAttachment(attachment)' +
    checkValidAttachment(attachment));
    System.debug('4 ============= realContact.Id' +  realContact.Id );

    System.debug('5 ============= TRGTFCMS.ConfigHelper.getConfigDataSet().Job_Application_' +
    'Resume_Required__c' +
    TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Job_Application_Resume_Required__c);

    System.debug('6 ============= contact.AVTRRT__Resume__c' + contact.AVTRRT__Resume__c);

    if (!checkValidAttachment(attachment)
        //&& realContact.Id == null
        && TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Job_Application_Resume_Required__c == 'true'
        && contact.AVTRRT__Resume__c == null) {

      System.debug('7========================= in error upload');
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__UploadResumeError__c));
      FCMS.Logger.addErrorMessage(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__UploadResumeError__c);
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__UploadResumeError__c));
      
    }

    checkValidAttachment(secondAttachment);
    checkValidAttachment(thirdAttachment);
    checkValidAttachment(coverLetterAttachment);
    FCMS.Logger.addMessage('JobApplicationComponentController1', 'save',
      'contact.FCMS__Password__c=' + contact.FCMS__Password__c);
    FCMS.Logger.addMessage('JobApplicationComponentController1', 'save',
        'confirmPassword=' + confirmPassword);

    System.debug('Password:'+contact.FCMS__Password__c);
    if (password != null && password != '' && password.length() < 8) {
      FCMS.Logger.addErrorMessage(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__PasswordError__c);
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__PasswordError__c));
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__PasswordError__c));
    }

    if (password != null && password != ''){
      if (!password.equals(confirmPassword)) {
        FCMS.Logger.addErrorMessage(TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__ConfirmPasswordError__c);
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__ConfirmPasswordError__c));
      }
    }
    
  }

  // Gets lists of applied and not applied jobs
  private void GetListsOfJobs() {
    FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs', 'GetListsOfJobs');

    jobAppliedForList = new List<AVTRRT__Job__c>();
    jobApplyingForList = new List<AVTRRT__Job__c>();
    jobApplicationList = new List<AVTRRT__Job_Applicant__c>();

    if (jobList != null && jobList.size() > 0) {

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
          'if jobList != null; jobList=' + jobList);


      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
          'jobSite=' + jobSite);

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
          'realContact.Id=' + realContact.Id);

      jobApplicationList = realContact.Id != null
          ? [
            SELECT LastModifiedDate, CreatedDate, AVTRRT__Stage__c, AVTRRT__Job__r.Id,
              AVTRRT__Job__r.AVTRRT__Job_Title__c, AVTRRT__Job__r.Name,
              AVTRRT__Job__c, AVTRRT__Contact_Candidate__r.Id, AVTRRT__Contact_Candidate__c
            FROM AVTRRT__Job_Applicant__c
            WHERE AVTRRT__Job__r.AVTRRT__Job_Publish_Site__c INCLUDES (:jobSite)
            AND AVTRRT__Contact_Candidate__r.Id = :realContact.Id
            AND AVTRRT__Job__r.id in :jobList]
          : new List<AVTRRT__Job_Applicant__c>();

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
          'jobList=' + jobList);

      System.debug(':::::::::::jobList=' + jobList);

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
          'jobAppList=' + jobApplicationList);

      System.debug(':::::::::::jobAppList=' + jobApplicationList);

      Map<Id, AVTRRT__Job_Applicant__c> jobApplicationMap = new Map<Id, AVTRRT__Job_Applicant__c>();

      for (AVTRRT__Job_Applicant__c jobApplicant : jobApplicationList) {
        jobApplicationMap.put(jobApplicant.AVTRRT__Job__r.id, jobApplicant);
      }

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
          'jobAppList=' + jobApplicationList);

      for (AVTRRT__Job__c job : jobList) {
        if (jobApplicationMap.get(job.id) != null) {
          jobAppliedForList.add(job);
          FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
              'jobAppliedForList=' + jobAppliedForList);

          System.debug(':::::::::::jobAppliedForList=' + jobAppliedForList);
        } else {
          jobApplyingForList.add(job);
          FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
              'jobApplyingForList=' + jobApplyingForList);

          System.debug(':::::::::::jobApplyingForList=' + jobApplyingForList);
        }
      }

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs',
          'jobAppList=' + jobApplicationList);
    } else {

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs', 'else');

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs', 'page' + pageParam);

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'GetListsOfJobs', 'jobId' + jobIds);
      if (pageParam != null && pageParam != ''){
        if (!pageParam.Equals(System.Label.TRGTFCMS.Update_Profile) && jobIds != null) {
          if(!isAjaxCall){
            //FCMS.Logger.addErrorMessage(System.Label.Selected_job_has_not_been_found);
          }
        }
      }
    }
  }


  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Display a message after successfully creating contact with attachment;
  */
  private pageReference displayMessage() {


    displayThankYouMessageOnNewPage =  TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__Display_thank_you_message_on_new_page__c;

    if (!profile.contains('Vendor Profile')) {

      //Checking the existence of "job applicant" for the user
      //changed by Rakesh
      System.debug('jobApplyingForListSize:'+jobApplyingForListSize);
      System.debug('Job Ids:'+jobIds);
      //String successMessage = jobApplyingForListSize > 0  || jobIds != null
      String successMessage = jobIds == null || jobIds == ''
      //This message "Thank you for application. We will contact you shortly if we find you to be a good fit for the position."
      ? TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JonApplicantionPageApplicationMsg__c
      : (jobApplyingForListSize > 0 ? TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JonApplicantionPageApplicationMsg__c
      //This message "Your profile has been updated"
      //updated by Rakesh
        : (pageParam == System.Label.TRGTFCMS.Update_Profile ?
          TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JobApplicationPageProfileMsg__c :
          TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JobApplication_UpdateExtendProfile__c));

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'save',
            'successMessage=' + successMessage);

      if (pageParam == System.Label.TRGTFCMS.Update_Profile) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,
            TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JobApplication_UpdateExistingProfile__c));
      }
      else {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, successMessage));
      }
    }else{

      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Thank you for submitting candidates. We will contact you shortly if we find this candidates to be a good fit for the position.'));

    }

    return null;
  }
  
  /**
  * @author Rakesh R
  * @date 01/23/2015
  * @description Redirecting to a questionnaire page;
  */
  private pageReference questionnaireRedirect() {
    
    Pagereference pageRef = new PageReference('/Questionnaire');
    pageRef.getParameters().put('sessionId', ApexPages.currentPage().getParameters().get('sessionId')); 
    pageRef.getParameters().put('page', 'QuestionairePage'); 
    pageRef.getParameters().put('jobSite', ApexPages.currentPage().getParameters().get('jobSite')); 
    pageRef.getParameters().put('jobIds', ApexPages.currentPage().getParameters().get('jobIds')); 
    pageRef.getParameters().put('p', ApexPages.currentPage().getParameters().get('p')); 
    
    return pageRef ; 
  }

  /**
  * @author Rakesh R
  * @date 08/20/2014
  * @description Insert References;
  */
  private void insertReferences() {
    for (integer i = 0; i < ReferencesLoginList.size(); i++) {
      if (ReferencesLoginList[i].AVTRRT__Candidate__c == null) {
        ReferencesLoginList[i].AVTRRT__Candidate__c = realContact.Id;
      }
    }

    upsert ReferencesLoginList;

    //add empty values to the form
    Integer ListAdd = 3 - ReferencesLoginList.size();
    for (integer i = 0; i < ListAdd; i++) {
      ReferencesLoginList.add(new AVTRRT__References__c());
    }
  }





  private Boolean checkValidAttachment(Attachment attachment)
  {
    if (attachment != null && attachment.Name != null && attachment.Body != null) {

      Integer pos = attachment.Name.lastIndexOf('.');
      String extention = attachment.Name.substring(pos+1).toLowerCase();
      
      String initialDocName = attachment.Name.substring(0,4);
      
      

      FCMS.Logger.addMessage('JobApplicationComponentControllerNew', 'isValidAttachment',
          'extention=' + extention);

      if (extention != 'pdf' && extention != 'doc' && extention != 'txt' && extention != 'docx' &&
          extention != 'rtf' && extention != 'html') {
            
        //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JobApplicationPageFileFormatError__c));
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JobApplicationPageFileFormatError__c));
        
        FCMS.Logger.addErrorMessage(
            TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JobApplicationPageFileFormatError__c);
      }
      return true;
    }

    return false;
  }

  private void attach(Attachment attachment, Id contactId) {
    if(attachment != null && attachment.Name != null && attachment.Body != null) {
      attachment.ParentId = contactId;
      insert attachment;
      
      attachment.Body = null;
    }
  }

    


  /**
  * @author Rakesh R
  * @date 08/13/2014
  * @description Inner class for fetching additional parameter from Ajax call;
  */
  global class AdditionalParameters {
    global String jobIds { get; set; }
    global String jobSite { get; set; }
    global String page { get; set; }
    global String profile { get; set; }
    global String account { get; set; }
    global String confirmPassword { get; set; }
    global String realContactId { get; set; }
  }
}