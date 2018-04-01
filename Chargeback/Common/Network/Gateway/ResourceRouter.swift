//
// Created by Douglas Mendes  on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Foundation
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

enum ResourceAction {
    case chargeback(userResponse: ChargeBackUserResponse)
    case blockCard
    case unblockCard

    var name: String {
        switch self {
        case .chargeback: return "self"
        case .blockCard: return "block_card"
        case .unblockCard: return "unblock_card"
        }
    }

    var params: [String: Any] {
        switch self {
        case .chargeback(let userResponse): return userResponse.asJson() ?? [:]
        default: return [:]
        }
    }
}

enum ResourceRouterError: Error {
    case resourceNotFound
    case resourceActionNotFound
}

final class ResourceRouter: ResourceRoutable {

    static let main = ResourceRouterFactory.make()

    private let resourceGateway: ResourceGateway & EntryPointResourceGateway

    private(set) var currentResource: BaseModel

    init(noticeGateway: ResourceGateway & EntryPointResourceGateway) {
        self.resourceGateway = noticeGateway
        currentResource = BaseModel(links: [:])
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
