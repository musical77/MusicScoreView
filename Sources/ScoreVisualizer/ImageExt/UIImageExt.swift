//  UIImageExt.swift
//
//  Created by lively77 on 2022/2/5.

#if os(iOS)

import Foundation
import UIKit

extension UIImage {
    
    func crop(rect: CGRect) -> UIImage {
        let sourceImage = self
        
        // Center crop the image
        let sourceCGImage = sourceImage.cgImage!
        let croppedCGImage = sourceCGImage.cropping(
            to: rect
        )!
        
        // Use the cropped cgImage to initialize a cropped
        // UIImage with the same image scale and orientation
        let croppedImage = UIImage(
            cgImage: croppedCGImage,
            scale: sourceImage.imageRendererFormat.scale,
            orientation: sourceImage.imageOrientation
        )
        
        return croppedImage
    }
}

#endif
