public class SWProcessingMaterialEntry{

    public List<Processing_Material__c> materials {get; set;}
    private final SW_Process_Request__c processRequest;
    
    public SWProcessingMaterialEntry(ApexPages.StandardController myController) {
        processRequest = (SW_Process_Request__c)myController.getrecord();
        materials = new List<Processing_Material__c>();
       
        // Processing_Material__c processingMaterial = new Processing_Material__c();
        // processingMaterial.Process_Request__c = processRequest.id;
        // materials.add(processingMaterial); 
        
        for (Processing_Material__c mat : [select Group__c, Lot_Number__c, Kilos__c, Blow__c, Lying__c, Number_of_Bales__c, Wool_Description__c, 
        Wash_In__c
                                            from Processing_Material__c 
                                            where Process_Request__c = :processRequest.id]){ 
            Processing_Material__c processingMaterial = new Processing_Material__c();
            //processingMaterial.Process_Request__c = processRequest.id;
            //processingMaterial.Group__c = mat.Group__c;
            processingMaterial = mat;
            materials.add(processingMaterial); 

        } 


        }

    public void addrow() {
        Processing_Material__c processingMaterial = new Processing_Material__c();
        processingMaterial.Process_Request__c = processRequest.id;
        materials.add(processingMaterial);}
      
    public void removerow(){
        Integer i = materials.size();
        materials.remove(i-1);}
            
    public PageReference save() {
        upsert materials;
        //PageReference home = new PageReference('/home/home.jsp');
        //home.setRedirect(true);
        //return home; }}
        PageReference parrec = new PageReference('/'+processRequest.id);
        parrec.setRedirect(true);
        return parrec; }}