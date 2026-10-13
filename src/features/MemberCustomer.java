/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package features;

/**
 *
 * Original project contributors
 */
//inheritance
// Inheritance: MemberCustomer extends the abstract Customer class.
public class MemberCustomer extends Customer {
    private int visitCount;

    public MemberCustomer(String name, String phoneNumber, int visitCount) {
        super(name, phoneNumber); // Call the parent constructor
        this.visitCount = visitCount;
    }

    // Polymorphism: override the discount calculation for members.
    @Override
    public double calculateDiscount(double totalAmount) {
        if (visitCount > 10) {
            return totalAmount * 0.15;
        } else if (visitCount > 5) {
            return totalAmount * 0.10;
        }
        return 0;
    }
}
