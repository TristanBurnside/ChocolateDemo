//
//  ImageCollectionViewCell.swift
//  ChocolatePuppies
//
//  Created by Tristan Burnside on 31/10/2015.
//  Copyright © 2015 Tristan Burnside. All rights reserved.
//

import UIKit
import AVFoundation
import Chocolate

public struct ImageCellData {
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

class ImageCellSegueOperation : CellSegueOperation {
    override func main() {
        if let cell = cell as? ImageCollectionViewCell,
               destinationViewController = destinationViewController as? ChocolateViewController {
            destinationViewController.configurationData = cell.currentData?.image
        }
    }
}

class ImageCellConfigurationOperation : CellConfigurationOperation {
    override func main() {
        if var cellData : ImageCellData = dataManager!.dataForItem(indexPath!.section, item: indexPath!.item) {
            if let cell = cell as? ImageCollectionViewCell {
                cellData.thumbnailSize = cell.imageView.frame.size
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    cell.configureWithData(cellData)
                })
            }
        }
    }
}

class ImageCollectionViewCell: UICollectionViewCell, ChocolateCell {
    
    private var imageView : UIImageView
    var currentData : ImageCellData?
    
    class func cellConfigurationOperation() -> CellConfigurationOperation {
        return ImageCellConfigurationOperation()
    }
    
    class func cellSegueOperation() -> CellSegueOperation {
        return ImageCellSegueOperation()
    }
    
    init() {
        imageView = UIImageView()
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        imageView = UIImageView()
        super.init(coder: aDecoder)
        setup()
    }
    
    override convenience init(frame: CGRect) {
        self.init()
    }
    
    func setup() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.contentView.addSubview(imageView)
        
        NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Left, relatedBy: .Equal, toItem: self.contentView, attribute: .Left, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Right, relatedBy: .Equal, toItem: self.contentView, attribute: .Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1, constant: 0).active = true
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        currentData = nil
    }
    
    func configureWithData(data : ImageCellData) {
        currentData = data
        imageView.image = currentData?.thumbnail
    }
    
}
