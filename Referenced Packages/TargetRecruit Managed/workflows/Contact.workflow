<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>JobNotifiedtoCandidate</fullName>
        <description>Job Notified to Candidate</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/NotifyJobToCandidates</template>
    </alerts>
    <alerts>
        <fullName>ThankyouEmailtoCandidate</fullName>
        <description>Thankyou Email to Candidate</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/ThankyouMailOnlineSubmissionCandidate</template>
    </alerts>
    <fieldUpdates>
        <fullName>JobNotified</fullName>
        <description>Job notification to candidate</description>
        <field>Jobs_Notified__c</field>
        <name>Job Notified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_LastName</fullName>
        <description>Updating Candidate LastName with FirstName when LastName contains &quot;name not parsed&quot;</description>
        <field>LastName</field>
        <formula>FirstName</formula>
        <name>Update LastName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Source</fullName>
        <field>LeadSource</field>
        <literalValue>Online Submission</literalValue>
        <name>Update Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Resume_Source</fullName>
        <field>Source__c</field>
        <literalValue>Online Submission</literalValue>
        <name>Update Resume Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Setting Resume Source and Lead Source</fullName>
        <actions>
            <name>Update_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Resume_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.OwnerId</field>
            <operation>contains</operation>
            <value>Site Guest User</value>
        </criteriaItems>
        <description>PLEASE DO NOT DEACTIVATE THIS RULE</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Thankyou Email Notification To Candidate</fullName>
        <actions>
            <name>ThankyouEmailtoCandidate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Source__c</field>
            <operation>equals</operation>
            <value>Online Submission</value>
        </criteriaItems>
        <description>Notification to Candidate for online application.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update LastName</fullName>
        <actions>
            <name>Update_LastName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.LastName</field>
            <operation>contains</operation>
            <value>name not parsed</value>
        </criteriaItems>
        <description>Updating Candidate LastName with FirstName when LastName contains &quot;name not parsed&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
