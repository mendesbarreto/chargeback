//
// Created by Douglas Mendes  on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya
import RxSwift
import RxMoya

class ResourceMoyaGateway: ResourceGateway {
    let provider: MoyaProvider<NubankTarget>

    init() {
        provider = MoyaProvider<NubankTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }

    func request<T: BaseModel>(resource: Resource) -> Observable<T> {
        do {
            let url = try resource.href.asURL()
            let target =  NubankTarget(resourceUrl: url)
            return provider.rx.request(target).map(T.self).asObservable()
        } catch (let error) {
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
