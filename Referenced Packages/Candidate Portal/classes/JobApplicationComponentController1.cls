/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class JobApplicationComponentController1 {
    global String accountName {
        get;
        set;
    }
    global Boolean appliedFor {
        get;
        set;
    }
    global Boolean applyButton {
        get;
        set;
    }
    global Boolean applyingFor {
        get;
        set;
    }
    global Attachment attachment;
    global String cmsCssCustom {
        get;
        set;
    }
    global String confirmPassword {
        get;
        set;
    }
    global Contact contact {
        get;
        set;
    }
    global Attachment coverLetterAttachment;
    global String currentUrlJobApplicationPage {
        get;
        set;
    }
    global Boolean displayThankYouMessageOnNewPage {
        get;
        set;
    }
    global Boolean errorMessage;
    global String excMsg {
        get;
        set;
    }
    global Boolean ForceComAutorization {
        get;
        set;
    }
    global Boolean isFileError;
    global AVTRRT__Job_Applicant__c jobApplicant {
        get;
        set;
    }
    global Integer jobApplyingForListSize {
        get;
        set;
    }
    global String jobIds {
        get;
        set;
    }
    global String jobSite {
        get;
        set;
    }
    global String linkedInApiKey {
        get;
        set;
    }
    global Boolean LinkedInButtonBlockIsShow {
        get;
        set;
    }
    global String linkedInJobIds {
        get;
        set;
    }
    global List<String> linkedinParamsList {
        get;
        set;
    }
    global String linkedInRedirectUrl {
        get;
        set;
    }
    global String metaKeywords {
        get;
        set;
    }
    global String newContactId {
        get;
        set;
    }
    global Boolean noJobSelected {
        get;
    }
    global String pageParam {
        get;
        set;
    }
    global String pageURL;
    global String password {
        get;
        set;
    }
    global Boolean paste;
    global String profile {
        get;
        set;
    }
    global Contact realContact;
    global String realContactId {
        get;
        set;
    }
    global Boolean reApplyMessage;
    global Boolean ReferencesBlockIsShow {
        get;
        set;
    }
    global List<AVTRRT__References__c> referencesLoginList {
        get;
        set;
    }
    global Boolean renderAjaxApplyButton {
        get;
        set;
    }
    global Boolean renderApplyButton {
        get;
        set;
    }
    global Boolean resumeRequirment;
    global Boolean resumeRequirmentforLabel {
        get;
        set;
    }
    global Attachment secondAttachment;
    global String selectLanguage {
        get;
        set;
    }
    global String sessionId {
        get;
        set;
    }
    global Boolean successMessage;
    global String successMSG;
    global Attachment thirdAttachment;
    global Boolean upload;
    global JobApplicationComponentController1() {

    }
    global System.PageReference applyNow() {
        return null;
    }
    global System.PageReference displayErrorMessage() {
        return null;
    }
    global System.PageReference displayExcMessage() {
        return null;
    }
    global Attachment getAttachment() {
        return null;
    }
    global String getAttachmentName() {
        return null;
    }
    global String getCmsCssCustom() {
        return null;
    }
    global Contact getContact() {
        return null;
    }
    global Contact getContactObject() {
        return null;
    }
    global Attachment getCoverLetterAttachment() {
        return null;
    }
    global Boolean getErrorMessage() {
        return null;
    }
    global Boolean getIsFileError() {
        return null;
    }
    global List<AVTRRT__Job__c> getJobAppliedForList() {
        return null;
    }
    global List<AVTRRT__Job__c> getJobApplyingForList() {
        return null;
    }
    global List<AVTRRT__Job__c> getJobList() {
        return null;
    }
    global String getMetaKeywords() {
        return null;
    }
    global Boolean getNoJobSelected() {
        return null;
    }
    global Integer getNumberOfJobs() {
        return null;
    }
    global String getPageURL() {
        return null;
    }
    global String getPassword() {
        return null;
    }
    global Boolean getPaste() {
        return null;
    }
    global Boolean getReApplyMessage() {
        return null;
    }
    global Boolean getResumeRequirement() {
        return null;
    }
    global Attachment getSecondAttachment() {
        return null;
    }
    global String getSuccessMSG() {
        return null;
    }
    global Boolean getSuccessMessage() {
        return null;
    }
    global Attachment getThirdAttachment() {
        return null;
    }
    global Boolean getUpload() {
        return null;
    }
    global void init() {

    }
    global void initialize() {

    }
    global System.PageReference passwordErrorMessage() {
        return null;
    }
    global System.PageReference reset() {
        return null;
    }
    global System.PageReference resumeErrorMessage() {
        return null;
    }
    global System.PageReference save() {
        return null;
    }
    global Map<String,String> saveContact() {
        return null;
    }
    @RemoteAction
    global static Map<String,String> saveNewContact(Contact contactObj, List<AVTRRT__References__c> referralList, TRGTFCMS.JobApplicationComponentController1.AdditionalParameters addlParam) {
        return null;
    }
    global void setAttachment(Attachment attachment) {

    }
    global void setAttachmentName(String attachmentName) {

    }
    global void setContact(Contact contact) {

    }
    global void setCoverLetterAttachment(Attachment attachment) {

    }
    global void setErrorMessage(Boolean errorMessage) {

    }
    global void setPassword(String password) {

    }
    global void setPaste(Boolean paste) {

    }
    global void setReApplyMessage(Boolean reApplyMessage) {

    }
    global void setSecondAttachment(Attachment attachment) {

    }
    global void setSuccessMessage(Boolean successMessage) {

    }
    global void setThirdAttachment(Attachment attachment) {

    }
    global void setUpload(Boolean upload) {

    }
    global static void tstJobApplication() {

    }
    global System.PageReference updateWithAttachment() {
        return null;
    }
global class AdditionalParameters {
    global String account {
        get;
        set;
    }
    global String confirmPassword {
        get;
        set;
    }
    global String jobIds {
        get;
        set;
    }
    global String jobSite {
        get;
        set;
    }
    global String page {
        get;
        set;
    }
    global String profile {
        get;
        set;
    }
    global String realContactId {
        get;
        set;
    }
    global AdditionalParameters() {

    }
}
}
