//
//  PuppyData.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 14/03/2016.
//  Copyright © 2016 Tristan Burnside. All rights reserved.
//

import UIKit

struct PuppyData {
    let imageIndex : Int
    let tags : [String]
    var image : UIImage? {
        return UIImage(named: "\(self.imageIndex)")
    }
    
    
}
