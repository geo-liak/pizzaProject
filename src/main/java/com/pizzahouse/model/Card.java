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

@Entity
@Table(name="credit_card")
public class Card implements Serializable {

@Id
@GeneratedValue
@Column(name="id")
private Long id;
    
@NotEmpty
@Column(name="cardNumber")
private String cardNumber;

@NotNull
@Column(name="ccv")
private Integer ccv;

@NotNull
@Column(name="cardHolderName")
private String cardHolderName;

@NotNull
@Column(name="expiryMonth")
private Integer expiryMonth;

@NotNull
@Column(name="expiryYear")
private Integer expiryYear;


@Column(name="user_id")
private Long userId;

public Card(){
    
}

    public Card(String cardNumber, Integer ccv, String cardHolderName, Integer expiryMonth, Integer expiryYear, Long userId) {
        this.cardNumber = cardNumber;
        this.ccv = ccv;
        this.cardHolderName = cardHolderName;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
        this.userId = userId;
    }

    public Card(Long id, String cardNumber, Integer ccv, String cardHolderName, Integer expiryMonth, Integer expiryYear, Long userId) {
        this.id = id;
        this.cardNumber = cardNumber;
        this.ccv = ccv;
        this.cardHolderName = cardHolderName;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
        this.userId = userId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Integer getCcv() {
        return ccv;
    }

    public void setCcv(Integer ccv) {
        this.ccv = ccv;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }

    public Integer getExpiryMonth() {
        return expiryMonth;
    }

    public void setExpiryMonth(Integer expiryMonth) {
        this.expiryMonth = expiryMonth;
    }

    public Integer getExpiryYear() {
        return expiryYear;
    }

    public void setExpiryYear(Integer expiryYear) {
        this.expiryYear = expiryYear;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    
    @Transient
    public String getName() {
        return "CardNumber=" + cardNumber + ", ccv=" + ccv + ", cardHolderName=" + cardHolderName + ", expiryMonth=" + expiryMonth + ", expiryYear=" + expiryYear;
    }
    
    @Override
    public String toString() {
        return "Card{" + "id=" + id + ", cardNumber=" + cardNumber + ", ccv=" + ccv + ", cardHolderName=" + cardHolderName + ", expiryMonth=" + expiryMonth + ", expiryYear=" + expiryYear + ", userId=" + userId + '}';
    }


}
