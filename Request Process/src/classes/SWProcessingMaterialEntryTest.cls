@isTest

private class SWProcessingMaterialEntryTest {    

    static testMethod void SWProcessingMaterialEntryTest () {  
            PageReference pageRef = Page.SW_Update_Process_Materials;        
            Test.setCurrentPage(pageRef);
            SW_Process_Request__c request = new SW_Process_Request__c();              
            ApexPages.StandardController controller = new ApexPages.StandardController(request);
            
        SWProcessingMaterialEntry matEntry  = new SWProcessingMaterialEntry(controller);
        matEntry.addRow();
        matEntry.removeRow();
        matEntry.save();
                
        // also test Process Request Trigger
        request.Required_Date__c = system.today();
        request.Expected_Input_Weight__c = 100;
        insert request ;
    }
    
}