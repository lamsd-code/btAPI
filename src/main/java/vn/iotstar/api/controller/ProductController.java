package vn.iotstar.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.api.entity.Product;
import vn.iotstar.api.repository.ProductRepository;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    // API thêm sản phẩm để có dữ liệu test
    @PostMapping
    public Product createProduct(@RequestBody Product product) {
        return productRepository.save(product);
    }

    // YÊU CẦU 1: Hiển thị tất cả sản phẩm theo từng danh mục
    @GetMapping("/category/{categoryId}")
    public List<Product> getProductsByCategory(@PathVariable Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    // YÊU CẦU 2: Hiển thị 10 sản phẩm có số lượng bán nhiều nhất
    @GetMapping("/best-sellers")
    public List<Product> getBestSellingProducts() {
        return productRepository.findTop10ByOrderBySoldQuantityDesc();
    }

    // YÊU CẦU 3: Hiển thị 10 sản phẩm được tạo <= 7 ngày
    @GetMapping("/latest")
    public List<Product> getLatestProducts() {
        // Lấy 10 sản phẩm mới nhất từ DB
        List<Product> products = productRepository.findTop10ByOrderByCreateDateDesc();

        // Lọc lại trong code Java những sản phẩm tạo trong vòng 7 ngày qua
        Date sevenDaysAgo = new Date(System.currentTimeMillis() - 7L * 24 * 60 * 60 * 1000);
        return products.stream()
                .filter(p -> p.getCreateDate().after(sevenDaysAgo))
                .collect(Collectors.toList());
    }
}