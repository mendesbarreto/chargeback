//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

protocol EntryPointResourceGateway {
    func requestInitialResource() -> Observable<BaseModel>
}
