//
// Created by douglas.barreto on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

final class ResourceRouterFactory {
    static func make() -> ResourceRouter {
        return ResourceRouter(noticeGateway: EntryPointResourceMoyaGateway())
    }
}

final class ResourceRouter {

    static let main = ResourceRouterFactory.make()
    let noticeGateway: ResourceGateway & EntryPointResourceGateway

    var currentResource: BaseModel

    init(noticeGateway: ResourceGateway & EntryPointResourceGateway) {
        self.noticeGateway = noticeGateway
        currentResource = BaseModel(links: [:])
    }

    func notice() -> Observable<Notice> {
        return noticeGateway.requestInitialResource().share().flatMap {[unowned self] (model: BaseModel) -> Observable<Notice> in
            return self.noticeGateway.request(resource: .notice, in: model.links)
        }.do(onNext: { [weak self] model in
            self?.currentResource = model
        })
    }

    func chargeBack() -> Observable<Chargeback> {
        return Observable.empty()
    }

    func has(resource: ResourceKey) -> Bool {
        return currentResource.links[resource] != nil
    }
}

final class ShowNoticeUseCase {

    let noticeGateway: ResourceRouter
    let presenter: NoticePresenterInput

    init(noticeGateway: ResourceRouter, presenter: NoticePresenterInput) {
        self.noticeGateway = noticeGateway
        self.presenter = presenter
    }

    func show() {
        noticeGateway.notice().subscribe(onNext: {[weak self] notice in
            guard let strongSelf = self else {
                return
            }
            strongSelf.presenter.show(notice: notice)
        }, onError: { [weak self] error in
            guard let strongSelf  = self else {
                return
            }
            strongSelf.presenter.showError()
        })
    }
}
