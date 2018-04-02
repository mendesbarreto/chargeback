//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxTest

@testable import Chargeback

final class CardBlockerStatusPresenterSpec: QuickSpec {
    private var chargeBack: Chargeback {
        return ChargebackMock.chargeback
    }

    //swiftlint:disable function_body_length
    override func spec () {
        super.spec()
        describe("CardBlockerStatusPresenter") {
            var presenter: CardBlockerStatusPresenter!
            var presenterOutput: CardBlockerStatusPresenterOutputMock!
            context("when initialized") {
                beforeEach {
                    presenterOutput = CardBlockerStatusPresenterOutputMock()
                    presenter = CardBlockerStatusPresenter(presenterOutput: presenterOutput)
                }
                context("and called show loading") {
                    beforeEach {
                        presenter.showLoading()
                    }
                    it("should call presenter output show loading") {
                        expect(presenterOutput.invokedShowLoading).to(beTrue())
                        expect(presenterOutput.invokedShowLoadingCount).to(equal(1))
                    }
                }
                context("and called hide loading") {
                    beforeEach {
                        presenter.hideLoading()
                    }
                    it("should call presenter output hide loading") {
                        expect(presenterOutput.invokedHideLoading).to(beTrue())
                        expect(presenterOutput.invokedHideLoadingCount).to(equal(1))
                    }
                }
                context("and called lock padLock view") {
                    beforeEach {
                        presenter.lockPadLockView()
                    }
                    it("should call presenter lock padLock view") {
                        expect(presenterOutput.invokedShow).to(beTrue())
                        expect(presenterOutput.invokedShowCount).to(equal(1))
                    }
                    context("with view model locked attribute") {
                        var viewModel: CardBlockerStatusViewModel!
                        var parameterViewModel: CardBlockerStatusViewModel!
                        beforeEach {
                            viewModel = CardBlockerStatusViewModelMock.viewModelLocked
                            parameterViewModel = presenterOutput.invokedShowParameters!.cardBlockViewModel
                        }
                        it("should be the same as presenter view model is locked ") {
                            expect(parameterViewModel.isCardBlocked).to(equal(viewModel.isCardBlocked))
                        }
                        it("should be the same as presenter view model is locked ") {
                            expect(parameterViewModel.descriptionUnLockedCard.string).to(equal(viewModel.descriptionUnLockedCard.string))
                        }
                        it("should be the same as presenter view model is locked ") {
                            expect(parameterViewModel.descriptionLockedCard.string).to(equal(viewModel.descriptionLockedCard.string))
                        }
                        it("should be the same as presenter view model is locked ") {
                            expect(parameterViewModel.unLockIconImage.cgImage).to(equal(viewModel.unLockIconImage.cgImage))
                        }
                        it("should be the same as presenter view model is locked ") {
                            expect(parameterViewModel.lockIconImage.cgImage).to(equal(viewModel.lockIconImage.cgImage))
                        }
                    }
                }
            }
        }
    }
}
