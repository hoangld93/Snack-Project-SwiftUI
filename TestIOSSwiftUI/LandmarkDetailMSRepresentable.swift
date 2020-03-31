//
//  LandmarkDetailMS_2_SU.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/24/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI

struct LandmarkDetailMSView: UIViewRepresentable {
    
    var landmark: Landmark
    
    func makeUIView(context: Context) -> UIView {
        let landmarkDetailMS = UIStoryboard(name: "main",
                                            bundle: Bundle.main).instantiateViewController(withIdentifier: "LandmarkDetailMS") as! LandmarkDetailMS
        landmarkDetailMS.landmark = landmark
        
        return landmarkDetailMS.view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        //do your logic here
    }
}

//struct LandDetailMSView : View {
//    var landmark: Landmark
//    var body: some View {
//        LandmarkDetailMSRepresentable(landmark: landmark)
//    }
//}

struct LandmarkDetailMSView_Preview: PreviewProvider {
    static var previews: some View {
        LandmarkDetailMSView(landmark: landmarkData[0])
    }
}
