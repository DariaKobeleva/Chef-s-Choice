//
// CustomKFImage.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI
import Kingfisher

struct CustomKFImageView: View {
    
    let imageURL: URL
    
    var body: some View {
        KFImage(imageURL)
            .placeholder {
                Image("defaultImage")
                    .resizable()
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .aspectRatio(contentMode: .fit)
            }
            .cacheOriginalImage()
            .cacheMemoryOnly()
            .fade(duration: 0.15)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    CustomKFImageView(imageURL: URL(string: "https://www.themealdb.com/images/ingredients/Chili%20Powder.png")!)
}
