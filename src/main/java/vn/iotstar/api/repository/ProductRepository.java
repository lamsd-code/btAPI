package vn.iotstar.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.api.entity.Product;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // 1. Tìm sản phẩm theo danh mục
    List<Product> findByCategoryId(Long categoryId);

    // 2. Top 10 sản phẩm bán chạy nhất (Giảm dần theo soldQuantity)
    List<Product> findTop10ByOrderBySoldQuantityDesc();

    // 3. Top 10 sản phẩm mới nhất (Sắp xếp theo ngày tạo giảm dần)
    // Lưu ý: Logic lọc <= 7 ngày sẽ xử lý ở Service bằng cách truyền ngày vào
    List<Product> findTop10ByOrderByCreateDateDesc();
}