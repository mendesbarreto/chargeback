//
// Created by Douglas Mendes  on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

protocol ResourceRoutable {
    var currentResource: BaseModel { get }
    func notice() -> Observable<Notice>
    func chargeBack() -> Observable<Chargeback>
}
