//
//  DefaultImageView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.11.2024.
//

import SwiftUI

struct DefaultImageView: View {
    var body: some View {
        Image("cookbook")
            .resizable()
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    DefaultImageView()
}
