package cn.jxufe.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "collegelist", schema = "CEE_Helper", catalog = "")
public class CollegelistEntity {
    private int id;
    private String name;
    private String badge;
    private String type;
    private String belong;
    private String province;
    private Integer academician;
    private Integer doctor;
    private Integer master;
    private String collegesite;
    private String collegebrochure;
    private String collegeguide;
    private String collegeline;
    private String majorlist;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "badge", nullable = true, length = 255)
    public String getBadge() {
        return badge;
    }

    public void setBadge(String badge) {
        this.badge = badge;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 255)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "belong", nullable = true, length = 255)
    public String getBelong() {
        return belong;
    }

    public void setBelong(String belong) {
        this.belong = belong;
    }

    @Basic
    @Column(name = "province", nullable = false, length = 255)
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Basic
    @Column(name = "academician", nullable = true)
    public Integer getAcademician() {
        return academician;
    }

    public void setAcademician(Integer academician) {
        this.academician = academician;
    }

    @Basic
    @Column(name = "doctor", nullable = true)
    public Integer getDoctor() {
        return doctor;
    }

    public void setDoctor(Integer doctor) {
        this.doctor = doctor;
    }

    @Basic
    @Column(name = "master", nullable = true)
    public Integer getMaster() {
        return master;
    }

    public void setMaster(Integer master) {
        this.master = master;
    }

    @Basic
    @Column(name = "collegesite", nullable = false, length = 255)
    public String getCollegesite() {
        return collegesite;
    }

    public void setCollegesite(String collegesite) {
        this.collegesite = collegesite;
    }

    @Basic
    @Column(name = "collegebrochure", nullable = true, length = -1)
    public String getCollegebrochure() {
        return collegebrochure;
    }

    public void setCollegebrochure(String collegebrochure) {
        this.collegebrochure = collegebrochure;
    }

    @Basic
    @Column(name = "collegeguide", nullable = true, length = -1)
    public String getCollegeguide() {
        return collegeguide;
    }

    public void setCollegeguide(String collegeguide) {
        this.collegeguide = collegeguide;
    }

    @Basic
    @Column(name = "collegeline", nullable = false, length = -1)
    public String getCollegeline() {
        return collegeline;
    }

    public void setCollegeline(String collegeline) {
        this.collegeline = collegeline;
    }

    @Basic
    @Column(name = "majorlist", nullable = false, length = -1)
    public String getMajorlist() {
        return majorlist;
    }

    public void setMajorlist(String majorlist) {
        this.majorlist = majorlist;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CollegelistEntity that = (CollegelistEntity) o;
        return id == that.id &&
                Objects.equals(name, that.name) &&
                Objects.equals(badge, that.badge) &&
                Objects.equals(type, that.type) &&
                Objects.equals(belong, that.belong) &&
                Objects.equals(province, that.province) &&
                Objects.equals(academician, that.academician) &&
                Objects.equals(doctor, that.doctor) &&
                Objects.equals(master, that.master) &&
                Objects.equals(collegesite, that.collegesite) &&
                Objects.equals(collegebrochure, that.collegebrochure) &&
                Objects.equals(collegeguide, that.collegeguide) &&
                Objects.equals(collegeline, that.collegeline) &&
                Objects.equals(majorlist, that.majorlist);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, badge, type, belong, province, academician, doctor, master, collegesite, collegebrochure, collegeguide, collegeline, majorlist);
    }
}
