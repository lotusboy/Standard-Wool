global class SWProcessRequestHelper{

    WebService static void updateStatus(String vStatus, String vName) { 

        System.debug('updateStatus for vName [' + vName + '], vStatus [' + vStatus + '].');

        SW_Process_Request__c request = [Select Name, Status__c from SW_Process_Request__c where Name = :vName];
        request.LastStatus__c = request.Status__c;
        request.Status__c = vStatus;

        update request;        
    }
    
    WebService static void updateTask(String vSubject, String vRequestName, String vId) { 

        System.debug('updateTaskfor vSubject [' + vSubject + '], vRequestName[' + vRequestName + '], vId[' + vId + '].');

        Task task = [Select Subject, Status from Task where Subject = :vSubject and WhatId = :vId and status <> 'Completed'];
        task.Status = 'Completed';
        update task;

    }

    WebService static void addActvityHistory(String vSubject, String vStatus, String vWhatId) { 
    
    //ActivityHistory newActHist = new ActivityHistory();
    
    //newActHist.Subject = vSubject;
    //newActHist.setStatus(vStatus);
    //newActHist.setWhatId(vWhatId);
    
    //binding.create(new SObject[] {newActHist});
   
    }
    
    public String describeChangesOnUpdatedObject(SW_Process_Request__c newRequest, SW_Process_Request__c oldRequest) { 
	    Schema.DescribeSObjectResult  F = SW_Process_Request__c.sObjectType.getDescribe();
      
    	// Obtaining the field name/token map for the Contact object
    	Map<String,Schema.SObjectField> fieldMap = Schema.SObjectType.SW_Process_Request__c.fields.getMap();
   		// Schema.DescribeSObjectResult objSchema = Account.sObjectType.getDescribe();
        // Map<String, Schema.SObjectField> fieldMap = objSchema.fields.getMap();


		String ret = '';
        for (String fieldName : fieldMap.keySet()){
			if(fieldName <> 'systemmodstamp' && fieldName <> 'lastmodifieddate' && fieldName <> 'Status__c' 
				&& fieldName <> 'LastStatus__c' && fieldName <> 'lastmodifiedbyid'  ){
				
	            System.debug('*** field name is ' + fieldName);   
	            Object oldVal = oldRequest.get(fieldName);
	            Object newVal = newRequest.get(fieldName);
	            
	            System.debug('*** old field value is ' + oldVal);
	            System.debug('*** new field value is ' + newVal);
	            
	            
	            if(newVal <> oldVal ){
	            	sObjectField field = fieldMap.get(fieldName);
	            	ret = ret + 'Field: [' + field.getDescribe().getLabel() + '] amended from [' + oldVal + '] to [' + newVal + '].\n';
	            	
	            }
        	}
            
        }

		return ret;
		
    }
    
   
}