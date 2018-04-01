//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

enum ReasonDetailIdKey: String {
    case merchantRecognized = "merchant_recognized"
    case cardInPossession = "card_in_possession"
}

struct ReasonDetail: Decodable {
    private enum CodingKyes: String, CodingKey {
        case id
        case title
    }

    let id: String
    let title: String

    var reasonKey: ReasonDetailIdKey? {
        return ReasonDetailIdKey(rawValue: id)
    }
}
