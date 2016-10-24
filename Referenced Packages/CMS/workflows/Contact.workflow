<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Changed_Password_Email_Alert</fullName>
        <description>Changed Password Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CMS/Changed_Password</template>
    </alerts>
    <alerts>
        <fullName>Forgot_password_email_alert</fullName>
        <description>Forgot password email alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CMS/Forgot_Username_or_Password</template>
    </alerts>
    <alerts>
        <fullName>Notify_Profile_Manager_for_approval_on_creation_of_a_portal_user</fullName>
        <description>Notify Profile Manager for approval on creation of a portal user</description>
        <protected>false</protected>
        <recipients>
            <field>Profile_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CMS/Notify_Profile_Manager</template>
    </alerts>
    <alerts>
        <fullName>Pass_Login_Email_Alert</fullName>
        <description>Pass &amp; Login Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CMS/Email_Pass_Login</template>
    </alerts>
    <alerts>
        <fullName>Portal_User_creation_mail_notification</fullName>
        <description>Portal User creation mail notification</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CMS/User_Created</template>
    </alerts>
    <fieldUpdates>
        <fullName>Reset_PortalEmailAlert</fullName>
        <field>PortalEmailAlert__c</field>
        <literalValue>No action</literalValue>
        <name>Reset PortalEmailAlert</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Changed Password</fullName>
        <actions>
            <name>Changed_Password_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_PortalEmailAlert</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.UserName__c</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.PortalEmailAlert__c</field>
            <operation>equals</operation>
            <value>Password Changed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email with existing login details1</fullName>
        <actions>
            <name>Pass_Login_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>if( ISNEW(), false, IF((PRIORVALUE(Password__c) == NULL &amp;&amp; PRIORVALUE(UserName__c) == NULL ) &amp;&amp;  ( NOT(ISPICKVAL( PortalEmailAlert__c , &apos;User Created&apos;))) &amp;&amp; (Password__c != NULL) &amp;&amp; (UserName__c != NULL), true, false ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forgot Password</fullName>
        <actions>
            <name>Forgot_password_email_alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_PortalEmailAlert</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.UserName__c</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.PortalEmailAlert__c</field>
            <operation>equals</operation>
            <value>Forgot Password</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify Profile Manager</fullName>
        <actions>
            <name>Notify_Profile_Manager_for_approval_on_creation_of_a_portal_user</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Registration_Approved__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>This workflow is used to send an email to the profile manager of the profile which has been assigned to the newly created  contact./candidate.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Portal User Created</fullName>
        <actions>
            <name>Portal_User_creation_mail_notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_PortalEmailAlert</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.UserName__c</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.PortalEmailAlert__c</field>
            <operation>equals</operation>
            <value>User Created</value>
        </criteriaItems>
        <description>This workflow is used to send an email to the contact./candidate created under a portal user account.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
