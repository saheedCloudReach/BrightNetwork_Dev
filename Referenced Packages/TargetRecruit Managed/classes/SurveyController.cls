/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SurveyController {
    global List<AVTRRT.SurveyController.Question> allQuestions {
        get;
        set;
    }
    global Attachment footer {
        get;
        set;
    }
    global Attachment header {
        get;
        set;
    }
    global String language {
        get;
        set;
    }
    global String newOrder {
        get;
        set;
    }
    global String qChoices {
        get;
        set;
    }
    global String qQuestion {
        get;
        set;
    }
    global Boolean qRequired {
        get;
        set;
    }
    global String questionReference {
        get;
        set;
    }
    global String questionType {
        get;
        set;
    }
    global List<System.SelectOption> questionTypeOptions {
        get;
        set;
    }
    global Boolean showPageContent {
        get;
        set;
    }
    global SurveyController() {

    }
    global void addQuestion() {

    }
    global System.PageReference deleteQuestion() {
        return null;
    }
    global void editQuestion() {

    }
    global void init() {

    }
    global System.PageReference saveQuestion() {
        return null;
    }
    global System.PageReference submitAnswers() {
        return null;
    }
    global System.PageReference updateOrderList() {
        return null;
    }
global class Question {
    global String id {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global String nameArea {
        get;
        set;
    }
    global List<System.SelectOption> options {
        get;
        set;
    }
    global String orderNumber {
        get;
        set;
    }
    global String otherValue {
        get;
        set;
    }
    global String questionType {
        get;
        set;
    }
    global Boolean required {
        get;
        set;
    }
    global String selectedOption {
        get;
        set;
    }
    global List<String> selectedOptions {
        get;
        set;
    }
    global String selectedText {
        get;
        set;
    }
    global Question(AVTRRT__Survey_Question__c p_question, Integer p_orderNumber) {

    }
    global Question(AVTRRT__Survey_Question__c p_question, String p_orderNumber) {

    }
}
}
