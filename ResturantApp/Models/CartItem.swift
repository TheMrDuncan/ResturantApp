//
//  CartItem.swift
//  ResturantApp
//
//  Created by Carl Duncan on 11/2/22.
//

import Foundation
struct CartItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
}

@MainActor class Order: ObservableObject {
    // Singleton Pattern here
    static let shared = Order()
   
    @Published var items: [CartItem]
    @Published var salesTax: Double
    @Published var discount: Double
    
    var subTotal: Double {
        get {
            var subTotal: Double = 0
            for item in items {
                subTotal += item.price
            }
            return subTotal
        }
    }
    var total: Double {
        get {
            return (subTotal + (salesTax * subTotal)) - self.calculateDiscountAmount()
        }
    }
    
    private init () {
        self.items = []
        self.salesTax = 0.0725
        self.discount = 0.0
    }
 
    private func calculateDiscountAmount() -> Double {
        if discount > 0 {
            return (subTotal + (salesTax * subTotal)) * discount
        } else {
            return discount
        }
        
    }
    
    public func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
  
    
}
