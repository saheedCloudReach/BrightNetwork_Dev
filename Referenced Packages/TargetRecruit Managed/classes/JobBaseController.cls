/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@isTest
global class JobBaseController {
    global String currentPage {
        get;
        set;
    }
    global System.PageReference currentPageReference {
        get;
        set;
    }
    global static String DEFAULT_ApplicationStatusPage;
    global static String DEFAULT_JobApplicationPage;
    global static String DEFAULT_JobDetailPage;
    global static String DEFAULT_JobListPage;
    global static String DEFAULT_JobPublishLayoutPage;
    global String layoutOverride1;
    global static String PAGE_ApplicationStatusPage;
    global static String PAGE_JobApplicationPage;
    global static String PAGE_JobDetailPage;
    global static String PAGE_JobListPage;
    global static String PAGE_JobPublishLayoutPage;
    global static String PAGE_PREFIX;
    global System.PageReference redirectToOverridePage {
        get;
        set;
    }
    global static List<AVTRRT__Config__c> siteSetupList;
    global static String URL_ApplicationStatusPage;
    global static String URL_JobApplicationPage;
    global static String URL_JobDetailPage;
    global static String URL_JobListPage;
    global static String URL_JobPublishLayoutPage;
    global JobBaseController() {

    }
    global System.PageReference getLayoutOverride() {
        return null;
    }
    global String getLayoutOverride1() {
        return null;
    }
    global static String getPage(String url) {
        return null;
    }
    global static String getPageOverrideOrDefault(String defaultPage, String pageOverride) {
        return null;
    }
    global static String getSiteSetup(String overridePageName) {
        return null;
    }
    global Boolean isPage(String pageName) {
        return null;
    }
    global System.PageReference redirectToOverride() {
        return null;
    }
    @isTest(SeeAllData=false OnInstall=false)
    global static void tstJobBaseController() {

    }
}
