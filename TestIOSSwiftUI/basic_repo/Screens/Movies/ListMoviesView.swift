//
//  ListMovies.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/26/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire


struct ListMoviesView : View {
    
//    @EnvironmentObject var movieData: ListMovieState
    @ObservedObject var movieData2 = ListMovieState()
    @ObservedObject private var movieState = ObservableState(store: movieStore)
    
    @State var loading = true
    @State var movies = [Movie]()
    //    let movie_url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4bba104c148c5e6386556e64925f7274"
    
    var body: some View {
        VStack {
            if self.movieData2.loadableState == LoadAbleState.loading {
                self.getLoadingView()
            } else if self.movieData2.loadableState == LoadAbleState.success {
                self.getSuccessView()
            } else if (self.movieData2.loadableState == LoadAbleState.error) {
                self.getFailedView()
            }
        }
        .onAppear{
            if (self.movieData2.movies.isEmpty) {
                let parameters = ["sort_by": "popularity.desc", "api_key": "4bba104c148c5e6386556e64925f7274"]
                //                self.movieData.getData(params: parameters)
                self.movieData2.getData(params: parameters)
                
                //                self.movieState.dispatch(GET_MOVIE())
                //                self.getData()
            }
        }
    }
    
    func getLoadingView() -> some View {
        return Text("Loading...")
    }
    
    func getSuccessView() -> some View {
        return List(self.movieData2.movies) { movie in
                           NavigationLink(destination: MovieDetails(movie: movie)) {
                               MovieRow(movieState2: self.movieData2, movie: movie)
                           }
                       }
                       //                .frame(height: 200, alignment: .top)
                       //                Spacer()
                       //                List(self.movieData2.movies) { movie in
                       //                    NavigationLink(destination: MovieDetails(movie: movie)) {
                       //                        MovieRow(movie: movie)
                       //                    }
                       //                }.frame(height: 200, alignment: .top)
                       //                Spacer()
    }
    
    func getFailedView() -> some View {
        return Text("Load data failed")
    }
    
    //    func getData() {
    //        AF.request(self.movie_url).responseDecodable(of: MovieList.self) { response in
    //
    //            //                    debugPrint("Response: \(response)")
    //
    //            switch(response.result) {
    //            case .success(let moviesResponse):
    //                print(moviesResponse)
    //                self.movies = moviesResponse.results
    //
    //            case .failure(let error):
    //                print(error)
    //            }
    //
    //            self.loading = false
    //        }
    //    }
}
