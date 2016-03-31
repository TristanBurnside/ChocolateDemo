//
//  FilterTableViewCell.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 14/03/2016.
//  Copyright © 2016 Tristan Burnside. All rights reserved.
//

import UIKit
import Chocolate

class FilterTableViewCell: UITableViewCell, ChocolateCell {

    var currentData : String?
    
    static func cellConfigurationOperation() -> CellConfigurationOperation.Type {
        return FilterCellConfigurationOperation.self
    }
    
    static func cellSegueOperation() -> CellSegueOperation {
        return FilterCellSegueOperation()
    }
    
    override func prepareForReuse() {
        textLabel!.text = nil
        currentData = nil
    }
    
    func configureWithData(data : String) {
        currentData = data
        textLabel!.text = data
    }
    
}

class FilterCellSegueOperation : CellSegueOperation {
    override func main() {
        if let cell = cell as? FilterTableViewCell,
           var destinationViewController = destinationViewController as? ConfigurableViewController {
                destinationViewController.configurationData = cell.currentData
        }
    }
}

class FilterCellConfigurationOperation : CellConfigurationOperation {
    override func main() {
        if let cellData : String = dataManager.dataForItem(indexPath.section, item: indexPath.item) {
            if let cell = cell as? FilterTableViewCell {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    cell.configureWithData(cellData)
                })
            }
        }
    }
}

