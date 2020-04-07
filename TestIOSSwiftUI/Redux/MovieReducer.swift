//
//  MovieReducer.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/3/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire

func MovieReducer(action: Action, state: MovieState?) -> MovieState {
    var state = state ?? MovieState()
    
    switch action {
    case _ as GET_MOVIE:
//        getData(state: state)
        state.loading = true
        AF.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4bba104c148c5e6386556e64925f7274").responseDecodable(of: MovieList.self) { response in

            debugPrint("Response: \(response)")

            switch(response.result) {
            case .success(let moviesResponse):
                print(moviesResponse)
                state.movies = moviesResponse.results
                state.loading = false

            case .failure(let error):
                print(error)
                state.loading = false
            }
        }
        
    default:
        break
    }
    
    return state
}

func getData(state: MovieState?) {
    var state = state ?? MovieState()
    state.loading = true
    AF.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4bba104c148c5e6386556e64925f7274").responseDecodable(of: MovieList.self) { response in
        
        debugPrint("Response: \(response)")
        
        switch(response.result) {
        case .success(let moviesResponse):
            print(moviesResponse)
            state.movies = moviesResponse.results
            state.loading = false
            
        case .failure(let error):
            print(error)
            state.loading = false
        }
    }
}


let movieStore = Store<MovieState>(
    reducer: MovieReducer,
    state: nil
)
