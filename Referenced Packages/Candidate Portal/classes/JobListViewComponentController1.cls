/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class JobListViewComponentController1 {
    global String applyPageURL;
    global String cmsCssCustom {
        get;
        set;
    }
    global Integer countJobForPage {
        get;
        set;
    }
    global String currentUrlJobListPage {
        get;
        set;
    }
    global Boolean disableNextButton {
        get;
        set;
    }
    global Boolean disablePreviousButton {
        get;
        set;
    }
    global Boolean enableGeoCoding {
        get;
        set;
    }
    global Boolean errorParam {
        get;
        set;
    }
    global Boolean IsDoubleLoadInit;
    global Boolean isRedirect {
        get;
        set;
    }
    global Boolean isShowPagination {
        get;
        set;
    }
    global Boolean jobCheckBox1 {
        get;
        set;
    }
    global String jobSearch;
    global List<Integer> numbersPage {
        get;
        set;
    }
    global Organization org {
        get;
        set;
    }
    global List<System.SelectOption> pageCountSizeList;
    global List<System.SelectOption> pageList;
    global Integer pageNumber {
        get;
        set;
    }
    global List<Integer> pageSizeList {
        get;
        set;
    }
    global String pageURL;
    global Decimal radius {
        get;
        set;
    }
    global String redirectUrl {
        get;
        set;
    }
    global String selectedPage {
        get;
        set;
    }
    global String selectedPageSize {
        get;
        set;
    }
    global String selectLanguage {
        get;
        set;
    }
    global Boolean showApplyButton;
    global Boolean showJobError;
    global Boolean showSearchFilterError;
    global Integer totalCountRecords {
        get;
        set;
    }
    global Boolean useMyCurrentLocation {
        get;
        set;
    }
    global String zipCode {
        get;
        set;
    }
    global JobListViewComponentController1() {

    }
    global System.PageReference apply() {
        return null;
    }
    global System.PageReference apply1() {
        return null;
    }
    global String getCmsCssCustom() {
        return null;
    }
    global AVTRRT__Job__c getJob() {
        return null;
    }
    global Boolean getJobCheckBox() {
        return null;
    }
    global String getJobSearch() {
        return null;
    }
    global String getMetaKeywords() {
        return null;
    }
    @Deprecated
    global String getPageURL() {
        return null;
    }
    global List<System.SelectOption> getPages() {
        return null;
    }
    global List<List<TRGTFCMS.JobListViewComponentController1.searchedJobBean>> getSearchedJobBeanListOfList() {
        return null;
    }
    global List<AVTRRT__Job__c> getSearchedJobList1() {
        return null;
    }
    global List<List<AVTRRT__Job__c>> getSearchedJobList() {
        return null;
    }
    global Boolean getShowApplyButton() {
        return null;
    }
    global Boolean getShowJobError() {
        return null;
    }
    global Boolean getShowSearchFilterError() {
        return null;
    }
    global String getapplyPageURL() {
        return null;
    }
    global List<System.SelectOption> getpageCountSizeList() {
        return null;
    }
    global void init() {

    }
    global List<TRGTFCMS.JobListViewComponentController1.searchedJobBean> moveToPage(Integer p_numberPage, Integer p_countJob, List<TRGTFCMS.JobListViewComponentController1.searchedJobBean> p_jobListOnOnePage) {
        return null;
    }
    global void pageChanged() {

    }
    global void pageNumbers(Integer p_numberPage, Integer totalCountPage) {

    }
    global void pageSize(Integer p_pageCountRecords, Integer p_allSizeList) {

    }
    @Deprecated
    global System.PageReference reset() {
        return null;
    }
    global System.PageReference search() {
        return null;
    }
    global void selectedPageCountRecord() {

    }
    global void selectedPageNumber() {

    }
    global void setJob(AVTRRT__Job__c job) {

    }
    global void setJobCheckBox(Boolean jobCheckBox) {

    }
    global void setJobSearch(String jobSearch) {

    }
    global void setSearchedJobBeanListOfList(List<List<TRGTFCMS.JobListViewComponentController1.searchedJobBean>> searchList) {

    }
    global void setShowApplyButton(Boolean showApplyButton) {

    }
    global void setShowJobError(Boolean showJobError) {

    }
    global void setShowSearchFilterError(Boolean showSearchFilterError) {

    }
    @Deprecated
    global static void tstJobListViewComponentController1() {

    }
global class searchedJobBean {
    global Boolean checkBox {
        get;
        set;
    }
    global Boolean jobAppliedBefore {
        get;
        set;
    }
    global AVTRRT__Job__c jobObject {
        get;
        set;
    }
    global String oddEvenCssClass {
        get;
        set;
    }
    global searchedJobBean() {

    }
}
}
