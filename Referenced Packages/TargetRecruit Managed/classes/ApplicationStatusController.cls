/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@isTest
global class ApplicationStatusController {
    global String jobApplicationMSG;
    global Boolean jobApplicationMSGShowHide;
    global Boolean withdraw;
    global Boolean withdrawCheckBoxMain {
        get;
        set;
    }
    global ApplicationStatusController() {

    }
    global List<AVTRRT.ApplicationStatusController.JobApplicationBean> getJobApplicationBeanList() {
        return null;
    }
    global String getJobApplicationMSG() {
        return null;
    }
    global Boolean getJobApplicationMSGShowHide() {
        return null;
    }
    global Boolean getWithdraw() {
        return null;
    }
    global void setWithdraw(Boolean withdraw) {

    }
    @isTest(SeeAllData=false OnInstall=false)
    global static void tstApplicationStatusController() {

    }
    global System.PageReference withdraw() {
        return null;
    }
global class JobApplicationBean {
    global String applicationDate {
        get;
        set;
    }
    global String cssClassEvenOdd {
        get;
        set;
    }
    global AVTRRT__Job_Applicant__c jobApplication {
        get;
        set;
    }
    global String lastModifiedDate {
        get;
        set;
    }
    global JobApplicationBean() {

    }
}
}
