//
// Created by douglas.barreto on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Resource {
    subscript(resource: ResourceKey) -> Value? {
        get {
            return self[resource.rawValue]
        }
        set {
            self[resource.rawValue] = newValue
        }
    }
}