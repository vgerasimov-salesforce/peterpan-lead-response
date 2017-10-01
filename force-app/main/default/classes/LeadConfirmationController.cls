public class LeadConfirmationController {
    public String ObjectId {get;set;}
    
    public LeadConfirmationController () {
        ObjectId = ApexPages.currentPage().getParameters().get('ObjectId');
    }
    public PageReference InitPage() {
        List<Lead> lead = [SELECT Id, Email_Confirmed__c FROM Lead WHERE Id=:ObjectId LIMIT 1];
        if(!lead.IsEmpty()){
            lead[0].Email_Confirmed__c = true;
            UPDATE lead;
        }
        return null;
    }
}