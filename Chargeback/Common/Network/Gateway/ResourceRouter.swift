//
// Created by Douglas Mendes  on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya

final class ResourceRouter: ResourceRoutable {

    static let main = ResourceRouterFactory.make()

    private let resourceGateway: ResourceGateway & EntryPointResourceGateway

    private(set) var currentResource: BaseModel

    init (noticeGateway: ResourceGateway & EntryPointResourceGateway, starterResource: BaseModel = BaseModel(links: [:])) {
        self.resourceGateway = noticeGateway
        currentResource = starterResource
    }

    func notice() -> Observable<Notice> {
        return resourceGateway.requestInitialResource()
                              .share()
                              .do(onNext: { [weak self] model in
                                  self?.currentResource = model
                              })
                              .flatMap { [unowned self] (model: BaseModel) -> Observable<Notice> in
                                  guard let notice = self.get(resource: .notice) else {
                                      return Observable.error(ResourceRouterError.resourceNotFound)
                                  }
                                  return self.resourceGateway.request(resource: notice)
                              }
                              .do(onNext: { [weak self] model in
                                  self?.currentResource = model
                              })
    }

    func chargeBack() -> Observable<Chargeback> {
        guard let chargeback = get(resource: .chargeback) else {
            return Observable.error(ResourceRouterError.resourceNotFound)
        }
        return resourceGateway.request(resource: chargeback).do(onNext: { [weak self] model in
            self?.currentResource = model
        })
    }

    func exec (action: ResourceAction) -> Observable<Void> {
        guard let chargeback = get(action: action) else {
            return Observable.error(ResourceRouterError.resourceActionNotFound)
        }
        return resourceGateway.requestAction(resource: chargeback, parameters: action.params)
    }

    func get (resource: ResourceKey) -> Resource? {
        return currentResource.links[resource]
    }

    func get (action: ResourceAction) -> Resource? {
        return currentResource.links[action]
    }
}
