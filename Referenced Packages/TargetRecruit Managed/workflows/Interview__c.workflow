<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Candidate_Interview_email</fullName>
        <description>Candidate Interview email notification</description>
        <protected>false</protected>
        <recipients>
            <field>Contact_Candidate__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewScheduledMailToCandidate</template>
    </alerts>
    <alerts>
        <fullName>InterviewScheduledMailAccountManager</fullName>
        <description>Interview Scheduled Mail (Account Manager)</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewScheduledMailToAccountManager</template>
    </alerts>
    <alerts>
        <fullName>InterviewScheduledMailCandidate</fullName>
        <description>Interview Scheduled Mail (Candidate)</description>
        <protected>false</protected>
        <recipients>
            <field>Contact_Candidate__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewScheduledMailToCandidate</template>
    </alerts>
    <alerts>
        <fullName>InterviewScheduledMailHiringManager</fullName>
        <description>Interview Scheduled Mail (Hiring Manager)</description>
        <protected>false</protected>
        <recipients>
            <field>Hiring_Manager__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewScheduledMailToRecruiter</template>
    </alerts>
    <alerts>
        <fullName>InterviewSetup</fullName>
        <description>Interview Setup</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewSetup</template>
    </alerts>
    <alerts>
        <fullName>Interviewing_Person_Event_notification</fullName>
        <description>Interviewing Person Event notification</description>
        <protected>false</protected>
        <recipients>
            <field>Hiring_Manager__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewScheduledMailToRecruiter</template>
    </alerts>
    <alerts>
        <fullName>NotificationonInterviewChanged</fullName>
        <description>Notification on Interview Changed</description>
        <protected>false</protected>
        <recipients>
            <field>Candidate_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Interviewing_Person_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewChange</template>
    </alerts>
    <alerts>
        <fullName>RateInterview</fullName>
        <description>Rate Interview</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewReminder</template>
    </alerts>
    <alerts>
        <fullName>RatetheInterview</fullName>
        <description>Rate the Interview</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/InterviewReminder</template>
    </alerts>
    <rules>
        <fullName>Candidate Event Notification</fullName>
        <actions>
            <name>Candidate_Interview_email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Interview__c.Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>NOT USED</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Interview Schedule Notification Email</fullName>
        <actions>
            <name>InterviewScheduledMailAccountManager</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>InterviewScheduledMailCandidate</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>InterviewScheduledMailHiringManager</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Interview__c.Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Notification for Interview scheduled (To Recruiter, Account Manager and Candidate). NOT USED</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Interview Set Up</fullName>
        <actions>
            <name>InterviewSetup</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Interview__c.Name</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Interview__c.Type_Of_Interview__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>NOT USED</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Interviewing Person Event Notification</fullName>
        <actions>
            <name>Interviewing_Person_Event_notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Interview__c.Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>NOT USED</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notification on Interview Change</fullName>
        <active>false</active>
        <description>NOT USED</description>
        <formula>Start_Date__c &gt; PRIORVALUE( Start_Date__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>InterviewReminder</fullName>
        <assignedTo>rosie@brightnetwork.co.uk</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Interview Reminder</description>
        <dueDateOffset>-1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Interview__c.Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Interview Reminder</subject>
    </tasks>
</Workflow>
