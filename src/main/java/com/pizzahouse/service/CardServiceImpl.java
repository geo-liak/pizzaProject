package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Card;
import com.pizzahouse.repository.CardRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;


public class CardServiceImpl implements CardService {
    
    @Autowired
    CardRepository cardRepository;

    @Override
    public List<Card> findAll() {
     List<Card> card = cardRepository.findAll();
        return card;    }

    @Override
    public List<Card> findByUserId(Long userId) {
        return cardRepository.findByUserId(userId);
    }

    @Override
    public Card find(Long id) {
        return cardRepository.findById(id);
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        checkExisting(id);

        cardRepository.deleteById(id);
    }

    @Override
    public Card save(Card card) throws ResourceNotFoundException {
     checkExisting(card.getId());

        return cardRepository.save(card);
    }

private void checkExisting(Long id) throws ResourceNotFoundException {

        if (id != null) {
            Card existing = find(id);
            if (existing == null) {
                throw new ResourceNotFoundException("Entity not found");
            }
        }
    }



}
