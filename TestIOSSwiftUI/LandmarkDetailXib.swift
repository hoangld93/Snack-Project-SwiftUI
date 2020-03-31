//
//  LandmarkDetailXib.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/24/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import UIKit

class LandmarkDetailXib : UIViewController {
    
    @IBOutlet weak var tvLabel: UILabel!
    
    var landmark: Landmark?
    
    override func viewDidLoad() {
        tvLabel.text = landmark?.name
    }
}
