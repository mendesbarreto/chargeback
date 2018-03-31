//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

final class ResourceRouter: ResourceRoutable {

    static let main = ResourceRouterFactory.make()

    private let noticeGateway: ResourceGateway & EntryPointResourceGateway

    private(set) var currentResource: BaseModel

    init(noticeGateway: ResourceGateway & EntryPointResourceGateway) {
        self.noticeGateway = noticeGateway
        currentResource = BaseModel(links: [:])
    }

    func notice() -> Observable<Notice> {
        return noticeGateway.requestInitialResource().share().flatMap {[unowned self] (model: BaseModel) -> Observable<Notice> in
            return self.noticeGateway.request(resource: .notice, in: model.links)
        }.do(onNext: { [weak self] model in
            self?.currentResource = model
        })
    }

    func chargeBack() -> Observable<Chargeback> {
        return Observable.empty()
    }

    func has(resource: ResourceKey) -> Bool {
        return currentResource.links[resource] != nil
    }
}
