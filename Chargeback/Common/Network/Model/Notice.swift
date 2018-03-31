//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class Notice: BaseModel {
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case primaryAction = "primary_action"
        case secondaryAction = "secondary_action"
    }

    let title: String
    let description: String
    let primaryAction: Action
    let secondaryAction: Action

    init(title: String, description: String, primaryAction: Action, secondaryAction: Action, links: [String: Resource]) {
        self.title = title
        self.description = description
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        super.init(links: links)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        primaryAction = try container.decode(Action.self, forKey: .primaryAction)
        secondaryAction = try container.decode(Action.self, forKey: .secondaryAction)
        try super.init(from: decoder)
    }
}
