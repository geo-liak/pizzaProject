package com.pizzahouse.model.specifications;

import com.pizzahouse.model.Product;
import org.springframework.data.jpa.domain.Specification;

public class ProductSpecification {

    public static Specification<Product> containsText(String text) {
        // if query is number search for id
        if (text.matches("\\d+") ) {
            final Long queryId = Long.parseLong(text);
            return (root, query, builder) -> builder.equal(root.get("id"), queryId);

        } else {
            // if query is text search inside field with 'like' queries
            String finalQuery = "%" + text + "%";
            return (root, query, builder) -> builder.or(
                    builder.like(root.get("name"), finalQuery),
                    builder.like(root.get("description"), finalQuery),
                    builder.like(root.get("ingredients"), finalQuery)
            );
        }
    }
}
