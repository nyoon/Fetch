//
//  CircularImageView.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/26/24.
//

import SwiftUI

struct CircularImageView: View {
    let imageURL: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Circle())
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4)
                    )
            case .failure:
                Circle()
                    .frame(width: width, height: height)
                    .background(Color.gray.opacity(0.3))
            @unknown default:
                EmptyView()
            }
        }
    }
}
