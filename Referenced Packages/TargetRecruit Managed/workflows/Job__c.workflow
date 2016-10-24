<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>NotifyAllRecruiteraboutthenewJob</fullName>
        <description>Notify All Recruiter about the new Job</description>
        <protected>false</protected>
        <recipients>
            <recipient>rosie@brightnetwork.co.uk</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/NewJobNotification</template>
    </alerts>
    <alerts>
        <fullName>NotifyRecruiterandAccountManageraboutthenewJob</fullName>
        <description>Notify Recruiter and Account Manager about the new Job</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/NewJobNotification</template>
    </alerts>
    <alerts>
        <fullName>Whenrecruiterischangedforajob</fullName>
        <description>When recruiter is changed for a job</description>
        <protected>false</protected>
        <recipients>
            <field>Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/Recruiterchangedforajob</template>
    </alerts>
    <fieldUpdates>
        <fullName>Erase_Application_Tiny_URL_Values</fullName>
        <field>Job_Application_Tiny_URL__c</field>
        <name>Erase Application Tiny URL Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Erase_Latitude_Values</fullName>
        <field>Lat__c</field>
        <name>Erase Latitude Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Erase_Longitude_Values</fullName>
        <field>Lon__c</field>
        <name>Erase Longitude Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Erase_Mapping_Status_Values</fullName>
        <field>Mapping_Status__c</field>
        <literalValue>Not Located Yet</literalValue>
        <name>Erase Mapping Status Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Erase_Number_of_Applicants_Values</fullName>
        <field>Number_of_Applicants__c</field>
        <name>Erase Number of Applicants Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Erase_Number_of_Interviews_Values</fullName>
        <field>Number_of_Interviews__c</field>
        <name>Erase Number of Interviews Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Erase_Published_Tiny_URL_Values</fullName>
        <field>Job_Publish_Tiny_Url__c</field>
        <name>Erase Published Tiny URL Values</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>JobCreateORUpdate</fullName>
        <apiVersion>8.0</apiVersion>
        <endpointUrl>http://72.51.35.156:9095/hrstaffing/soap/notifications?config=target</endpointUrl>
        <fields>Account_Job__c</fields>
        <fields>Account_Manager__c</fields>
        <fields>Closed_Qualifiers__c</fields>
        <fields>Closed__c</fields>
        <fields>Country_Locale__c</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>Estimated_Close_Date__c</fields>
        <fields>Experience__c</fields>
        <fields>Hiring_Manager__c</fields>
        <fields>Id</fields>
        <fields>Internal_Notes__c</fields>
        <fields>IsDeleted</fields>
        <fields>Job_Category__c</fields>
        <fields>Job_City__c</fields>
        <fields>Job_Description__c</fields>
        <fields>Job_Postal_Code__c</fields>
        <fields>Job_Summary__c</fields>
        <fields>Job_Term__c</fields>
        <fields>Job_Time_Zone__c</fields>
        <fields>Job_Title__c</fields>
        <fields>LastActivityDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>Name</fields>
        <fields>Opportunity__c</fields>
        <fields>OwnerId</fields>
        <fields>Prob_of_Win__c</fields>
        <fields>Publish__c</fields>
        <fields>Published_Url__c</fields>
        <fields>Rate__c</fields>
        <fields>Recruiter__c</fields>
        <fields>Stage__c</fields>
        <fields>Start_Date__c</fields>
        <fields>State__c</fields>
        <fields>Street_Address__c</fields>
        <fields>SystemModstamp</fields>
        <fields>Travel_Comments__c</fields>
        <fields>Travel_Per__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>rosie@brightnetwork.co.uk</integrationUser>
        <name>Job Create OR Update</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Outbound</fullName>
        <apiVersion>8.0</apiVersion>
        <endpointUrl>http://dbsync.avankia.com/hrstaffing/soap/notifications?config=avtrrttest20</endpointUrl>
        <fields>AAP_Group__c</fields>
        <fields>Account_Job_Name__c</fields>
        <fields>Account_Job__c</fields>
        <fields>Account_Manager__c</fields>
        <fields>Adverse_Impact_Percentage__c</fields>
        <fields>AutoPopulated_Skills__c</fields>
        <fields>Bill_Rate_Range__c</fields>
        <fields>Billable__c</fields>
        <fields>Broadcast_Url__c</fields>
        <fields>Closed_Qualifiers__c</fields>
        <fields>Closed__c</fields>
        <fields>Country_Locale__c</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>Department__c</fields>
        <fields>EEO_Job_Category__c</fields>
        <fields>Estimated_Close_Date__c</fields>
        <fields>Experience__c</fields>
        <fields>Hiring_Manager_Name__c</fields>
        <fields>Hiring_Manager__c</fields>
        <fields>Id</fields>
        <fields>Internal_Job_Description__c</fields>
        <fields>Internal_Notes__c</fields>
        <fields>IsDeleted</fields>
        <fields>Job_Category__c</fields>
        <fields>Job_City__c</fields>
        <fields>Job_Contact_Email__c</fields>
        <fields>Job_Contact_Name__c</fields>
        <fields>Job_Description__c</fields>
        <fields>Job_Summary__c</fields>
        <fields>Job_Term__c</fields>
        <fields>Job_Time_Zone__c</fields>
        <fields>Job_Title__c</fields>
        <fields>LastActivityDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>Name</fields>
        <fields>Notify_All_Recruiters__c</fields>
        <fields>Notify_All_Vendors__c</fields>
        <fields>Number_of_Applicants__c</fields>
        <fields>Number_of_Female_Applicants__c</fields>
        <fields>Number_of_Male_Applicants__c</fields>
        <fields>Number_of_Minority_Applicants__c</fields>
        <fields>Number_of_Non_Minority_Applicants__c</fields>
        <fields>Number_of_Positions__c</fields>
        <fields>Opportunity__c</fields>
        <fields>OwnerId</fields>
        <fields>Prob_of_Win__c</fields>
        <fields>Publish__c</fields>
        <fields>Rate__c</fields>
        <fields>RecordTypeId</fields>
        <fields>Recruiter__c</fields>
        <fields>Salary_Range__c</fields>
        <fields>Skill_Matched__c</fields>
        <fields>Stage__c</fields>
        <fields>Start_Date__c</fields>
        <fields>State__c</fields>
        <fields>Street_Address__c</fields>
        <fields>SystemModstamp</fields>
        <fields>Travel_Comments__c</fields>
        <fields>Travel_Per__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>rosie@brightnetwork.co.uk</integrationUser>
        <name>Outbound</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Job Create Notification to Recruiter and Account Manager</fullName>
        <actions>
            <name>NotifyRecruiterandAccountManageraboutthenewJob</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job__c.Name</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <description>Notification for new Job assignment (To Recruiter and Account Manager)</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Job Create OR Update</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Job__c.Job_Title__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>NOT USED</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notification to all recruiters on new job created%2E</fullName>
        <actions>
            <name>NotifyAllRecruiteraboutthenewJob</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job__c.Notify_All_Recruiters__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Notification to all recruiter, if &quot;Notify All Recruiters&quot; is checked.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Recruiter changed for a job</fullName>
        <actions>
            <name>Whenrecruiterischangedforajob</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Notification to Recruiters for change in assignment on the Job</description>
        <formula>ISCHANGED( Recruiter__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set some job record fields to blank value</fullName>
        <actions>
            <name>Erase_Application_Tiny_URL_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Erase_Latitude_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Erase_Longitude_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Erase_Mapping_Status_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Erase_Number_of_Applicants_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Erase_Number_of_Interviews_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Erase_Published_Tiny_URL_Values</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>PLEASE DO NOT DEACTIVATE THIS RULE</description>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>