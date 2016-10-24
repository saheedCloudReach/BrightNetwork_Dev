/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MetadataUtilNew {
    global Schema.DescribeSObjectResult sObjectDescribe {
        get;
        set;
    }
    global Schema.SObjectType sObjectType;
    global MetadataUtilNew(Id recordId) {

    }
    global MetadataUtilNew(Schema.SObjectType sObjectType) {

    }
    global MetadataUtilNew(SObject obj) {

    }
    global MetadataUtilNew(String objApiName) {

    }
    global SObject cloneById(Id id, List<String> relationshipNames) {
        return null;
    }
    global static String formatDateTimeToQueryString(Datetime dTime) {
        return null;
    }
    global List<String> getAllChildRelationshipsStrings() {
        return null;
    }
    global List<Schema.ChildRelationship> getAllChildRelationships() {
        return null;
    }
    global Set<String> getAllFieldNames() {
        return null;
    }
    global List<Schema.SObjectField> getAllFieldsSObject() {
        return null;
    }
    global String getAllFieldsString() {
        return null;
    }
    global Schema.ChildRelationship getChildRelationshipByRelationshipName(String name) {
        return null;
    }
    global String getChildRelationshipNameByRelationshipName(String name) {
        return null;
    }
    global Schema.DescribeFieldResult getDescribeFieldResult(Schema.SObjectField sObjectField) {
        return null;
    }
    global Schema.DescribeFieldResult getDescribeFieldResult(String fieldName) {
        return null;
    }
    global String getFieldLabel(String fieldName) {
        return null;
    }
    global String getFieldNameByRelationshipName(String name) {
        return null;
    }
    global Object getFieldValue(String name, Object value) {
        return null;
    }
    global static String getObjectAPINameByID(String idString) {
        return null;
    }
    global String getObjectAPINameByParentRelationshipName(String parentRelationshipName) {
        return null;
    }
    global String getObjectName() {
        return null;
    }
    global List<SObject> getRecordsById(List<Id> idList, Map<String,String> parentRelationshipNames, List<String> v_childRelationshipNames) {
        return null;
    }
    global List<SObject> getRecords(List<Id> idList, List<Schema.SObjectField> v_parentRelationshipFields, List<Schema.SObjectField> v_childRelationshipFields) {
        return null;
    }
    global Schema.SObjectField getSObjectField(String fieldName) {
        return null;
    }
    global Object getValueByFieldType(String fieldName, String valueInStringFormat) {
        return null;
    }
    global static String getWhereConstraint(String p, String e, String v, SObject searchObject) {
        return null;
    }
    global Boolean isFieldExists(String fieldName) {
        return null;
    }
    global String makeWhereStatement(SObject sObjectWithValues) {
        return null;
    }
    global void updateChildFieldsFromParentFields(List<SObject> p_childRecords, Schema.SObjectField p_childToParentLookupField, Map<Schema.SObjectField,Schema.SObjectField> p_parentFieldsToChildFieldsMap) {

    }
    global void updateRecords(SObject source, SObject target) {

    }
}
