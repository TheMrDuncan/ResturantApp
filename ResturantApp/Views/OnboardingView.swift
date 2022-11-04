//
//  OnboardingView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 10/23/22.
//

import SwiftUI

struct OnboardingView: View {
    
//    @ObservedObject var dataSvc: DataService = DataService.shared
    
    @Binding var isOnboarding: Bool
    @Binding var menus: [Menu]
    
    @State private var pulsate = false
    
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                
            if isOnboarding == true {
                
                VStack {
                    VStack {
                        Text("Burgertory")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.init(red: 1, green: 38 / 255, blue:  38 / 255, opacity: 1))
                            .kerning(12.0)
                            .glowBorder(color: Color.init(red: 139 / 255, green: 0, blue: 0, opacity: 1), lineWidth: 8)
                        Image("top-bun")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 566.0 / 4, height: 255.0 / 4)
                            .padding(-5)
                        Image("pickles-onions")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width:764.0 / 4, height: 179.0 / 4)
                            .padding(-5)
                        Image("bacon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width:690.0 / 4, height: 226.0 / 4)
                            .padding(-5)
                        Image("cheese")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width:736.0 / 4, height: 351.0 / 4)
                            .padding(-5)
                        Image("patty")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width:620.0 / 4, height: 203.0 / 4)
                            .padding(-5)
                        Image("maters")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width:709.0 / 4, height: 231.0 / 4)
                            .padding(-5)
                        Image("lettuce")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width:734.0 / 4, height: 379.0 / 4)
                            .padding(-5)
                        Image("bottom-bun")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width:624.0 / 4, height: 195.0 / 4)
                            .padding(-5)
                    }
                    .padding(.bottom, 25)
                
                    VStack {
                        Image(systemName: "fork.knife.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(pulsate ? 1 : 0.5)
//                            .foregroundColor(.green)
                            .foregroundColor(Color.init(red: 1, green: 38 / 255, blue:  38 / 255, opacity: 1))
                            .animation(nil, value: isOnboarding)
                            .onAppear() {
                                withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).speed(2),
                                  {
                                  pulsate.toggle()
                                    // Add some wait time for animation drama...
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    // Close the OnboardingView
                                    isOnboarding = false
                                    }
                                })
                            }
                            .task {
                                // Load menu data
                                menus = await MenuService.getMenuData()
                                
                            }
                        Text("...LOADING...")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.init(red: 1, green: 38 / 255, blue:  38 / 255, opacity: 1))
                            .kerning(8.0)
//                            .glowBorder(color: Color.init(red: 139 / 255, green: 0, blue: 0, opacity: 1), lineWidth: 8)
                    }
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static let menus: [Menu] = []
    static var previews: some View {
        OnboardingView(isOnboarding: .constant(true), menus: .constant(menus))
    }
}
