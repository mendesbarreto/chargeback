//
// Created by Douglas Mendes  on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct Resource: Decodable {
    enum CodingKeys: String, CodingKey {
        case href
    }

    let href: String
}
