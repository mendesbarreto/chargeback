//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import RxTest

@testable import Chargeback

final class ShowChargebackInformationUseCaseSpec: QuickSpec {

    private var chargeback: Chargeback {
        return ChargebackMock.chargeback
    }

    //swiftlint:disable function_body_length
    override func spec() {
        describe("ShowChargebackInformationUseCase") {
            var showChargebackUseCase: ShowChargebackInformationUseCase!
            var presenter: ChargebackPresenterInputMock!
            var resourceRouter: ResourceRouterMock!
            context("when initialized") {
                beforeEach {
                    presenter = ChargebackPresenterInputMock()
                    resourceRouter = ResourceRouterMock()
                    showChargebackUseCase = ShowChargebackInformationUseCase(resourceRouter: resourceRouter,
                                                                             presenter: presenter)
                }
                context("with a valid resource") {
                    beforeEach {
                        resourceRouter.stubbedChargeBackResult = Observable.just(self.chargeback)
                    }
                    context("and call show") {
                        beforeEach {
                            showChargebackUseCase.show()
                        }
                        it("should call presenter show loading") {
                            expect(presenter.invokedShowLoading).to(beTrue())
                            expect(presenter.invokedShowLoadingCount).to(equal(1))
                        }
                        it("should call presenter hide loading") {
                            expect(presenter.invokedHideLoading).to(beTrue())
                            expect(presenter.invokedHideLoadingCount).to(equal(1))
                        }
                        it("should call presenter show chargeback") {
                            expect(presenter.invokedShow).to(beTrue())
                            expect(presenter.invokedShowCount).to(equal(1))
                        }
                        it("should call presenter autoblock") {
                            expect(presenter.invokedShowAutoblock).to(beTrue())
                            expect(presenter.invokedShowAutoblockCount).to(equal(1))
                        }
                        it("shouldn't call presenter show error") {
                            expect(presenter.invokedShowError).to(beFalse())
                        }
                        it("should call resource router chargeback") {
                            expect(resourceRouter.invokedChargeBack).to(beTrue())
                            expect(resourceRouter.invokedChargeBackCount).to(equal(1))
                        }
                    }
                    context("and parse model problem") {
                        beforeEach {
                            presenter.stubbedShowError = NSAttributedStringError.problemToConvertStringToDataWithUnicode
                        }
                        context("and call show") {
                            beforeEach {
                                showChargebackUseCase.show()
                            }
                            it("should call presenter show loading") {
                                expect(presenter.invokedShowLoading).to(beTrue())
                                expect(presenter.invokedShowLoadingCount).to(equal(1))
                            }
                            it("should call presenter hide loading") {
                                expect(presenter.invokedHideLoading).to(beTrue())
                                expect(presenter.invokedHideLoadingCount).to(equal(1))
                            }
                            it("shouldn't call presenter show chargeback") {
                                expect(presenter.invokedShow).to(beTrue())
                                expect(presenter.invokedShowCount).to(equal(1))
                            }
                            it("should call presenter autoblock") {
                                expect(presenter.invokedShowAutoblock).to(beFalse())
                            }
                            it("should call presenter show error") {
                                expect(presenter.invokedShowError).to(beTrue())
                                expect(presenter.invokedShowErrorCount).to(equal(1))
                            }
                            it("should call resource router chargeback") {
                                expect(resourceRouter.invokedChargeBack).to(beTrue())
                                expect(resourceRouter.invokedChargeBackCount).to(equal(1))
                            }
                        }
                    }
                }
                context("with a resource error") {
                    beforeEach {
                        resourceRouter.stubbedChargeBackResult = Observable.error(TestError.defaultError)
                    }
                    context("and call show") {
                        beforeEach {
                            showChargebackUseCase.show()
                        }
                        it("should call presenter show loading") {
                            expect(presenter.invokedShowLoading).to(beTrue())
                            expect(presenter.invokedShowLoadingCount).to(equal(1))
                        }
                        it("should call presenter hide loading") {
                            expect(presenter.invokedHideLoading).to(beTrue())
                            expect(presenter.invokedHideLoadingCount).to(equal(1))
                        }
                        it("shouldn't call presenter show chargeback") {
                            expect(presenter.invokedShow).to(beFalse())
                        }
                        it("shouldn't call presenter autoblock") {
                            expect(presenter.invokedShowAutoblock).to(beFalse())
                        }
                        it("should call resource router chargeback") {
                            expect(resourceRouter.invokedChargeBack).to(beTrue())
                            expect(resourceRouter.invokedChargeBackCount).to(equal(1))
                        }
                        it("should call presenter show error") {
                            expect(presenter.invokedShowError).to(beTrue())
                            expect(presenter.invokedShowErrorCount).to(equal(1))
                        }
                    }
                }
            }
        }
    }
}
