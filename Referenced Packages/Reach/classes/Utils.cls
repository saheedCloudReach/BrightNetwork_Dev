/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Utils {
    global static String ns;
    global static String nsp;
    global static String nsprefix;
    global Utils() {

    }
    global static void CreateSystemException() {

    }
    global static void CreateSystemException(Exception ex) {

    }
    global static void CreateSystemException(String debugMsg) {

    }
    global static Boolean checkDateIntersect(Date date1From, Date date1To, Date date2From, Date date2To) {
        return null;
    }
    global static void checkFieldIsReadable(Schema.SObjectType objType, Schema.DescribeFieldResult fieldDescribe) {

    }
    global static void checkFieldIsReadable(Schema.SObjectType objType, Schema.SObjectField fieldToken) {

    }
    global static void checkFieldIsReadable(Schema.SObjectType objType, String fieldName) {

    }
    global static void checkObjectIsReadable(Schema.SObjectType objType) {

    }
    global static void checkRead(Schema.SObjectType objType, List<Schema.SObjectField> fieldTokens) {

    }
    global static void checkRead(Schema.SObjectType objType, List<String> fieldNames) {

    }
    global static Reach.Collector collect(List<SObject> source) {
        return null;
    }
    global static System.HttpResponse doGetRequest(String endpoint, String cookie) {
        return null;
    }
    global static System.HttpResponse doPostRequest(String endpoint, String cookie, String content) {
        return null;
    }
    global static Reach.Filter filter(List<SObject> source) {
        return null;
    }
    global static Map<Id,RecordType> findAllRecordTypes() {
        return null;
    }
    global static Map<Id,UserRole> findAllUserRoles() {
        return null;
    }
    global static Map<Id,User> findAllUsers() {
        return null;
    }
    global static List<Contact> findContactsByAccountId(Id accountId) {
        return null;
    }
    global static Map<Id,List<Contact>> findContactsByAccountIds(Set<Id> accountIds) {
        return null;
    }
    global static Map<Id,List<Opportunity>> findOpportunitiesByAccountIds(Set<Id> accountIds) {
        return null;
    }
    global static Map<Id,List<OpportunityLineItem>> findOpportunityLineItemsByOppIdIntoMap(Set<Id> opportunityIds) {
        return null;
    }
    global static List<OpportunityLineItem> findOpportunityLineItemsByOppId(Set<Id> opportunityIds) {
        return null;
    }
    global static List<PricebookEntry> findPriceBookEntriesByPriceBook(Id priceBookId, String currencyIsoCode) {
        return null;
    }
    global static Product2 findProductByProductCode(String productCode) {
        return null;
    }
    global static Map<String,Product2> findProductsByProductCodes(Set<String> productCodes) {
        return null;
    }
    global static RecordType findRecordTypeById(Id anId) {
        return null;
    }
    global static Map<Id,RecordType> findRecordTypesByObjectType(Set<String> objectTypes) {
        return null;
    }
    global static User findUserById(Id userId) {
        return null;
    }
    global static User findUserRoleAndProfileById(Id userId) {
        return null;
    }
    global static Map<Id,User> findUsersByIds(Set<Id> userIds) {
        return null;
    }
    global static Map<String,User> findUsersByUserNames(Set<String> userNames) {
        return null;
    }
    global static Id getAccountRecordTypeId(String recordtypeName) {
        return null;
    }
    global static Boolean getBooleanParam(String param) {
        return null;
    }
    global static User getCurrentUser() {
        return null;
    }
    global static Id getIdParam(String param) {
        return null;
    }
    global static String getInstance() {
        return null;
    }
    global static String getParam(String param) {
        return null;
    }
    global static Set<Id> getRecordIds(List<SObject> records) {
        return null;
    }
    global static String sanitize(String s) {
        return null;
    }
global class UtilsException extends Exception {
}
}
