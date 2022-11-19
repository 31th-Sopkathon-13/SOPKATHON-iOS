//
//  PersonId.swift
//  SOPKATHON-iOS
//
//  Created by JEONGEUN KIM on 2022/11/20.
//

import Foundation

struct PersonId1 : Hashable{
    var name : String
}
extension PersonId1 {
    static var idList : [PersonId1] = [PersonId1(name: "김정은"),
                                       PersonId1(name: "황찬미")
    ]
}
struct PersonId2 : Hashable{
    var name : String
}
extension PersonId2 {
    static var idList : [PersonId2] = [PersonId2(name: "정윤선"),
                                       PersonId2(name: "김민서")
    ]
}
struct PersonId3 : Hashable{
    var name : String
}
extension PersonId3 {
    static var idList : [PersonId3] = [PersonId3(name: "김채현"),
                                       PersonId3(name: "이성현")
    ]
}


