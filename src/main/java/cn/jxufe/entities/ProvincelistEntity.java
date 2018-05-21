package cn.jxufe.entities;

import javax.persistence.*;

@Entity
@Table(name = "provincelist", schema = "CEE_Helper", catalog = "")
public class ProvincelistEntity {
    private int id;
    private String name;
    private String provinceline;

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
    @Column(name = "provinceline", nullable = false, length = -1)
    public String getProvinceline() {
        return provinceline;
    }

    public void setProvinceline(String provinceline) {
        this.provinceline = provinceline;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProvincelistEntity that = (ProvincelistEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (provinceline != null ? !provinceline.equals(that.provinceline) : that.provinceline != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (provinceline != null ? provinceline.hashCode() : 0);
        return result;
    }
}
