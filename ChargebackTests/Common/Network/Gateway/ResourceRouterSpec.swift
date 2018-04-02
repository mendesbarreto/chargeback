//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxTest
import RxBlocking
import RxTest

@testable import Chargeback

final class ResourceRouterSpec: QuickSpec {

    var baseModel: BaseModel {
        return BaseModel(links: [ResourceKey.notice.rawValue: Resource(href: "https://nu-mobile-hiring.herokuapp.com/notice")])
    }
    var notice: Notice {
        return NoticeMock.noticeMock
    }

    //swiftlint:disable force_try
    override func spec () {
        super.spec()
        describe("ResourceRouter") {
            var gatewayChargeBack: ResourceGatewayMock<Chargeback>!
            var router: ResourceRouter!
            context("with notice gateway") {
                var gatewayNotice: ResourceGatewayMock<Notice>!
                beforeEach {
                    gatewayNotice = ResourceGatewayMock<Notice>()
                }
                context("when initialized") {
                    beforeEach {
                        router = ResourceRouter(noticeGateway: gatewayNotice)
                    }
                    context("with a valid notice model") {
                        beforeEach {
                            gatewayNotice.stubbedRequestInitialResourceResult = Observable.just(self.baseModel)
                            gatewayNotice.stubbedRequestResult = Observable.just(self.notice)
                        }
                        context("and called notice") {
                            var noticeStream: [Notice]!
                            beforeEach {
                                noticeStream = try! router.notice().toBlocking().toArray()
                            }
                            it("should has one stream values") {
                                expect(noticeStream.count).to(equal(1))
                            }
                            it("should call resource gateway initial resource") {
                                expect(gatewayNotice.invokedRequestInitialResource).to(beTrue())
                                expect(gatewayNotice.invokedRequestInitialResourceCount).to(equal(1))
                            }
                            it("expect notice model the same as router current resource") {
                                let noticeLinks = self.notice.links
                                router.currentResource.links.forEach { (arg: (key: String, value: Resource)) in
                                    let (key, value) = arg
                                    expect(noticeLinks[key]?.href).to(equal(value.href))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
