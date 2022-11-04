//
//  MenuItemCardView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 10/29/22.
//

import SwiftUI

struct MenuItemDetailView: View {
    
    @State private var showModal: Bool = false
    var item: Menu.MenuItem
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
          // CARD IMAGE
          Image(item.imageName)
            .resizable()
            .scaledToFit()
            .overlay(
              HStack {
                Spacer()
                VStack {
                  Image(systemName: "bookmark")
                    .font(Font.title.weight(.light))
                    .foregroundColor(Color.white)
                    .imageScale(.small)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                    .padding(.trailing, 20)
                    .padding(.top, 22)
                  Spacer()
                }
              }
            )
          
          VStack(alignment: .leading, spacing: 12) {
            // TITLE
              Text(item.itemName)
              .font(.system(.title, design: .serif))
              .fontWeight(.bold)
              .foregroundColor(Color("ColorGreenMedium"))
              .lineLimit(1)
            
            // HEADLINE
            Text(item.itemDescription ?? "")
              .font(.system(.body, design: .serif))
              .foregroundColor(Color.gray)
              .italic()
            
            // RATING
              RatingView(rating: item.rating)
            
            // COOKING
//            RecipeCookingView(recipe: recipe)
          }
          .padding()
          .padding(.bottom, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .padding()
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
          self.hapticImpact.impactOccurred()
          self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
//          RecipeDetailView(recipe: self.recipe)
        }
        
      }
}

struct MenuItemCardView_Previews: PreviewProvider {
    static var item = Menu.MenuItem(itemName: "West Coast Burger", imageName: "LgFancyBurger", iconName: "", itemDescription: "Guacamole, Monterey jack cheese on a buttered, toasted whole-wheat bun with mayo, lettuce, tomato & onion.", price: 9.95, rating: 4)
    static var previews: some View {
        MenuItemDetailView(item: item)
    }
}
