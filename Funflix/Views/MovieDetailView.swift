//
//  MovieDetailView.swift
//  Funflix
//
//  Created by Daniil Akmatov on 23/6/21.
//
import SwiftUI

struct MovieDetailView: View {
    
    @StateObject private var loader: ImageLoader
    @ObservedObject private var movieManager = MovieDownloadManager()
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        _loader = StateObject(wrappedValue: ImageLoader(url: URL(string: movie.posterPath)!, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            backgroundView
        }
    }
    
    private var backgroundView: some View {
        imageView.onAppear {
            loader.load()
        }
        .blur(radius: 100)
    }
    
    private var imageView: some View {
        Group {
            
        }
    }
}
