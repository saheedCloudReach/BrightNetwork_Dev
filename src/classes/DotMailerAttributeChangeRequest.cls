public class DotMailerAttributeChangeRequest {
     
    public String email;
    public Boolean lead;
    public Boolean accepted;

    public List<DotMailerField> fields = new List<DotMailerField>();
    
    
    public class DotMailerField {
        public String fieldName;
    	public String fieldValue;
    }

}