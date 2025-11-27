package vn.iotstar.api.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "product_name", columnDefinition = "nvarchar(255)")
    private String name;

    @Column(columnDefinition = "nvarchar(500)")
    private String description;

    private Double price;
    private int quantity;

    @Column(name = "sold_quantity")
    private int soldQuantity; // Số lượng đã bán (cho câu Top 10 bán chạy)

    private String image;

    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate; // Ngày tạo (cho câu Top 10 mới nhất)

    @ManyToOne
    @JoinColumn(name = "category_id")
    @JsonIgnore
    private Category category;

    @PrePersist
    public void onCreate() {
        this.createDate = new Date();
    }
}