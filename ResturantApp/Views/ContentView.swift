//
//  ContentView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 10/22/22.
//

import SwiftUI

struct ContentView: View {
    
    let columns = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    @Binding var menus: [Menu]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Spacer()
                VStack {
                Text ("Welcome to")
                    .font(.system(.title, design: .monospaced))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.init(red: 38, green: 38 / 255, blue:  1 / 255))
                    .opacity(0.1)
                Text("Burgertory")
                    .font(.system(.largeTitle, design: .monospaced))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.init(red: 38, green: 38 / 255, blue:  1 / 255, opacity: 1))
                    .glowBorder(color: Color.init(red: 139 / 255, green: 0, blue: 0, opacity: 1), lineWidth: 8)
                }
                Spacer()
            }
            .frame(height: 150)
            .background(Color.init( red: 159 / 255, green: 160 / 255, blue: 164 / 255, opacity: 0.10))
            ScrollView(.vertical, showsIndicators: false){
                ForEach(menus, id: \.self) { menu in
                    Text(menu.name)
                        .fontWeight(.bold)
                        .font(.system(.title, design: .monospaced))
                        .padding()
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns){
                            ForEach(menu.menuItems, id: \.self) { item in
                                MenuItemCardView(item: item, isBurger: menu.name.lowercased() == "burgers", cart: Order.shared)
                            } // MARK: ForEach end
                        } // MARK: LazyVGrid end
                    } // MARK: Scroll View end
                }
            }
            }
            .edgesIgnoringSafeArea(.all)
        .padding(.bottom, 10)
        }
    }
}

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title, design: .serif))
      .foregroundColor(Color("ColorGreenAdaptive"))
      .padding(8)
  }
}
struct ContentView_Previews: PreviewProvider {
    static let menus: [Menu] = []
    static var previews: some View {
        ContentView(menus: .constant(menus))
    }
}
