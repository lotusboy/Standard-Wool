trigger sw_process_request_trigger on SW_Process_Request__c (before insert, after update) {
    // TODO: make bulk safe
    for ( SW_Process_Request__c request: System.Trigger.new) {
        if(trigger.isInsert) {
            request.status__c = 'Draft';
        } else if(trigger.isUpdate) {
            
            if(request.status__c == 'Initial Request - Submitted'){
                    
                if(request.status__c == request.LastStatus__c){
                    // no action required as status has not changed
                } else {
                    
                }
            }
        }
    }
}