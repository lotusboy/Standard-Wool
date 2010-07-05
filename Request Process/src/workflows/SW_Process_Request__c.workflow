<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>CompleteRequestSubmitted</fullName>
        <actions>
            <name>Accept_Complete_Request_Submission</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Defines workflow when a complete request is submitted.</description>
        <formula>ISPICKVAL(Status__c,  &apos;Complete Request - Submitted&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DraftRequest</fullName>
        <actions>
            <name>Submit_Initial_Request</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SW_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Draft</value>
        </criteriaItems>
        <description>Defines workflow when an initial request is drafted.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>InitialRequestSubmission</fullName>
        <actions>
            <name>Acknowledge_Initial_Request_Submission</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Complete_Req_Submission</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Defines workflow when an initial request is submitted.</description>
        <formula>ISPICKVAL(Status__c, &apos;Initial Request - Submitted&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>RequestAccepted</fullName>
        <actions>
            <name>Schedule_Process_Request</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Defines workflow when a request is accepted.</description>
        <formula>ISPICKVAL(Status__c, &apos;Request - Accepted&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>RequestLocked</fullName>
        <actions>
            <name>Mark_As_Complete</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Defines workflow when a request is locked.</description>
        <formula>ISPICKVAL(Status__c, &apos;Request - Locked&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>RequestScheduled</fullName>
        <actions>
            <name>Lock_Process_Request</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Defines workflow when a request is scheduled.</description>
        <formula>ISPICKVAL(Status__c, &apos;Request - Scheduled&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Accept_Complete_Request_Submission</fullName>
        <assignedTo>steven.loftus@bgn.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Accept Complete Request Submission</subject>
    </tasks>
    <tasks>
        <fullName>Acknowledge_Initial_Request_Submission</fullName>
        <assignedTo>steven.loftus@bgn.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Acknowledge Initial Request Submission</subject>
    </tasks>
    <tasks>
        <fullName>Complete_Req_Submission</fullName>
        <assignedTo>steven.loftus@bgn.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Complete Request Submission</subject>
    </tasks>
    <tasks>
        <fullName>Lock_Process_Request</fullName>
        <assignedTo>steven.loftus@bgn.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Lock Process Request</subject>
    </tasks>
    <tasks>
        <fullName>Mark_As_Complete</fullName>
        <assignedTo>steven.loftus@bgn.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Mark As Complete</subject>
    </tasks>
    <tasks>
        <fullName>Schedule_Process_Request</fullName>
        <assignedTo>steven.loftus@bgn.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Schedule Process Request</subject>
    </tasks>
    <tasks>
        <fullName>Submit_Initial_Request</fullName>
        <assignedTo>steven.loftus@bgn.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submit Initial Request</subject>
    </tasks>
</Workflow>
