//
//  ContentView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 10/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataSvc: DataService = DataService.shared
    @State private var menus: [Menu] = []
    
    var body: some View {
        List {
            ForEach(menus, id: \.self) { menu in
                Section(menu.name) {
                    ForEach(menu.menuItems, id: \.self) { item in
                        VStack {
                            Text(item.itemName)
                        }
                    }
                }
              
            }
        }
        .onAppear {
            Task { menus = await dataSvc.getMenuData() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
