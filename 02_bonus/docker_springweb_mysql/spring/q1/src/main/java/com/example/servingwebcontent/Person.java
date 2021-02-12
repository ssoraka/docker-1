package com.example.servingwebcontent;

public class Person {

	private final String name;
	private final String surname;
	private final String position;

	public Person(String name, String surname, String position) {
		this.surname = surname;
		this.name = name;
		this.position = position;
	}

	public String getSurname() {
		return surname;
	}

	public String getName() {
		return name;
	}

	public String getPosition() {
		return position;
	}

}
