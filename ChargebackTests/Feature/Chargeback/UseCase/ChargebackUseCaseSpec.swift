//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import RxTest

@testable import Chargeback

final class ChargebackUseCaseSpec: QuickSpec {

    private var chargeBackUserResponse: ChargeBackUserResponse {
        return ChargeBackUserResponseMock.chargeBackUserResponse
    }

    override func spec() {
        super.spec()
        describe("ChargebackUseCase") {
            var resourceRouter: ResourceRouterMock!
            var presenter: ChargebackPresenterInputMock!
            var chargebackUseCase: ChargebackUseCase!
            context("when initialized") {
                beforeEach {
                    resourceRouter = ResourceRouterMock()
                    presenter = ChargebackPresenterInputMock()
                    chargebackUseCase = ChargebackUseCase(resourceRouter: resourceRouter,
                                                          presenter: presenter)
                }
                context("with a valid resource") {
                    beforeEach {
                        resourceRouter.stubbedExecResult = Observable.just(())
                    }
                    context("and call chargeback") {
                        beforeEach {
                            chargebackUseCase.chargeback(withUserResponse: self.chargeBackUserResponse)
                        }
                        it("should call show charge back action success") {
                            expect(presenter.invokedShowChargeBackActionSuccess).to(beTrue())
                            expect(presenter.invokedShowChargeBackActionSuccessCount).to(equal(1))
                        }
                        it("shouldn't call show charge back action error") {
                            expect(presenter.invokedShowChargeBackActionError).to(beFalse())
                        }
                        it("expect action type block card") {
                            let action = ResourceAction.chargeback(userResponse: self.chargeBackUserResponse)
                            expect(resourceRouter.invokedExecParameters!.action.name).to(equal(action.name))
                        }
                    }
                }
                context("with a resource error") {
                    beforeEach {
                        resourceRouter.stubbedExecResult = Observable.error(TestError.defaultError)
                    }
                    context("and call chargeback") {
                        beforeEach {
                            chargebackUseCase.chargeback(withUserResponse: self.chargeBackUserResponse)
                        }
                        it("shouldn't call show charge back action success") {
                            expect(presenter.invokedShowChargeBackActionSuccess).to(beFalse())
                        }
                        it("should call show charge back action error") {
                            expect(presenter.invokedShowChargeBackActionError).to(beTrue())
                            expect(presenter.invokedShowChargeBackActionErrorCount).to(equal(1))
                        }
                        it("expect action type block card") {
                            let action = ResourceAction.chargeback(userResponse: self.chargeBackUserResponse)
                            expect(resourceRouter.invokedExecParameters!.action.name).to(equal(action.name))
                        }
                    }
                }
            }
        }
    }
}
