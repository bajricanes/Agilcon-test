public with sharing class EMSOValidator {
 
        public String Validate(String EMSO){
            if(!ValidateValue(EMSO))
                return 'EMSO is invalid. EMSO must be numeric.'; 
            else if(!ValidateLength(EMSO))
                return 'EMSO is invalid. EMSO must be 13 numbers long.';
            else if(!ValidateVerificationCode(EMSO))
                return 'EMSO is invalid. Verification code is not correct.';
            else 
                return 'OK';
        }        

        private Boolean ValidateValue(String EMSO){
            //Validate value of the EMSO input, check it's emtpy, null or non-numeric
            return !String.isBlank(EMSO) && !String.isEmpty(EMSO) && EMSO.isNumeric();
        }

        private Boolean ValidateLength(String EMSO){
            //Make sure EMSO is 13 characters long
            return EMSO.length() == 13;
        }

        private Boolean ValidateVerificationCode(String EMSO){    
            //Validate verification code using below calculation      
            integer EMSOSum = 0;
            for (integer i = 7; i > 1; i--){
                EMSOSum += i * (Integer.valueOf(EMSO.Substring(7 - i, 7 - i + 1)) + Integer.valueOf(EMSO.Substring(13 - i, 13 - i + 1)));
            }
            integer control_digit = Math.Mod(EMSOSum, 11) == 0 ? 0 : 11 - Math.Mod(EMSOSum, 11);

            return EMSO.Substring(12, 13) == String.valueOf(control_digit);
        }
    
}