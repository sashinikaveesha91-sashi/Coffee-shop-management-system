/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package features;

/**
 *
 * Original project contributors
 */
public abstract class Customer {
    // Abstraction and encapsulation: shared customer data is private and accessed through getters.
    // ENCAPSULATION: Variabel private
    private String name;
    private String phoneNumber;

    public Customer(String name, String phoneNumber) {
        this.name = name;
        this.phoneNumber = phoneNumber;
    }


    public String getName() { return name; }
    public String getNoHp() { return phoneNumber; }


    // Polymorphism: subclasses provide their own discount calculation.
    public abstract double calculateDiscount(double totalAmount);
}
