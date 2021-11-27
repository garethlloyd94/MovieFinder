//
//  MockData.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 26/11/2021.
//

import Mocker

protocol MockData {
    var dataType: Mock.DataType {get set}
    var statusCode: Int {get set}
    func orignalURL() -> URL
    func data() -> [Mock.HTTPMethod: Data]
}
