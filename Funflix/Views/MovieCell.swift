//
//  MovieCell.swift
//  Funflix
//
//  Created by Daniil Akmatov on 27/5/21.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie
    
    var body: some View {
        HStack (alignment: .top, spacing: 20) {
            AsyncImage(url: URL(string: movie.posterPath)!) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.4))
            }
            image: { (img) -> Image in
                Image(uiImage: img)
                    .resizable()
            }
            .frame(width: 100, height: 160)
            .animation(.easeInOut(duration: 0.5))
            .transition(.opacity)
            .scaledToFill()
            .cornerRadius(15)
            .shadow(radius: 15)
        }
    }
}
