//
//  PuppyDataManager.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 31/10/2015.
//  Copyright © 2015 Tristan Burnside. All rights reserved.
//

import UIKit
import Chocolate

//It is not clear to me why this must be an NSObject but I suspect it has something to do with being referenced from a storyboard
class PuppyDataManager : NSObject, ChocolateCollectionDataSource {
    
    func loadDataForItems() {
        //No need to do anything here because images will be loaded as needed
    }
    
    func numberOfSections() -> Int {
        return 1;
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return 110;
    }
    
    func dataForItem<T>(section: Int, item: Int) -> T? {
        return ImageCellData(image: UIImage(named: "\(item + 1)")!) as? T
    }
}
