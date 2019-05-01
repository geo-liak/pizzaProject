package com.pizzahouse.exceptions;

public class ResourceNotFoundException extends Exception {

	public ResourceNotFoundException(Throwable exc) {
		super(exc);
	}

	public ResourceNotFoundException(String message) {
		super(message);
	}

	public ResourceNotFoundException(String message, Throwable exc) {
		super(message, exc);
	}

}
