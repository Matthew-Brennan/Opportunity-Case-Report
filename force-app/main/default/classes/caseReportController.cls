public with sharing class caseReportController {
    
    public List<Opportunity> opptyList;
    public List<OpportunityLineItem> uniqueList = new List<OpportunityLineItem>();
    public List<Case> caseList;

    public caseReportController() {

        opptyList = [SELECT Id,Name,Account.Name, 

                                  (SELECT Product2Id, Opp_Product_Name__c, Case__c, Case__r.Status, Case__r.OwnerId, Case__r.Subject FROM OpportunityLineItems) 

                        FROM Opportunity WHERE Id =: ApexPages.currentPage().getParameters().get('Id')];


  

    }

    public List<Opportunity> getopptyList() {

        System.debug(opptyList);
        System.debug(opptyList[0].OpportunityLineItems);
        for (OpportunityLineItem oli : opptyList[0].OpportunityLineItems){
            if(!uniqueList.contains(oli))
            {
            uniqueList.add(oli);
            }
        }
        return opptyList;

    }

    public List<OpportunityLineItem> getuniqueList() {

        System.debug(opptyList);
        System.debug(opptyList[0].OpportunityLineItems);
        for (OpportunityLineItem oli : opptyList[0].OpportunityLineItems){
            if(!uniqueList.contains(oli))
            {
            uniqueList.add(oli);
            }
        }
        return uniqueList;

    }

}