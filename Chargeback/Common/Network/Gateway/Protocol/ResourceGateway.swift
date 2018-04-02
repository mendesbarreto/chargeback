//
// Created by Douglas Mendes  on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

protocol ResourceGateway {
    func request<T: BaseModel>(resource key: ResourceKey, in links: [String: Resource]) -> Observable<T>

    func requestAction (resource key: Resource, parameters: [String: Any]) -> Observable<Void>
    func request<T: BaseModel>(resource: Resource) -> Observable<T>
}
