public class CreateStudentController{

        @AuraEnabled(cacheable=true)
        public static String ValidateEMSO(String EMSO){
            //Make a API call to EMSO web service to validate          
            EMSOAPI_RequestHandler requestHandler = new EMSOAPI_RequestHandler();            
            EMSOAPI_ResponseModel model = requestHandler.Execute(EMSO);
            
            //Return message from the response
            return model.message; 
        }

        @AuraEnabled
        public static string ValidateEMSOCustom(String EMSO){
            //Call helper class method to validate EMSO
            EMSOValidator helper = new EMSOValidator();
            return helper.Validate(EMSO);
        }
}