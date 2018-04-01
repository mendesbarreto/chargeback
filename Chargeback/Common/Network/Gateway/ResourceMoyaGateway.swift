//
// Created by Douglas Mendes  on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya
import RxSwift
import RxMoya

import RxSwift
import RxMoya

class ResourceMoyaGateway: ResourceGateway {
    let provider: MoyaProvider<NubankResourceTarget>
    let actionProvider: MoyaProvider<NubankActionTarget>

    init() {
        provider = MoyaProvider<NubankResourceTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
        actionProvider = MoyaProvider<NubankActionTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }

    func request<T: BaseModel>(resource: Resource) -> Observable<T> {
        do {
            let url = try resource.href.asURL()
            let target = NubankResourceTarget(resourceUrl: url)
            return provider.rx.request(target).filterSuccessfulStatusCodes().map(T.self).asObservable()
        } catch let error {
            return Observable.error(error)
        }
    }

    func requestAction (resource: Resource, parameters: [String: Any]) -> Observable<Void> {
        do {
            let url = try resource.href.asURL()
            let target = NubankActionTarget(resourceUrl: url, parameters: parameters)
            return actionProvider.rx.request(target).filterSuccessfulStatusCodes().asObservable().mapTo(())
        } catch let error {
            return Observable.error(error)
        }
    }

    func request<T: BaseModel>(resource key: ResourceKey, in links: [String: Resource]) -> Observable<T> {
        guard let resource = links[key] else {
            return Observable.error(ResourceError.resourceNotFound)
        }

        return request(resource: resource)
    }
}
