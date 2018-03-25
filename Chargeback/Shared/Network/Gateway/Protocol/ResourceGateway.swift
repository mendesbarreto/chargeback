//
// Created by douglas.barreto on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

protocol ResourceGateway {
    func request<T: BaseModel>(resource key: ResourceKey, in links: [String: Resource]) -> Observable<T>
    func request<T: BaseModel>(resource: Resource) -> Observable<T>
}
