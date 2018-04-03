//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxTest

@testable import Chargeback

final class ChangeUserCardBlockStatusUseCaseSpec: QuickSpec {
    //swiftlint:disable function_body_length
    override func spec() {
        super.spec()
        describe("ChangeUserCardBlockStatusUseCase") {
            var changeUserCardBlockUserCase: ChangeUserCardBlockStatusUseCase!
            var resourceRouter: ResourceRouterMock!
            var presenter: CardBlockerStatusPresenterInputMock!
            context("when initialized") {
                beforeEach {
                    presenter = CardBlockerStatusPresenterInputMock()
                    resourceRouter = ResourceRouterMock()
                    changeUserCardBlockUserCase = ChangeUserCardBlockStatusUseCase(resourceRouter: resourceRouter,
                                                                                   presenter: presenter)
                }
                context("with a resource error") {
                    beforeEach {
                        resourceRouter.stubbedExecResult = Observable.error(TestError.defaultError)
                    }
                    context("and call change with block card action") {
                        beforeEach {
                            changeUserCardBlockUserCase.change(to: true)
                        }
                        it("should lock pad view") {
                            expect(presenter.invokedLockPadLockView).to(beTrue())
                        }
                        it("should call unlock pad view") {
                            expect(presenter.invokedUnlockPadLockView).to(beTrue())
                            expect(presenter.invokedUnlockPadLockViewCount).to(equal(1))
                        }
                        it("expect action type block card") {
                            expect(resourceRouter.invokedExecParameters!.action.name).to(equal(ResourceAction.blockCard.name))
                        }
                        it("should call resource router exec") {
                            expect(resourceRouter.invokedExec).to(beTrue())
                            expect(resourceRouter.invokedExecCount).to(equal(1))
                        }
                    }
                }
                context("with a valid resource") {
                    beforeEach {
                        resourceRouter.stubbedExecResult = Observable.just(())
                    }
                    context("and call change with block card action") {
                        beforeEach {
                            changeUserCardBlockUserCase.change(to: true)
                        }
                        it("should call lock pad view") {
                            expect(presenter.invokedLockPadLockView).to(beTrue())
                            expect(presenter.invokedLockPadLockViewCount).to(equal(1))
                        }
                        it("shouldn't call unlock pad view") {
                            expect(presenter.invokedUnlockPadLockView).to(beFalse())
                        }
                        it("expect action type block card") {
                            expect(resourceRouter.invokedExecParameters!.action.name).to(equal(ResourceAction.blockCard.name))
                        }
                        it("should call resource router exec") {
                            expect(resourceRouter.invokedExec).to(beTrue())
                            expect(resourceRouter.invokedExecCount).to(equal(1))
                        }
                    }
                    context("and call exec with unblock card action") {
                        beforeEach {
                            changeUserCardBlockUserCase.change(to: false)
                        }
                        it("shouldn't call lock pad view") {
                            expect(presenter.invokedLockPadLockView).to(beFalse())
                        }
                        it("should call unlock pad view") {
                            expect(presenter.invokedUnlockPadLockView).to(beTrue())
                            expect(presenter.invokedUnlockPadLockViewCount).to(equal(1))
                        }
                        it("expect action type block card") {
                            expect(resourceRouter.invokedExecParameters!.action.name).to(equal(ResourceAction.unblockCard.name))
                        }
                        it("should call resource router exec") {
                            expect(resourceRouter.invokedExec).to(beTrue())
                            expect(resourceRouter.invokedExecCount).to(equal(1))
                        }
                    }
                }
            }
        }
    }
}
