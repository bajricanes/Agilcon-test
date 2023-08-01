public class EMSOAPI_RequestHandler {
    public EMSOAPI_ResponseModel Execute(String EMSO){

        //Check if the current instance sandbox
        Boolean isSandbox = [SELECT IsSandbox FROM Organization LIMIT 1].IsSandbox;
        String environment = isSandbox ? 'Sandbox' : 'Production';

        //We expect to have two records of type EMSO API mdt
        //Records are named Sandbox and Production, assuming API URL and possibly some other settings are different for each instance
        EMSO_API__mdt apiInfo = EMSO_API__mdt.getInstance(environment);

        //Prepare the http request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiInfo.Endpoint__c + EMSO);
        request.setMethod(apiInfo.Method__c);

        Http con = new Http();
        EMSOAPI_ResponseModel resModel = new EMSOAPI_ResponseModel();
        
        try {   
            //Send a request and parse response to response model       
            HTTPResponse res = con.send(request);
            resModel = EMSOAPI_ResponseModel.parse(res.getBody());
            
        } catch (Exception e) {
            resModel.success = false;
            resModel.message = e.getMessage();
        }
        //return parsed response model
        return resModel;
    }
}