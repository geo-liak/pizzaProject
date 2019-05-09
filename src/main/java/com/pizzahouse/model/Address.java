package com.pizzahouse.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author stargazer
 */

@Entity
@Table(name="address")
public class Address implements Serializable {


@Id
@GeneratedValue
@Column(name="id")
private Long id;

@NotEmpty
@Column(name="street")
private String street;

@NotNull
@Column(name="number")
private Integer number;

@Column(name="postal_code")
private String postalCode;

@Column(name="floor")
private Integer floor;

@Column(name="notes")
private String notes;

@NotEmpty
@Column(name="telephone")
private String telephone;

@Column(name="user_id")
private Long userId;

    public Address() {
    }

    public Address(String street, Integer number, String postalCode, Integer floor, String notes, String telephone, Long userId) {
        this.street = street;
        this.number = number;
        this.postalCode = postalCode;
        this.floor = floor;
        this.notes = notes;
        this.telephone = telephone;
        this.userId = userId;
    }

    public Address(Long id, String street, Integer number, String postalCode, Integer floor, String notes, String telephone, Long userId) {
        this.id = id;
        this.street = street;
        this.number = number;
        this.postalCode = postalCode;
        this.floor = floor;
        this.notes = notes;
        this.telephone = telephone;
        this.userId = userId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    @Transient
    public String getName() {
        return "" + number +", " + street + ", Postal Code: " + postalCode + ", Floor:" + floor + ", Telephone:" + telephone;
    }

    @Override
    public String toString() {
        return "Address{" + "id=" + id + ", street=" + street + ", number=" + number + ", postalCode=" + postalCode + ", floor=" + floor + ", notes=" + notes + ", telephone=" + telephone + ", userId=" + userId + '}';
    }



    
}
