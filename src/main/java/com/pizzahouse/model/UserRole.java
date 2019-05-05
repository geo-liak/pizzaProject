package com.pizzahouse.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author stargazer
 */
@Entity
@Table(name="user_role")
public class UserRole {
    
    @Id
    @Column(name="id")
    private Long id;
    
    @Column(name="user_id")
    private Long userId;
    
    @Column(name="role_id")
    private Long roleId;

    public UserRole() {
    }

    public UserRole(Long id, Long userId, Long roleId) {
        this.id = id;
        this.userId = userId;
        this.roleId = roleId;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId() {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "UserRole{" + "id=" + id + ", userId=" + userId + ", roleId=" + roleId + '}';
    }


    
    
    
}
