//
//  ResturantAppApp.swift
//  ResturantApp
//
//  Created by Carl Duncan on 10/22/22.
//

import SwiftUI

@main
struct ResturantAppApp: App {
    
    @State private var menus: [Menu] = []
    @State var isOnboarding = true
    @ObservedObject var cart: Order = Order.shared
    @State private var tabSelection = 1
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView(isOnboarding: $isOnboarding, menus: $menus)
            } else {
                TabView(selection: $tabSelection) {
                    ContentView(menus: $menus)
                        .tabItem {
                            VStack {
                                Text("Menu")
                                Image(systemName: "fork.knife")
                                    .renderingMode(.template)
                            }
                        }
                        .tag(1)
                        
                    CartView(cart: cart, tabSelection: $tabSelection)
                        .tabItem {
                            VStack {
                                Text("Cart")
                                Image(systemName: "takeoutbag.and.cup.and.straw")
                                    .renderingMode(.template)
                            }
                            
                        }
                        .badge(cart.items.count > 0 ? "\(cart.items.count)" : nil)
                        .tag(2)
                }
                .accentColor(.black)
            
                    
            }
        }
    }
}
