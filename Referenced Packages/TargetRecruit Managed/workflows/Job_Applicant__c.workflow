<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>NewCandidateassignedtoaJob</fullName>
        <description>New Candidate assigned to a Job</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/NewOnlineJobApplicantNotification</template>
    </alerts>
    <alerts>
        <fullName>NotificationtoRecruiteronRejection</fullName>
        <description>Notification to Recruiter on Rejection</description>
        <protected>false</protected>
        <recipients>
            <field>Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/NotificationtoRecruiteronRejection</template>
    </alerts>
    <alerts>
        <fullName>NotifyRecruiterwithnewJobApplicant</fullName>
        <description>Notify Recruiter with new Job Applicant</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/NewOnlineJobApplicantNotification</template>
    </alerts>
    <alerts>
        <fullName>SendresumetotheAccountManager</fullName>
        <description>Send resume to the Account Manager</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/SendresumetotheHiringManager</template>
    </alerts>
    <fieldUpdates>
        <fullName>Job_Applicant_Stage_to_submitted</fullName>
        <field>Stage__c</field>
        <literalValue>Submitted to Client</literalValue>
        <name>Job_Applicant_Stage_to_submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetSearchDate</fullName>
        <field>Search_Date__c</field>
        <formula>NOW()</formula>
        <name>SetSearchDate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updateworkdetails</fullName>
        <field>Resume__c</field>
        <formula>Contact_Candidate__r.Resume__c</formula>
        <name>Update workdetails</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workdetail</fullName>
        <field>Candidate_Write_Up__c</field>
        <formula>if( Contact_Candidate__c !=null,Contact_Candidate__c,&apos;&apos;)</formula>
        <name>Work detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Job Applicant created By Recruiter</fullName>
        <actions>
            <name>SendresumetotheAccountManager</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job_Applicant__c.Name</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Applicant__c.Type__c</field>
            <operation>equals</operation>
            <value>Recruiter</value>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Applicant__c.Job_Title__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Applicant__c.Resume__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Notification when a Job Applicant is created by the recruiter (To Account Manager).</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Job_Applicant_Stage_change</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Job_Applicant__c.Stage__c</field>
            <operation>equals</operation>
            <value>New Application</value>
        </criteriaItems>
        <description>NOT USED</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Online Job Applicant</fullName>
        <actions>
            <name>NotifyRecruiterwithnewJobApplicant</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Job_Applicant__c.Type__c</field>
            <operation>equals</operation>
            <value>Online</value>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Applicant__c.Assigned_Recruiter__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Applicant__c.Job_Title__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Notification to Recruiter when a candidate applies online.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notification to Recruiter on Job Applicant Rejection</fullName>
        <actions>
            <name>NotificationtoRecruiteronRejection</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job_Applicant__c.Stage__c</field>
            <operation>contains</operation>
            <value>Rejected by Account Manager,Rejected by Candidate,Rejected by Client</value>
        </criteriaItems>
        <description>Notification to Recruiter on Job Applicant Rejection</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SetEOODate</fullName>
        <actions>
            <name>SetSearchDate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Job_Applicant__c.Search_Criteria_Long__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>PLEASE DO NOT DEACTIVATE THIS RULE</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Jobapplicant Resume</fullName>
        <actions>
            <name>Updateworkdetails</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Job_Applicant__c.Job_Title__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Applicant__c.Resume__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>PLEASE DO NOT DEACTIVATE THIS RULE</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>SendresumetotheHiringManager</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Send resume to the Hiring Manager</subject>
    </tasks>
</Workflow>
