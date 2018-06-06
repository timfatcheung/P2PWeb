package controller;

public class GroupBean {
    
    private int group_id;
    private String GroupName;
    private String Member1;
    private String Member2;
    private String Member3;
    private String Member4;
    private String Member5;
    public boolean valid;

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }

    public String getGroupName() {
        return GroupName;
    }

    public void setGroupName(String GroupName) {
        this.GroupName = GroupName;
    }

    public String getMember1() {
        return Member1;
    }

    public void setMember1(String Member1) {
        this.Member1 = Member1;
    }

    public String getMember2() {
        return Member2;
    }

    public void setMember2(String Member2) {
        this.Member2 = Member2;
    }

    public String getMember3() {
        return Member3;
    }

    public void setMember3(String Member3) {
        this.Member3 = Member3;
    }

    public String getMember4() {
        return Member4;
    }

    public void setMember4(String Member4) {
        this.Member4 = Member4;
    }

    public String getMember5() {
        return Member5;
    }

    public void setMember5(String Member5) {
        this.Member5 = Member5;
    }
    
        public boolean isValid() {
        return valid;
    }

    public void setValid(boolean Valid) {
        this.valid = Valid;
    }
    
}
