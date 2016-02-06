//
//  ImageCellData.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 6/02/2016.
//  Copyright © 2016 Tristan Burnside. All rights reserved.
//

import UIKit
import AVFoundation

import Chocolate

struct ImageCellData {
    var image : UIImage
    var thumbnailSize: CGSize
    
    //I don't really get why self is required here...
    lazy var thumbnail : UIImage = generateThumbnail(self)()
    
    init(image: UIImage) {
        self.image = image;
        thumbnailSize = CGSize.zero
    }
    
    private func generateThumbnail() -> UIImage {
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        let thumbnailAspectFitSize = AVMakeRectWithAspectRatioInsideRect(image.size, CGRectMake(0,0,thumbnailSize.height,thumbnailSize.width))
        
        UIGraphicsBeginImageContextWithOptions(thumbnailAspectFitSize.size, true, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: thumbnailSize))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage;
    }
}
