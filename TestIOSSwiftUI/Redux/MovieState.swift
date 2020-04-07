//
//  MovieState.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/3/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import ReSwift

struct MovieState: StateType {
    var movies = [Movie]()
    var loading = false
}
