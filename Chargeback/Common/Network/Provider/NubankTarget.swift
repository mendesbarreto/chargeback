//
// Created by Douglas Mendes  on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya
import RxMoya

struct NubankResourceTarget: TargetType {
    private(set) var baseURL: URL
    private(set) var path: String = ""
    private(set) var parameters: [String: Any] = [:]
    private(set) var sampleData: Data = Data()
    private(set) var headers: [String: String]?

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

    init(resourceUrl: URL) {
        self.baseURL = resourceUrl
    }
}

struct NubankActionTarget: TargetType {
    private(set) var baseURL: URL
    private(set) var parameters: [String: Any]
    private(set) var path: String = ""
    private(set) var sampleData: Data = Data()
    private(set) var headers: [String: String]?

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    init(resourceUrl: URL,
         parameters: [String: Any]) {
        self.baseURL = resourceUrl
        self.parameters = parameters
    }
}
