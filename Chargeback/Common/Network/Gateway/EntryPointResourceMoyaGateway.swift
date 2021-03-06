//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

final class EntryPointResourceMoyaGateway: ResourceMoyaGateway, EntryPointResourceGateway {
    func requestInitialResource() -> Observable<BaseModel> {
        let defaultEntryPointResourceApplication = EntryPointBaseModelFactory.make()
        return request(resource: defaultEntryPointResourceApplication)
    }
}
