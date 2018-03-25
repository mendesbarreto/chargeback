//
// Created by douglas.barreto on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct ReasonDetail: Decodable{
    private enum CodingKyes: String, CodingKey {
        case id
        case title
    }

    let id: String
    let title: String
}
