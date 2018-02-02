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
    private String Email;
    private String Gender;
    public boolean valid;
    public boolean OnlineStatus;

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getUserName() {
        return UserName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String Password) {
        this.password = Password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String Password2) {
        this.password2 = Password2;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getGender() {
        return Gender;
    }

    public boolean getOnlineStatus() {
        return OnlineStatus;
    }

    public void getOnlineStatus(boolean OnlineStatus) {
        this.OnlineStatus = OnlineStatus;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean Valid) {
        this.valid = Valid;
    }
}
