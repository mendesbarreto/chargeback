//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

@testable import Chargeback

struct ReasonDetailMock {
    static var reasonDetail: ReasonDetail {
        return ReasonDetail(id: "reason", title: "TitleReason")
    }
}

struct ChargebackMock {
    static var chargeback: Chargeback {
        return Chargeback(id: "charge_back",
                          commentHint: "This is one hint",
                          title: "Title",
                          autoblock: true,
                          reasonDetails: [ReasonDetailMock.reasonDetail],
                          links: [ResourceKey.unblockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_block"),
                                  ResourceKey.blockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_unblock"),
                                  ResourceKey.selfRef.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/chargeback")])
    }
}
