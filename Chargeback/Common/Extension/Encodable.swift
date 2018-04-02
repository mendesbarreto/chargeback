//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya

extension Encodable {
    func asJson () -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(self),
              let jsonObj = try? JSONSerialization.jsonObject(with: jsonData,
                                                              options: .allowFragments) else {
            return nil
        }
        return jsonObj as? [String: Any]
    }
}
