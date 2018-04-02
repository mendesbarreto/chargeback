//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

enum ResourceKey: String, Decodable {
    case notice
    case chargeback
    case blockCard = "block_card"
    case unblockCard = "unblock_card"
    case selfRef = "self"
}
