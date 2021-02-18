//
//  Enum + Struct.swift
//  Puzzel
//
//  Created by Андрей on 12.01.2021.
//

import UIKit

enum Level: Int, CaseIterable {
    case easy = 3
    case medium 
    case hard
    case professional
}

struct Index {
    var row: Int
    var column: Int
}

