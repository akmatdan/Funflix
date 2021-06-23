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
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    headerView
                    moviePosterView
                    movieOverView
                    reviewLink
                    castInfo
                    Spacer()
                }.padding(.top, 84)
                .padding(.horizontal, 32)
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    private var backgroundView: some View {
        imageView.onAppear {
            loader.load()
        }
        .blur(radius: 100)
    }
    
    private var imageView: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                Rectangle().foregroundColor(Color.gray.opacity(0.4))
            }
        }
    }
    
    private var headerView: some View {
        VStack {
            Text(movie.titleWithLanguage)
                .font(.title)
            Text("Realise Date: \(movie.release_date ?? "-")")
                .font(.subheadline)
        }.foregroundColor(.white)
    }
    
    private var moviePosterView: some View {
        HStack(alignment: .center) {
            Spacer()
            imageView
                .frame(width: 200, height: 320)
                .cornerRadius(20)
            Spacer()
        }
    }
    
    private var movieOverView: some View {
        Text(movie.overview ?? "-")
            .font(.body)
            .foregroundColor(.white)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, 16)
    }
    
    private var reviewLink: some View {
        ZStack {
            Divider()
            NavigationLink(destination: Text("Some review")) {
                HStack {
                    Text("Reviews")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Divider()
        }
    }
    
    private var castInfo: some View {
        VStack(alignment: .leading) {
            Text("Cast")
                .foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(movieManager.cast) { cast in
                        VStack {
                            AsyncImage(url: URL(string: cast.profilePhoto)!) {
                                Rectangle().foregroundColor(Color.gray.opacity(0.4))
                            } image: { (img) -> Image in
                                Image(uiImage: img)
                                    .resizable()
                            }
                        }
                    }
                }
            }
        }
    }
}
