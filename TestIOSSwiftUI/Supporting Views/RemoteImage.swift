//
//  RemoteImage.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/26/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI
import Nuke

struct RemoteImage: View {
    var url: URL
    var transition: AnyTransition = .opacity
    @State private var uiImage: UIImage?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(white: 0.9))
            uiImage.map { uiImage in
                Image(uiImage: uiImage)
//                    .aspectRatio(contentMode: .fill)
                    .resizable()
                    .aspectRatio(CGSize(width:50, height: 50), contentMode: .fit)
                    .transition(transition)
            }
        }
        .onAppear {
            ImagePipeline.shared.loadImage(with: self.url) { result in
                switch result {
                case .success(let response): self.uiImage = response.image
                case .failure(let error): print(error)
                }
            }
        }
    }
}
