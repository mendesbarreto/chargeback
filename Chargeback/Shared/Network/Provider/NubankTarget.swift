//
// Created by douglas.barreto on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya
import RxMoya

struct NubankTarget: TargetType {
    private(set) var baseURL: URL
    private(set) var path: String = ""
    private(set) var sampleData: Data
    private(set) var headers: [String: String]?
    private(set) var parameters: [String: Any]

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }

    var parameterEncoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.queryString
        default:
            return JSONEncoding.default
        }
    }

    init(resourceUrl: URL,
         parameters: [String: Any] = [:],
         headers: [String: String]? = nil) {

        self.baseURL = resourceUrl
        self.headers = headers
        self.parameters = parameters
        self.sampleData = Data()
    }
}
