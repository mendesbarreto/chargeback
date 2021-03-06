//
// Created by Douglas Mendes  on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ResourceRouterFactory {
    static func make() -> ResourceRouter {
        return ResourceRouter(noticeGateway: EntryPointResourceMoyaGateway())
    }
}
