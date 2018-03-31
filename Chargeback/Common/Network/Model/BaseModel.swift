//
// Created by Douglas Mendes  on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

class BaseModel: Decodable {

    private enum CodingKeys: String, CodingKey {
        case links
    }

    let links: [String: Resource]

    init(links: [String: Resource]) {
        self.links = links
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        links = try container.decode([String: Resource].self, forKey: .links)
    }
}
