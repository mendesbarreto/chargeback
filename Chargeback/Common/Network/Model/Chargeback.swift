//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation
final class Chargeback: BaseModel {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case autoblock
        case commentHint = "comment_hint"
        case reasonDetails = "reason_details"
    }
    let id: String
    let title: String
    let autoblock: Bool
    let commentHint: String
    let reasonDetails: [ReasonDetail]

    init(id: String,
         commentHint: String,
         title: String,
         autoblock: Bool,
         reasonDetails: [ReasonDetail],
         links: [String: Resource]) {
        self.id = id
        self.title = title
        self.autoblock = autoblock
        self.commentHint = commentHint
        self.reasonDetails = reasonDetails
        super.init(links: links)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        autoblock = try container.decode(Bool.self, forKey: .autoblock)
        commentHint = try container.decode(String.self, forKey: .commentHint)
        reasonDetails = try container.decode([ReasonDetail].self, forKey: .reasonDetails)
        try super.init(from: decoder)
    }
}
