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
class PuppyDataManager : NSObject, ChocolateCellDataSource {
    
    var needsReload : Bool = false
    private var puppyData : [PuppyData] = []
    
    var filterTag : String? {
        didSet {
            puppyData = loadPuppyData(filterTag)
            needsReload = true;
        }
    }
    
    func loadDataForItems() {
        puppyData = loadPuppyData(nil)
    }
    
    func numberOfSections() -> Int {
        return 1;
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return puppyData.count;
    }
    
    func dataForItem<T>(section: Int, item: Int) -> T? {
        if let image = UIImage(named: "\(puppyData[item].imageIndex + 1)") {
            return ImageCellData(image: image) as? T
        }
        return nil
    }
}

func loadPuppyData(tag: String?) -> [PuppyData] {
    let data = [PuppyData(imageIndex:1, tags: ["small", "all"]),
    PuppyData(imageIndex:2, tags: ["medium", "all"]),
    PuppyData(imageIndex:3, tags: ["large", "all"]),
    PuppyData(imageIndex:4, tags: ["black", "all"])]
    
    if let tag = tag {
        return data.filter{$0.tags.contains(tag)}
    } else {
        return data
    }
}