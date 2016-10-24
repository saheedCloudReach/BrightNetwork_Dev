public class Utils {
    public static Object getValue(SObject sobj, String field) {
    	String[] splittedField = field.split('\\.');
        
        if (splittedField.size() > 1)
            splittedField[0] = getFieldIfReference(splittedField[0]);
 

        return sobj.get(splittedField[0]);
    }
    
    private static String getFieldIfReference(String field) {
        return field.replace('__r', '__c');
    }
}