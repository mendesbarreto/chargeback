//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxTest
import RxSwift

@testable import Chargeback

final class ResourceRouterMock: ResourceRoutable {
    var invokedCurrentResourceGetter = false
    var invokedCurrentResourceGetterCount = 0
    var stubbedCurrentResource: BaseModel!
    var currentResource: BaseModel {
        invokedCurrentResourceGetter = true
        invokedCurrentResourceGetterCount += 1
        return stubbedCurrentResource
    }
    var invokedNotice = false
    var invokedNoticeCount = 0
    var stubbedNoticeResult: Observable<Notice>!

    func notice () -> Observable<Notice> {
        invokedNotice = true
        invokedNoticeCount += 1
        return stubbedNoticeResult
    }

    var invokedChargeBack = false
    var invokedChargeBackCount = 0
    var stubbedChargeBackResult: Observable<Chargeback>!

    func chargeBack () -> Observable<Chargeback> {
        invokedChargeBack = true
        invokedChargeBackCount += 1
        return stubbedChargeBackResult
    }

    var invokedExec = false
    var invokedExecCount = 0
    var invokedExecParameters: (action: ResourceAction, Void)?
    var invokedExecParametersList = [(action: ResourceAction, Void)]()
    var stubbedExecResult: Observable<Void>!

    func exec (action: ResourceAction) -> Observable<Void> {
        invokedExec = true
        invokedExecCount += 1
        invokedExecParameters = (action, ())
        invokedExecParametersList.append((action, ()))
        return stubbedExecResult
    }
}
