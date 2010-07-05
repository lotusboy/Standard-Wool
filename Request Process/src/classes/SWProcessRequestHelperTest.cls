/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
 
@isTest
private class SWProcessRequestHelperTest {

    static testMethod void SWProcessingMaterialEntryTest () {  
    	
        SW_Process_Request__c request = new SW_Process_Request__c();
        //[Select Name, Status__c from SW_Process_Request__c where Name = :vName];
        request.LastStatus__c = 'ForTest';
        request.Status__c = 'Draft';
        request.General_Time_Frame_Due__c = 'soon';
        request.Expected_Input_Weight__c = 100.00;
        insert request;  
                 
        SW_Process_Request__c request1 = [Select Id, Name, Status__c from SW_Process_Request__c where Status__c = 'Draft' and LastStatus__c = 'ForTest'];
        request1.status__c = 'Initial Request - Submitted';
        update request1;
        
        System.debug('Test SWProcessRequestHelper.updateStatus() for name[' + request1.Name + ']');
        
        //SWProcessRequestHelper helper = new SWProcessRequestHelper(); 
		SWProcessRequestHelper.updateStatus(request1.status__c, request1.Name); 
		
		String subjectText = 'Acknowledge Initial Request Submission';
		
		List<task> tasks=[Select Subject, WhatId FROM Task WHERE Subject = :subjectText and WhatId = :request1.Id];
		
		delete tasks;
		Task task = new Task();
		
		task.Subject = subjectText;
		task.WhatId = request1.Id;
		insert task;
		
		SWProcessRequestHelper.updateTask('Acknowledge Initial Request Submission', request1.Name, request1.Id);
                      
        
    }
    
    static testMethod void SWDescribeChangesOnUpdatedObjectTest() {
    	SW_Process_Request__c request = new SW_Process_Request__c();
    	SW_Process_Request__c request1 = new SW_Process_Request__c();
    	request.status__c = '0';
    	request1.status__c = '1';
    	
    	SWProcessRequestHelper helper = new SWProcessRequestHelper();
    	
    	String det = helper.describeChangesOnUpdatedObject(request, request1);
    
    }
}