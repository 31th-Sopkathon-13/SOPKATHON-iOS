//
//  BaseTargetType.swift
//  SOPKATHON-iOS
//
//  Created by 황찬미 on 2022/11/19.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
