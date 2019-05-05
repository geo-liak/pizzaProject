package com.pizzahouse.model.specifications;

import com.pizzahouse.model.User;
import org.springframework.data.jpa.domain.Specification;

/**
 *
 * @author stargazer
 */
public class UserManagementSpecification {

 public static Specification<User> containsText(String text) {
        // if query is number search for id
        if (text.matches("\\d+") ) {
            final Long queryId = Long.parseLong(text);
            return (root, query, builder) -> builder.equal(root.get("id"), queryId);

        } else {
            // if query is text search inside field with 'like' queries
            String finalQuery = "%" + text + "%";
            return (root, query, builder) -> builder.or(
                    builder.like(root.get("firstName"), finalQuery),
                    builder.like(root.get("lastName"), finalQuery),
                    builder.like(root.get("username"), finalQuery)
            );
        }
    }


    
}
