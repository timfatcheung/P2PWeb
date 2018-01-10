package controller;
/**
 *
 * @author cheungtimfat
 */
public class UserBean {
   private String username;
   private String password; 
   private String firstName;
   private String lastName;
   public boolean valid;   
  
   public void setFirstName(String FirstName) {
         firstName = FirstName;
	}
   public String getFirstName() {
         return firstName;
	}
   
    public String getLastName() {
         return lastName;
			}

      public void setLastName(String newLastName) {
         lastName = newLastName;
			}
			

      public String getPassword() {
         return password;
	}

      public void setPassword(String Password) {
         password = Password;
	}
	
			
      public String getEmail() {
         return username;
			}

      public void setEmail(String Email) {
         username = Email;
			}

				
      public boolean isValid() {
         return valid;
	}

      public void setValid(boolean Valid) {
         valid = Valid;
	}	
}

