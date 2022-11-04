//
//  MenuItemRatingView.swift
//  ResturantApp
//
//  Created by Carl Duncan on 11/2/22.
//

import SwiftUI

struct RatingView: View {
    
    var rating: Int
    
    var body: some View {
      HStack(alignment: .center, spacing: 5) {
          if(rating > 0){
            ForEach(1...(rating), id: \.self) { _ in
              Image(systemName: "star.fill")
                .font(.footnote)
                .foregroundColor(Color.yellow)
            }
          }
      }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 10)
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
