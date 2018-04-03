//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class EntryPointBaseModelFactory {
    static func make() -> Resource {
        return Resource(href: Strings.App.baseUrl)
    }
}
