trigger update_process_request_amendment_history on SW_Process_Request__c (after update) {
}
/*
	SWProcessRequestHelper helper = new SWProcessRequestHelper();
	
	for (SW_Process_Request__c req : Trigger.new) {
		SW_Process_Request__c beforeUpdate = System.Trigger.oldMap.get(req.Id); 
		SW_Process_Request__c afterUpdate = System.Trigger.newMap.get(req.Id);
		
		String diff = '';
		
		if(beforeUpdate.Status__c <> 'Draft' && beforeUpdate.Status__c <> 'Initial Request - Submitted' && beforeUpdate.Status__c <> 'Initial Request - Acknowledged'){
			diff = helper.describeChangesOnUpdatedObject(afterUpdate, beforeUpdate);
			
		}
		
		if(diff == '') {
			// no action necessary - no changes
		} else {
			String requestId = afterUpdate.id;
			Process_Request_Amendment_History__c history = new Process_Request_Amendment_History__c();
			Integer max = [Select count()  
							from Process_Request_Amendment_History__c 
							where Process_Request__c = :requestId];
															
			if(afterUpdate.Amendment_Number__c > 0) {
				history.Amendment_Number__c = max + 1;
			} else {
				history.Amendment_Number__c = 0;
			}
			
			history.Name = afterUpdate.name + '_' + history.Amendment_Number__c;
			history.Process_Request__c = requestId;
			history.Amendment_Date_Time__c = System.now();
			history.Amendment_Details__c = diff;
			history.Comments__c = 'to do';
			insert history;
			
			//afterUpdate.Amendment_Status__c = 'Amendment Pending';
			//update afterUpdate;
		}
		*/

		
/*
    Case[] newCase = new Case[0];
    for (SW_Process_Request__c req : Trigger.new)
    {
        SW_Process_Request__c beforeUpdate = System.Trigger.oldMap.get(req.Id); 

		
        if(beforeUpdate.RecordTypeId != a.RecordTypeId
            || beforeUpdate.Venere_Module_ID__c != a.Venere_Module_ID__c
            || beforeUpdate.Venere_ID__c != a.Venere_ID__c
            || beforeUpdate.Request_Venere_ID__c != a.Request_Venere_ID__c)
        {
                if((a.RecordTypeId == '012700000009Tor' || a.RecordTypeId == '012700000009JNI')
                    && a.Venere_Module_ID__c == null
                    && a.Venere_ID__c == null
                    && a.Request_Venere_ID__c == TRUE
                    && beforeUpdate.Request_Venere_ID__c == FALSE)
                {
                    system.debug('Here is the account id: ' + a.Id);
                    newCase.add(new Case(
                        accountID = a.id,
                        Origin = 'Market Manager',
                        Priority = 'Medium',
                        RecordTypeID = '012T00000000Obu', //HDM - Venere Request ID
                        Status = 'New',
                        Subject = 'Venere ID Request',
                        Description = 'Please create a new Venere ID for ' + a.Name)
                    );
                }
        }
    }

    insert newCase;
    */