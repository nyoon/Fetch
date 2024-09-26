//
//  MealCard.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/26/24.
//

import SwiftUI

struct MealCard: View {
    let width: CGFloat
    let name: String
    let thumbURL: URL
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            CircularImageView(
                imageURL: thumbURL,
                width: width,
                height: width
            )
            
            Text(name)
                .frame(maxWidth: width)
                .font(.title3)
                .bold()
                .lineLimit(0)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundStyle(.black)
        }
        .padding([.horizontal, .vertical], 12)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 5)  // Border with color and width
        )
    }
}
