//
//  ImageConfigureOperation.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 10/01/2016.
//  Copyright © 2016 Tristan Burnside. All rights reserved.
//

import UIKit
import Chocolate

class ImageConfigureOperation: ChocolateConfigureDataOperation {
    
    @IBOutlet private var imageView : UIImageView?
    
    override func main() {
        if let imageData = configurationData as? UIImage,
               imageView = imageView {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                imageView.image = imageData;
            })
        }
    }
}
