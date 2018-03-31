//
// Created by douglas.barreto on 3/31/18.
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
        let hint: NSAttributedString = try .descriptionHTML(withText: chargeback.commentHint)
        let descriptionLockedCard = ChargebackPresenterConst.descriptionLockedCard
        let descriptionUnLockedCard = ChargebackPresenterConst.descriptionLockedCard
        let titleContestButton = ChargebackPresenterConst.titleContestButton
        let titleCancelButton = ChargebackPresenterConst.titleCancelButton
        let chargebackViewModel =
                ChargeBackViewModel(title: .titleBlack(withText: chargeback.title.uppercased()),
                                    descriptionLockedCard: .descriptionRed(withText: descriptionLockedCard),
                                    descriptionUnLockedCard: .descriptionRed(withText: descriptionUnLockedCard),
                                    descriptionMerchantRecognized: .descriptionBlack(withText: reasonMerchantRecognized.title),
                                    descriptionCardInPossession: .descriptionBlack(withText: reasonCardInPossession.title),
                                    descriptionHint: hint,
                                    titleContestButton: .titleButtonGray(withText: titleContestButton),
                                    titleCancelButton: .titleButtonGray(withText: titleCancelButton),
                                    isCardInPossession: false,
                                    isMerchantRecognized: false,
                                    lockIconImage: Assets.icChargebackLock.image,
                                    unLockIconImage: Assets.icChargebackUnlock.image)
        presenterOutput?.show(chargebackViewModel: chargebackViewModel)
    }

    func showError () {
        presenterOutput?.showError()
    }

    private func get (reasonDetails: [ReasonDetail], by: ReasonDetailIdKey) -> ReasonDetail? {
        return reasonDetails.first { $0.reasonKey == .merchantRecognized }
    }
}
