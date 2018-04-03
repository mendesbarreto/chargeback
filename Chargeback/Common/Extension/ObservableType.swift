//
// Created by Douglas Mendes on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

extension ObservableType {
    func mapTo<R>(_ value: R) -> Observable<R> {
        return map({ _ in value })
    }
}
