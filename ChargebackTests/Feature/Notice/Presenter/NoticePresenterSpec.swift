//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxTest

@testable import Chargeback

final class NoticePresenterSpec: QuickSpec {

    var noticeMock: Notice {
        return NoticeMock.noticeMock
    }

    //swiftlint:disable force_try
    override func spec () {
        super.spec()
        describe("ShowNoticeUseCase") {
            var presenterOutput: NoticePresenterOutputMock!
            var presenter: NoticePresenter!
            context("when initialized") {
                beforeEach {
                    presenterOutput = NoticePresenterOutputMock()
                    presenter = NoticePresenter(presenterOutput: presenterOutput)
                }
                context("and call showError") {
                    beforeEach {
                        presenter.showError()
                    }
                    it("should call presenterOutput showError") {
                        expect(presenterOutput.invokedShowError).to(beTrue())
                    }
                }
                context("and call showLoading") {
                    beforeEach {
                        presenter.showLoading()
                    }
                    it("should call presenterOutput showLoading") {
                        expect(presenterOutput.invokedShowLoading).to(beTrue())
                    }
                }
                context("and call hideLoading") {
                    beforeEach {
                        presenter.hideLoading()
                    }
                    it("should call presenterOutput hideLoading") {
                        expect(presenterOutput.invokedHideLoading).to(beTrue())
                    }
                }
                context("and call show") {
                    beforeEach {
                        try! presenter.show(notice: self.noticeMock)
                    }
                    it("should call presenter output show") {
                        expect(presenterOutput.invokedShow).to(beTrue())
                        expect(presenterOutput.invokedShowCount).to(equal(1))
                    }
                    context("with view model") {
                        var viewModel: NoticeViewModel!
                        var noticeModel: Notice!
                        beforeEach {
                            viewModel = presenterOutput.invokedShowParameters!.notice
                            noticeModel = self.noticeMock
                        }
                        it("expect title be the same as notice model title") {
                            expect(noticeModel.title).to(equal(viewModel.title.string))
                        }
                        it("expect description be the same notice model description") {
                            expect(noticeModel.description).to(equal(viewModel.description.string))
                        }
                        it("expect secondaryAction title be the same as close button title ") {
                            expect(noticeModel.secondaryAction.title.uppercased()).to(equal(viewModel.closeButtonTitle.string))
                        }
                        it("expect primaryAction be the same as continue button title") {
                            expect(noticeModel.primaryAction.title.uppercased()).to(equal(viewModel.continueButtonTitle.string))
                        }
                    }
                }
            }
        }
    }
}
