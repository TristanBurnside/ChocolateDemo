//
//  FilterDataManager.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 1/04/2016.
//  Copyright © 2016 Tristan Burnside. All rights reserved.
//

import Foundation
import Chocolate

class FilterDataManager : NSObject, ChocolateCellDataSource {
    
    var needsReload : Bool = false
    private var puppyData : [PuppyData] = []
    
    private lazy var tags :  NSOrderedSet = { (_) -> NSOrderedSet in
        let tagset = NSMutableOrderedSet()
        _ = self.puppyData.map{tagset.addObjectsFromArray($0.tags)}
        return tagset
    }(self)
    
    func loadDataForItems() {
        puppyData = loadPuppyData(nil)
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return tags.count
    }
    
    func numberOfSections() -> Int {
        return 1;
    }
    
    func dataForItem<T>(section: Int, item: Int) -> T? {
        return tags.objectAtIndex(item) as? T;
    }
}