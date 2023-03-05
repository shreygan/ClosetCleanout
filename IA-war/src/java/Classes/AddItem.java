package Classes;

public class AddItem {  //extends Items causes error
    
    public int checkData(String name, String type, String price, String condition, String size, String brand, String link, String notes) {      
        
        if (name.equals("") || type == null || price.equals("") || condition.equals("") || size.equals("") || brand.equals("")) {    
            return 1;
        }
        
        return 0;
    }        
    
    public String get0() {
        return "Added Successfully";
    }
    
    public String get1() {
        return "Please Enter all Data";
    }
}
