//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

enum ChargebackPresenterError: Error {
    case problemToFindDetailsReasons
}

struct ChargebackPresenterConst {
    static let titleContestButton = "Contestar"
    static let titleCancelButton = "Cancelar"
    static let descriptionLockedCard = "Bloqueamos preventivamente o seu cartão"
    static let descriptionUnLockedCard = "Cartão desbloqueado, recomendamos mantê-lo bloqueado"
}

final class ChargebackPresenter: ChargebackPresenterInput {

    private weak var presenterOutput: ChargebackPresenterOutput?

    init (presenterOutput: ChargebackPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func show (chargeback: Chargeback) throws {
        guard let reasonMerchantRecognized = get(reasonDetails: chargeback.reasonDetails, by: .merchantRecognized),
              let reasonCardInPossession = get(reasonDetails: chargeback.reasonDetails, by: .cardInPossession) else {
            throw ChargebackPresenterError.problemToFindDetailsReasons
        }
        let reasonMerchantViewModel = ReasonDetailViewModel(detailIdKey: reasonMerchantRecognized.reasonKey!,
                                                            description: .descriptionBlack(withText: reasonMerchantRecognized.title))
        let reasonCardInPossessionViewModel = ReasonDetailViewModel(detailIdKey: reasonCardInPossession.reasonKey!,
                                                                    description: .descriptionBlack(withText: reasonCardInPossession.title))

        let hint: NSAttributedString = try .descriptionHTML(withText: chargeback.commentHint)
        let titleContestButton = ChargebackPresenterConst.titleContestButton
        let titleCancelButton = ChargebackPresenterConst.titleCancelButton

        let chargebackViewModel =
                ChargebackViewModel(title: .titleSmallBlack(withText: chargeback.title.uppercased()),
                                    reasonCardInPossessionViewModel: reasonCardInPossessionViewModel,
                                    reasonMerchantViewModel: reasonMerchantViewModel,
                                    descriptionHint: hint,
                                    titleContestButton: .titleButtonGray(withText: titleContestButton),
                                    titleCancelButton: .titleButtonGray(withText: titleCancelButton),
                                    isCardInPossession: false,
                                    isMerchantRecognized: false)

        presenterOutput?.show(chargebackViewModel: chargebackViewModel)
    }

    func showError () {
        presenterOutput?.showChargebackFailAlert()
    }

    func showChargeBackActionSuccess () {
        presenterOutput?.showChargebackSuccessAlert()
    }

    func showChargeBackActionError () {
        presenterOutput?.showChargebackFailAlert()
    }

    func showLoading () {
        presenterOutput?.showLoading()
    }

    func hideLoading () {
        presenterOutput?.hideLoading()
    }

    func showAutoblock () {
        presenterOutput?.showAutoblock()
    }

    func get (reasonDetails: [ReasonDetail], by key: ReasonDetailIdKey) -> ReasonDetail? {
        return reasonDetails.first { $0.reasonKey == key }
    }
}
