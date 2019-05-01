package com.pizzahouse.controller;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AbstractController {

    @InitBinder
    public void binder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            public void setAsText(String value) {
                try {
                    Date parsedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value);
                    setValue(new Date(parsedDate.getTime()));
                } catch (java.text.ParseException e) {
                    try {
                        Date parsedDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(value);
                        setValue(new Date(parsedDate.getTime()));
                    } catch (java.text.ParseException e2) {
                        setValue(null);
                    }
                }
            }
        });

    }
}
