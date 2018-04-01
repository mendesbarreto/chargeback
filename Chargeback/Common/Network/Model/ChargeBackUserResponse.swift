//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct ChargeBackUserResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case comment
        case reasonDetails = "reason_details"
    }

    let comment: String
    let reasonDetails: [ReasonDetailUserResponse]
}
