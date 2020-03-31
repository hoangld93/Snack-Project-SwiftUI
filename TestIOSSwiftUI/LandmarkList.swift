//
//  LandmarkList.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/26/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI

struct LandmarkList: View {
    
    @State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            
            ForEach(self.userData.landmarks) { landmark in
                if (!self.userData.showFavoritesOnly || landmark.isFavorite) {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
    }
}

struct LandmarkList_Preview: PreviewProvider{
    static var previews: some View {
        return LandmarkList().environmentObject(UserData())
    }
}
