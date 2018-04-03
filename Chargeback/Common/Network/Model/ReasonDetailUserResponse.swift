//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct ReasonDetailUserResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case response
    }

    let id: String
    let response: Bool
}

extension ReasonDetailUserResponse {
    init(id: ReasonDetailIdKey, response: Bool) {
        self.init(id: id.rawValue, response: response)
    }
}
