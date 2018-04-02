//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation
@testable import Chargeback

struct NoticeMock {
    static var noticeMock: Notice {
        return Notice(title: "Some Title",
                      description: "Some Description",
                      primaryAction: Action(title: "Action1", action: "Action2"),
                      secondaryAction: Action(title: "Action2", action: "Action2"),
                      links: [ResourceKey.chargeback.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/chargeback")])
    }
}
