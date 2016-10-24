<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EmailtoalltheuserswithPlacementdetails</fullName>
        <description>Email to all the users with Placement details</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Assigned_Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/EmailforNewPlacement</template>
    </alerts>
    <alerts>
        <fullName>PlacementTerminationNotificationRecruiter</fullName>
        <description>Placement Termination Notification (Recruiter)</description>
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
        <template>RecruitingTemplates/PlacementTerminationNotificationMailRecruiter</template>
    </alerts>
    <alerts>
        <fullName>RateChangeNotificationAccountManager</fullName>
        <description>Rate Change Notification (Account Manager)</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/PlacementRateChangeNotificationMailAccountManager</template>
    </alerts>
    <alerts>
        <fullName>RateChangeNotificationRecruiter</fullName>
        <description>Rate Change Notification (Recruiter)</description>
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
        <template>RecruitingTemplates/PlacementRateChangeNotificationMailRecruiter</template>
    </alerts>
    <alerts>
        <fullName>SendsemailtoalltheuserswithPlacementdetails</fullName>
        <description>Sends email to all the users with Placement details</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/NewPlacementNotificationAllUsers</template>
    </alerts>
    <alerts>
        <fullName>UpdateAccountOwnerwithTerminationdetailsAccountManager</fullName>
        <description>Update Account Owner with Termination details (Account Manager)</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/PlacementTerminationNotificationMailAccountingManager</template>
    </alerts>
    <alerts>
        <fullName>UpdateRecruiterwithTerminationdetails</fullName>
        <description>Update Recruiter with Termination details</description>
        <protected>false</protected>
        <recipients>
            <field>Recruiter__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RecruitingTemplates/PlacementTerminationNotificationMailRecruiter</template>
    </alerts>
    <fieldUpdates>
        <fullName>UpdateNetMarginforRating</fullName>
        <field>NetMargin__c</field>
        <formula>Net_Margin__c</formula>
        <name>Update NetMargin for Rating</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Notification on Placement Done</fullName>
        <actions>
            <name>EmailtoalltheuserswithPlacementdetails</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Placement__c.Name</field>
            <operation>notEqual</operation>
            <value>P00000000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Placement__c.Bill_Rate__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Whenever a placement is done - email alert for everyone in the company</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notification on Placement Termination</fullName>
        <actions>
            <name>PlacementTerminationNotificationRecruiter</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>UpdateAccountOwnerwithTerminationdetailsAccountManager</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Placement__c.Terminated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Notification for Placement Termination (To Account Manager and Recruiter).</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rate Change Notification</fullName>
        <actions>
            <name>RateChangeNotificationAccountManager</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>RateChangeNotificationRecruiter</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Rate Change Notification</description>
        <formula>ISCHANGED(Bill_Rate__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update NetMargin for Rating</fullName>
        <actions>
            <name>UpdateNetMarginforRating</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Placement__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>PLEASE DO NOT DEACTIVATE THIS RULE</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
