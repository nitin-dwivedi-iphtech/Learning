//
//  SubjectModel.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import Foundation

struct Subject : Hashable,Identifiable{
    var id = UUID()
    var name:String
    var des:String
    var progress:Float
}
