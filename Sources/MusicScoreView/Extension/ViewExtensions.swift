//  ViewExtensions.swift
//
//  Created by lively77 on 2022/2/28.
//  Extensions for UIView and View

import Foundation
import SwiftUI
import UIKit

/// UIView Extension , return UIImage for this view
extension UIView {
    var renderedImage: UIImage {
        // rect of capure
        let rect = self.bounds
        // create the context of bitmap
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        self.layer.render(in: context)
        // get a image from current context bitmap
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
}

/// View Extension, take  a scrrenshot of this view at given range
public extension View {
    func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage {
        let window = UIWindow(frame: CGRect(origin: origin, size: size))
        let hosting = UIHostingController(rootView: self)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.renderedImage
    }
    
    /// take screentshot full of this view
    /// default size 512, 512
    func snapshot(size: CGSize = CGSize(width: 512, height: 512)) -> UIImage {
        return takeScreenshot(origin: CGPoint(x: 0, y: 0), size: size)
    }
}

