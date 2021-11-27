//
//  UIImage+UITest.swift
//  MovieFinderUITests
//
//  Created by Gareth Lloyd on 26/11/2021.
//

import UIKit

extension UIImage {

    var removingStatusBar: UIImage? {
        guard let cgImage = cgImage else {
            return nil
        }

        let yOffset = 50 * scale // 50 won't be correct for all devices
        let rect = CGRect(
            x: 0,
            y: Int(yOffset),
            width: cgImage.width,
            height: cgImage.height - Int(yOffset)
        )
        if let croppedCGImage = cgImage.cropping(to: rect) {
            return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
        }
        return nil
    }
}
