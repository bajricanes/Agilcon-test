public class EMSOAPI_ResponseModel{
	public boolean success;
	public String message;	
	public static EMSOAPI_ResponseModel parse(String json){
		return (EMSOAPI_ResponseModel) System.JSON.deserialize(json, EMSOAPI_ResponseModel.class);
	}
}