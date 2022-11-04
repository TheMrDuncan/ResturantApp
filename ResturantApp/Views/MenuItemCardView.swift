//
//  MenuItemCardView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 11/2/22.
//

import SwiftUI

struct MenuItemCardView: View {
    
    @State var item: MenuItem
    var isBurger: Bool
    @State private var showModal: Bool = false
    @ObservedObject var cart: Order
    var body: some View {
        
        HStack {
            VStack {
                if let path = item.iconName {
                    let url = URL(string: path)
                    AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                if(!isBurger){
                                image.renderingMode(.original)
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle().stroke(.white, lineWidth: 3)
                                    }
                                    .padding(.top, 20)
                                } else {
                                    image.renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 90, height: 90)
                                        .padding(.top, 20)
                                }
                                    
                            default:
                                Rectangle()
                                    .frame(width: 90, height: 90)
                                    .opacity(0)
                            }
                    }
                }
                Text(item.itemName)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                HStack {
                    Spacer()
                    Text("Rating: \(item.rating)")
                        .font(.footnote)
                        .foregroundColor(Color.init( red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 0.50))
                    Image(systemName: "star")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                        .padding(.trailing, 25)
                }.padding(.top, 1)
                Spacer()
                HStack {
                    Text("$\(item.price, specifier: "%.2f")")
                        .font(.body)
                    Spacer()
                 Image(systemName: "plus.circle.fill")
                        .onTapGesture {
                            let cartItem = CartItem(name: item.itemName, price: item.price)
                            cart.items.append(cartItem)
                        }
                    
                }
                .padding()
            }
            .frame(width: 190, height: 250)
            .background(Color.init( red: 159 / 255, green: 160 / 255, blue: 164 / 255, opacity: 0.25))
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
            .cornerRadius(12)
        
        }
        .onTapGesture {
          self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            MenuItemDetailView(item: item)
        }
        
        
                
                
    }
}


struct MenuItemCardView_Previews: PreviewProvider {
    static var item = MenuItem(itemName: "West Coast Burger", imageName: "LgFancyBurger", iconName: "", itemDescription: "Guacamole, Monterey jack cheese on a buttered, toasted whole-wheat bun with mayo, lettuce, tomato & onion.", price: 9.95, rating: 4)
    static var previews: some View {
        MenuItemCardView(item: item , isBurger: true,cart: Order.shared)
    }
}
