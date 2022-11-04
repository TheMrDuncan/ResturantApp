//
//  CartView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 11/2/22.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var cart: Order
    @State var isPaying: Bool = false
    @State var hasPaid: Bool = false
    @Binding var tabSelection: Int
    
    var body: some View {
        ZStack {
           
            if cart.items.count > 0 {
                List {
                    ForEach(cart.items) { item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price, specifier: "%.2f")")
                        }
                    }
                    .onDelete(perform: delete)
                    
                    Spacer()
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text("$\(cart.subTotal, specifier: "%.2f")")
                            .font(.footnote)
                    }
                    HStack {
                        Text("Sales Tax")
                        Spacer()
                        Text("\((cart.salesTax * 100), specifier: "%.2f")%")
                            .font(.footnote)
                    }
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("$\(cart.total, specifier: "%.2f")")
                    }
                }
                Spacer()
                if(!isPaying){
                    Button (action: {
                        isPaying = true
                        
                    } ) {
                        HStack {
                            Image(systemName: "creditcard.and.123")
                                .padding(.trailing)
                            
                            Text("Pay now")
                                .padding(.leading)
                        }
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(width: 400, height: 15, alignment: .center)
                    .padding()
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear {
                            withAnimation {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                // Clear the cart of items
                                    cart.items = []
                                    isPaying = false
                                    hasPaid = true
                                }
                            }
                        }
                }
                
            }
            else {
                if(hasPaid) {
                    Text("Thanks for visiting and please come again!")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                hasPaid = false
                                tabSelection = 1
                            }
                        }
                } else {
                    Text("Your Cart is Empty")
                }
            }
            
        }
    }

    func delete(at offsets: IndexSet) {
        cart.deleteItem(at: offsets)
    }

}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: Order.shared, tabSelection: .constant(1))
        
    }
}
