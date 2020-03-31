//
//  ListMovies.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/26/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI

struct ListMoviesView : View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List(self.userData.movies) { movie in
            NavigationLink(destination: MovieDetails(movie: movie)){
                MovieRow(movie: movie)
            }
        }
//        NavigationView {
//            List(self.userData.movies) { movie in
//                NavigationLink(destination: MovieDetails(movie: movie)){
//                    MovieRow(movie: movie)
//                }
//            }
//        }.navigationBarTitle(Text("Movies").foregroundColor(Color.black))
    }
}
