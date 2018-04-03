//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation
import RxSwift

@testable import Chargeback

//swiftlint:disable force_cast
final class ResourceGatewayMock<T: BaseModel>: ResourceGateway, EntryPointResourceGateway {
    var invokedRequestResource = false
    var invokedRequestResourceCount = 0
    var invokedRequestResourceParameters: (key: ResourceKey, links: [String: Resource])?
    var invokedRequestResourceParametersList = [(key: ResourceKey, links: [String: Resource])]()
    var stubbedRequestResourceResult: Observable<T>!

    func request<T: BaseModel>(resource key: ResourceKey, in links: [String: Resource]) -> Observable<T> {
        invokedRequestResource = true
        invokedRequestResourceCount += 1
        invokedRequestResourceParameters = (key, links)
        invokedRequestResourceParametersList.append((key, links))
        return stubbedRequestResourceResult as! Observable<T>
    }

    var invokedRequestAction = false
    var invokedRequestActionCount = 0
    var invokedRequestActionParameters: (key: Resource, parameters: [String: Any])?
    var invokedRequestActionParametersList = [(key: Resource, parameters: [String: Any])]()
    var stubbedRequestActionResult: Observable<Void>!

    func requestAction(resource key: Resource, parameters: [String: Any]) -> Observable<Void> {
        invokedRequestAction = true
        invokedRequestActionCount += 1
        invokedRequestActionParameters = (key, parameters)
        invokedRequestActionParametersList.append((key, parameters))
        return stubbedRequestActionResult
    }

    var invokedRequest = false
    var invokedRequestCount = 0
    var invokedRequestParameters: (resource: Resource, Void)?
    var invokedRequestParametersList = [(resource: Resource, Void)]()
    var stubbedRequestResult: Observable<T>!

    func request<T: BaseModel>(resource: Resource) -> Observable<T> {
        invokedRequest = true
        invokedRequestCount += 1
        invokedRequestParameters = (resource, ())
        invokedRequestParametersList.append((resource, ()))
        return stubbedRequestResult as! Observable<T>
    }

    var invokedRequestInitialResource = false
    var invokedRequestInitialResourceCount = 0
    var stubbedRequestInitialResourceResult: Observable<BaseModel>!

    func requestInitialResource() -> Observable<BaseModel> {
        invokedRequestInitialResource = true
        invokedRequestInitialResourceCount += 1
        return stubbedRequestInitialResourceResult
    }
}
