/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package features;

/**
 *
 * Original project contributors
 */
// INHERITANCE
// Inheritance: RegularCustomer extends the abstract Customer class.
public class RegularCustomer extends Customer {

    public RegularCustomer(String name, String phoneNumber) {
        super(name, phoneNumber);
    }

    // Polymorphism: regular customers receive no loyalty discount.
    @Override
    public double calculateDiscount(double totalAmount) {
        return 0; // No ada discount
    }
}
