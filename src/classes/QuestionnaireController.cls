/**
  * @author Rakesh R
  * @date 01/23/2015
  * @description Questionnaire controller;
*/
global class QuestionnaireController {
  
  global String jobId { get; set; }
  global String jobAppId { get; set; }
  global String url { get; set; }
  global List<String> jobIdsList { get; set; }
  global Integer currentJobIndex { get; set; }
  global Boolean disableNextButton { get; set; }
  global Boolean disablePreviousButton { get; set; }
  global Boolean displayThankYouMessageOnNewPage { get; set; }
  global Boolean displayQuestionnaireBlock { get; set; }
  global String jobTitle { get; set; }
  
  global void init() {
    
    try {
      List<AVTRRT__Job__c> jobList;
          displayQuestionnaireBlock = true;
          String jobIds = ApexPages.currentPage().getParameters().get('jobIds');
          
          if (jobIds != null) {
              jobIdsList = jobIds.split(';');
          }
          
      if(jobIdsList != null) {
        currentJobIndex = 1;
        if (jobIdsList.size() <= 1) {
          disableNextButton = true;          
        }
        disablePreviousButton = true;
        queUrl();
      }
    } catch(Exception e) {
      
    }
        
  }
  
 /*global void nextPage() {
    
    currentJobIndex += 1;
    
    if (currentJobIndex <= jobIdsList.size()) {
      if (currentJobIndex == jobIdsList.size()) {
        disableNextButton = true;
      }
      
      disablePreviousButton = false;
      queUrl();
      
    } else {
      
      disableNextButton = true;
      disablePreviousButton = false;
    }
  }
  
  global void previousPage() {
    
    currentJobIndex -= 1;
    
    if(currentJobIndex > 0) {
      if(currentJobIndex == 1) 
        disablePreviousButton = true;
      
      disableNextButton = false;
      queUrl();
    } else {
      
      disablePreviousButton = true;
      disableNextButton = false;
    }
    
  }*/
  
  private void queUrl() {
    
    List<AVTRRT__Job_Applicant__c> jobAppList = new List<AVTRRT__Job_Applicant__c>();
    AVTRRT__Job__c jobDetails = new AVTRRT__Job__c();
    
    jobDetails = [SELECT a.AVTRRT__Job_Title__c
               FROM AVTRRT__Job__c a
               WHERE a.id = :jobIdsList[currentJobIndex-1]]; 
    
    jobTitle = jobDetails.AVTRRT__Job_Title__c;
    
    jobAppList = [
                      SELECT LastModifiedDate, CreatedDate, AVTRRT__Questionnaire_URL__c
                      FROM AVTRRT__Job_Applicant__c
                      WHERE AVTRRT__Job__r.id =:jobIdsList[currentJobIndex-1]                    
                      Order by LastModifiedDate DESC];
          
        
        AVTRRT__ConfigSettingsHierarchy__c trHierarchy = AVTRRT__ConfigSettingsHierarchy__c.getOrgDefaults();
    
   // url = trHierarchy.AVTRRT__Survey_Public_Site_URL__c+'AVTRRT__Survey?id='+jobIdsList[currentJobIndex-1]+'&jaId='+jobAppList[0].Id;
    url = trHierarchy.AVTRRT__Survey_Public_Site_URL__c+'SurveyCustom?id='+jobIdsList[currentJobIndex-1]+'&jaId='+jobAppList[0].Id;
  }
  
  global void finish() {
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,TRGTFCMS.ConfigHelper.getConfigDataSet().TRGTFCMS__JonApplicantionPageApplicationMsg__c));
    displayQuestionnaireBlock = false;
    displayThankYouMessageOnNewPage = true;
  }
}