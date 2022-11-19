//
//  BtnList.swift
//  SOPKATHON-iOS
//
//  Created by 김민서 on 2022/11/20.
//

import Foundation

struct BtnList : Hashable {
    var title : String
}
extension BtnList {
    static var titleList : [BtnList] = [BtnList(title: "상"),
                                    BtnList(title: "중"),
                                    BtnList(title: "하")
    ]
 }
