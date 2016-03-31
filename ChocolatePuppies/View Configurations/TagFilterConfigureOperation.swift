//
//  TagFilterConfigureOperation.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 26/03/2016.
//  Copyright © 2016 Tristan Burnside. All rights reserved.
//

import UIKit
import Chocolate

class TagFilterConfigureOperation: ChocolateConfigureDataOperation {
    
    @IBOutlet private var dataManager : PuppyDataManager?
    
    override func main() {
        if let filterTag = configurationData as? String,
               dataManager = dataManager {
            dataManager.filterTag = filterTag
        }
    }
    
}
