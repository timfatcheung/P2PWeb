package controller;
/**
 *
 * @author cheungtimfat
 */
public class UserBean {
   private String username;
   private String password; 
   private String password2;
   private String UserName;
   public boolean valid;  
   public boolean OnlineStatus;
  
   public void setUserName(String UserName) {
         UserName = UserName;
	}
   public String getUserName() {
         return UserName;
	}
   			
      public String getPassword() {
         return password;
	}

      public void setPassword(String Password) {
         password = Password;
	}
      
      public String getPassword2() {
         return password2;
	}

      public void setPassword2(String Password2) {
         password2 = Password2;
	}
	
			
      public String getEmail() {
         return username;
			}

      public void setEmail(String Email) {
         username = Email;
			}

      
       public boolean getOnlineStatus() {
         return OnlineStatus;
			}

      public void getOnlineStatus(boolean OnlineStatus) {
         OnlineStatus = OnlineStatus;
			}

				
      public boolean isValid() {
         return valid;
	}

      public void setValid(boolean Valid) {
         valid = Valid;
	}	
}

