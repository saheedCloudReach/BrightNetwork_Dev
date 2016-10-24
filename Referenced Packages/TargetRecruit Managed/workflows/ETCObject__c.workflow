<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>EmailToCandidate_Submission</fullName>
        <apiVersion>21.0</apiVersion>
        <endpointUrl>http://resumeservice.targetrecruit.net/importresume/soap/notifications</endpointUrl>
        <fields>Candidate__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Name__c</fields>
        <fields>Status__c</fields>
        <fields>User__c</fields>
        <fields>sessionId__c</fields>
        <fields>sfURL__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>rosie@brightnetwork.co.uk</integrationUser>
        <name>EmailToCandidate Submission</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Test</fullName>
        <apiVersion>8.0</apiVersion>
        <endpointUrl>http://resumeservice.targetrecruit.net/importresume/soap/notifications</endpointUrl>
        <fields>Candidate__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Name__c</fields>
        <fields>Status__c</fields>
        <fields>User__c</fields>
        <fields>sessionId__c</fields>
        <fields>sfURL__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>rosie@brightnetwork.co.uk</integrationUser>
        <name>Test</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>EmailToCandidate Submission</fullName>
        <actions>
            <name>EmailToCandidate_Submission</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ETCObject__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>ETCObject__c.Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>PLEASE DO NOT DEACTIVATE THIS RULE</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
