package vn.iotstar.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.api.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}