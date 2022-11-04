//
//  MenuItemCardView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 10/29/22.
//

import SwiftUI

struct MenuItemDetailView: View {
    
    
    var item: MenuItem
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {

        VStack(alignment: .leading, spacing: 0) {
          // CARD IMAGE
            if let path = item.imageName {
                let _ = print(path)
                let url = URL(string: path)
                AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):

                            image.renderingMode(.original)
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
                        default:
                            Rectangle()
                                .frame(width: 90, height: 90)
                                .opacity(0)
                        }
                }
            }
            
//          Image(item.imageName)
//            .resizable()
//            .scaledToFit()
//            .overlay(
//              HStack {
//                Spacer()
//                VStack {
//                // TODO: Make this an AsyncImage
//                  Image(systemName: "bookmark")
//                    .font(Font.title.weight(.light))
//                    .foregroundColor(Color.white)
//                    .imageScale(.small)
//                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
//                    .padding(.trailing, 20)
//                    .padding(.top, 22)
//                  Spacer()
//                }
//              }
//            )
          
          VStack(alignment: .leading, spacing: 12) {
            // TITLE
              Text(item.itemName)
              .font(.system(.title, design: .rounded))
              .fontWeight(.bold)
              .foregroundColor(Color("ColorMedium"))
              .lineLimit(1)
            
            // HEADLINE
            Text(item.itemDescription ?? "")
              .font(.system(.body, design: .rounded))
              .foregroundColor(Color.gray)
              .italic()
            
            // RATING
              HStack {
              
                  Text("Customer rating: ")
                      .font(.caption)
                      .foregroundColor(Color.gray)
                  Spacer()
                  RatingView(rating: item.rating)
              }
            
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
        Spacer()
        }
        
        
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var item = MenuItem(itemName: "West Coast Burger", imageName: "LgFancyBurger", iconName: "", itemDescription: "Guacamole, Monterey jack cheese on a buttered, toasted whole-wheat bun with mayo, lettuce, tomato & onion.", price: 9.95, rating: 8)
    static var previews: some View {
        MenuItemDetailView(item: item)
    }
}
