//
//  LandmarkDetailMS.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/24/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import UIKit

class LandmarkDetailMS : UIViewController{
    
    @IBOutlet weak var imView: UIImageView!
    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var tvState: UILabel!
    @IBOutlet weak var tvPark: UILabel!
    
    var landmark: Landmark?
    
    override func viewDidLoad() {
        tvName.text = landmark?.name
        tvState.text = landmark?.state
        tvPark.text = landmark?.park
        
//        let url = URL.init(fileURLWithPath: "/TestIOSSwiftUI/TestIOSSwiftUI/Development/TestIOSSwiftUI/TestIOSSwiftUI/TestIOSSwiftUI.xcassets/resources/\(landmark?.imageName).jpg")
//        let imageData:NSData = NSData(contentsOf: url)!
//        let image = UIImage(data: imageData as Data)
        guard let imageName = landmark?.imageName
        else {
            print("imageName is null")
            return
        }
        imView.image = UIImage(cgImage: ImageStore.loadImage(name: imageName))
        imView.frame(forAlignmentRect: .zero)
    }
}
