package controller;

public class FriendListBean {

    private int fd_id;
    private String UserName;
    private String FriendName;
    private boolean Confirm;
    public boolean valid;

    public int getFd_id() {
        return fd_id;
    }

    public void setFd_id(int fd_id) {
        this.fd_id = fd_id;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getFriendName() {
        return FriendName;
    }

    public void setFriendName(String FriendName) {
        this.FriendName = FriendName;
    }

    public boolean isConfirm() {
        return Confirm;
    }

    public void setConfirm(boolean Confirm) {
        this.Confirm = Confirm;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean Valid) {
        this.valid = Valid;
    }

}
