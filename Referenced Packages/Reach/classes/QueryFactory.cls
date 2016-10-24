/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QueryFactory {
    global Schema.SObjectType table {
        get;
    }
    global QueryFactory(Schema.SObjectType table) {

    }
    global Reach.QueryFactory addOrdering(Reach.QueryFactory.Ordering o) {
        return null;
    }
    global Reach.QueryFactory addOrdering(Schema.SObjectField field, Reach.QueryFactory.SortOrder direction) {
        return null;
    }
    global Reach.QueryFactory addOrdering(String fieldName, Reach.QueryFactory.SortOrder direction) {
        return null;
    }
    global Reach.QueryFactory addOrdering(Schema.SObjectField field, Reach.QueryFactory.SortOrder direction, Boolean nullsLast) {
        return null;
    }
    global Reach.QueryFactory addOrdering(String fieldName, Reach.QueryFactory.SortOrder direction, Boolean nullsLast) {
        return null;
    }
    global Reach.QueryFactory assertIsAccessible() {
        return null;
    }
    global Boolean equals(Object obj) {
        return null;
    }
    global String getCondition() {
        return null;
    }
    global Integer getLimit() {
        return null;
    }
    global List<Reach.QueryFactory.Ordering> getOrderings() {
        return null;
    }
    global Set<Reach.QueryFactory.QueryField> getSelectedFields() {
        return null;
    }
    global List<Reach.QueryFactory> getSubselectQueries() {
        return null;
    }
    global Reach.QueryFactory selectField(Schema.SObjectField field) {
        return null;
    }
    global Reach.QueryFactory selectField(String fieldName) {
        return null;
    }
    global Reach.QueryFactory selectFieldSet(Schema.FieldSet fieldSet) {
        return null;
    }
    global Reach.QueryFactory selectFieldSet(Schema.FieldSet fieldSet, Boolean allowCrossObject) {
        return null;
    }
    global Reach.QueryFactory selectFields(List<Schema.SObjectField> fields) {
        return null;
    }
    global Reach.QueryFactory selectFields(List<String> fieldNames) {
        return null;
    }
    global Reach.QueryFactory selectFields(Set<Schema.SObjectField> fields) {
        return null;
    }
    global Reach.QueryFactory selectFields(Set<String> fieldNames) {
        return null;
    }
    global Reach.QueryFactory setCondition(String conditionExpression) {
        return null;
    }
    global Reach.QueryFactory setEnforceFLS(Boolean enforce) {
        return null;
    }
    global Reach.QueryFactory setLimit(Integer limitCount) {
        return null;
    }
    global Reach.QueryFactory subselectQuery(Schema.SObjectType related) {
        return null;
    }
    global Reach.QueryFactory subselectQuery(Schema.SObjectType related, Boolean assertIsAccessible) {
        return null;
    }
    global String toSOQL() {
        return null;
    }
global class InvalidFieldException extends Exception {
    global InvalidFieldException(String fieldname, Schema.SObjectType objectType) {

    }
}
global class InvalidFieldSetException extends Exception {
}
global class InvalidSubqueryRelationshipException extends Exception {
}
global class NonReferenceFieldException extends Exception {
}
global class Ordering {
    global Ordering(Schema.SObjectField field, Reach.QueryFactory.SortOrder direction) {

    }
    global Ordering(Schema.SObjectField field, Reach.QueryFactory.SortOrder direction, Boolean nullsLast) {

    }
    global Ordering(String sobjType, String fieldName, Reach.QueryFactory.SortOrder direction) {

    }
    global Reach.QueryFactory.SortOrder getDirection() {
        return null;
    }
    global Schema.SObjectField getField() {
        return null;
    }
    global List<Schema.SObjectField> getFields() {
        return null;
    }
    global String toSOQL() {
        return null;
    }
}
global class QueryField implements System.Comparable {
    global Integer compareTo(Object o) {
        return null;
    }
    global Boolean equals(Object obj) {
        return null;
    }
    global Schema.SObjectField getBaseField() {
        return null;
    }
    global List<Schema.SObjectField> getFieldPath() {
        return null;
    }
    global Integer hashCode() {
        return null;
    }
    global override String toString() {
        return null;
    }
}
global enum SortOrder {ASCENDING, DESCENDING}
}
