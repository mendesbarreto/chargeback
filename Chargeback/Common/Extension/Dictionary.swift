//
// Created by Douglas Mendes  on 3/25/18.
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

extension Dictionary where Key == String, Value == Resource {
    subscript (resource: ResourceAction) -> Value? {
        get {
            return self[resource.name]
        }
        set {
            self[resource.name] = newValue
        }
    }
}
