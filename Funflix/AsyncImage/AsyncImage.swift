//
//  AsyncImage.swift
//  Funflix
//
//  Created by Daniil Akmatov on 22/5/21.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject (wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    var body: some View {
        
    }
}
