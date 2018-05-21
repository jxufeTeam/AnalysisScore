package cn.jxufe.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "simulation", schema = "CEE_Helper", catalog = "")
public class SimulationEntity {
    private int id;
    private int category;
    private String province;
    private String link;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "category", nullable = false)
    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
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
    @Column(name = "link", nullable = false, length = 255)
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SimulationEntity that = (SimulationEntity) o;
        return id == that.id &&
                category == that.category &&
                Objects.equals(province, that.province) &&
                Objects.equals(link, that.link);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, category, province, link);
    }
}
