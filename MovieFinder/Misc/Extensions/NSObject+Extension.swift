//
//  NSObject+Extension.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 23/11/2021.
//

import Foundation
import UIKit

public extension NSObject {
    
    class var nibFromClass: UINib? {
        return UINib(nibName: self.nameOfClass, bundle: nil)
    }
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
}
