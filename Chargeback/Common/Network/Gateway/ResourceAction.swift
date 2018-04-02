//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya

enum ResourceAction {
    case chargeback(userResponse: ChargeBackUserResponse)
    case blockCard
    case unblockCard

    var name: String {
        switch self {
        case .chargeback: return "self"
        case .blockCard: return "block_card"
        case .unblockCard: return "unblock_card"
        }
    }

    var params: [String: Any] {
        switch self {
        case .chargeback(let userResponse): return userResponse.asJson() ?? [:]
        default: return [:]
        }
    }
}
