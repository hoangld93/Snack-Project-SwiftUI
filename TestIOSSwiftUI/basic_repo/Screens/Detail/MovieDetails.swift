//
//  MovieDetails.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/26/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct MovieDetails : View {
    var movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            //            URLImage(URL(string: "https://image.tmdb.org/t/p/original/\(movie.poster_path)")!, delay: 0.25)
            //            frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
            RemoteImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.poster_path)")!)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 155)
            
            Text("Description").foregroundColor(Color.gray).padding(10)
            Text(movie.overview).lineLimit(nil).padding(10)
            Spacer()
        }
        //            .navigationBarTitle(Text(movie.title), displayMode: .inline) // inline will help to put the title and back button in the same row
    }
}
