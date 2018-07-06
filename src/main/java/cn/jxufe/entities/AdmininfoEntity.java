package cn.jxufe.entities;

import javax.persistence.*;

@Entity
@Table(name = "admininfo", schema = "CEE_Helper", catalog = "")
public class AdmininfoEntity {
    private int id;
    private long account;
    private String password;
    private int power;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "account", nullable = false)
    public long getAccount() {
        return account;
    }

    public void setAccount(long account) {
        this.account = account;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 255)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "power", nullable = false)
    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdmininfoEntity that = (AdmininfoEntity) o;

        if (id != that.id) return false;
        if (account != that.account) return false;
        if (power != that.power) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (int) (account ^ (account >>> 32));
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + power;
        return result;
    }
}
