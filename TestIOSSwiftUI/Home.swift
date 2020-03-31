//
//  Home.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/24/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import SwiftUI


struct CategoryHome: View {
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink(
                    destination: LandmarkDetailMSView(landmark: featured[0]).edgesIgnoringSafeArea(.top)
                    //                    destination: LandmarkDetail(
                    //                        landmark: featured[0]
                    //                    )
                ) {
                    ZStack(alignment: .bottomLeading) {
                        FeaturedLandmarks(landmarks: featured)
                        Text(featured[0].name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }
                }
                List {
                    ForEach(categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: self.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
//                    NavigationLink(
//                        destination: LandmarkDetailMSView(landmark: featured[0]).edgesIgnoringSafeArea(.top)
//                    ) {
//                        FeaturedLandmarks(landmarks: featured)
//                    }
                    NavigationLink(
                        destination: LandmarkList()
                    ) {
                        Text("List landmark")
                    }
                    
                    NavigationLink(
                        destination: ListMoviesView()
                    ) {
                        Text("List Movie")
                    }
                }
            }
                
            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image
            .resizable()
            .renderingMode(.original)
            .frame(height: 200)
            .cornerRadius(5)
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
