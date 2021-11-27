//
//  ViewModelProtocol.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import Foundation

protocol ViewModelProtocol: BaseViewModel {
    associatedtype UpdateType
    associatedtype ErrorType
    var update: ((UpdateType) -> Void)? { get set }
    var error: ((ErrorType) -> Void)? { get set }
}
