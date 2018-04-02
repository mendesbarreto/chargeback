//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

@testable import Chargeback

struct ReasonDetailMock {
    static var reasonMerchantRecognized: ReasonDetail {
        return ReasonDetail(id: ReasonDetailIdKey.merchantRecognized.rawValue, title: "TitleReason")
    }

    static var reasonCardInPossession: ReasonDetail {
        return ReasonDetail(id: ReasonDetailIdKey.cardInPossession.rawValue, title: "TitleReason")
    }
}

struct ChargebackMock {
    static var chargeback: Chargeback {
        return Chargeback(id: "charge_back",
                          commentHint: "This is one hint",
                          title: "Title",
                          autoblock: true,
                          reasonDetails: [ReasonDetailMock.reasonMerchantRecognized, ReasonDetailMock.reasonCardInPossession],
                          links: [ResourceKey.unblockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_block"),
                                  ResourceKey.blockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_unblock"),
                                  ResourceKey.selfRef.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/chargeback")])
    }

    static var chargebackWithoutCardInPossession: Chargeback {
        return Chargeback(id: "charge_back",
                          commentHint: "This is one hint",
                          title: "Title",
                          autoblock: true,
                          reasonDetails: [ReasonDetailMock.reasonMerchantRecognized],
                          links: [ResourceKey.unblockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_block"),
                                  ResourceKey.blockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_unblock"),
                                  ResourceKey.selfRef.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/chargeback")])
    }

    static var chargebackWithoutMerchantRecognized: Chargeback {
        return Chargeback(id: "charge_back",
                          commentHint: "This is one hint",
                          title: "Title",
                          autoblock: true,
                          reasonDetails: [ReasonDetailMock.reasonCardInPossession],
                          links: [ResourceKey.unblockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_block"),
                                  ResourceKey.blockCard.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/card_unblock"),
                                  ResourceKey.selfRef.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/chargeback")])
    }
}
