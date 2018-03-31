//
// Created by douglas.barreto on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct Action: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case action
    }

    let title: String
    let action: String

    init(title: String, action: String) {
        self.title = title
        self.action = action
    }
}
