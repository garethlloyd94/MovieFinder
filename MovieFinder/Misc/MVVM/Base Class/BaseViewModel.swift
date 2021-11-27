//
//  BaseViewModel.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import UIKit

class BaseViewModel {
    enum BaseType {
        case beginLoading
        case endLoading
    }
    
    var base: ((BaseType) -> Void)?
}

