//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ShowChargebackInformationUseCase {

    private let presenter: ChargebackPresenterInput

    init (presenter: ChargebackPresenterInput) {
        self.presenter = presenter
    }

    func show () {
        let hint = "Nos conte <strong>em detalhes</strong> o que aconteceu com a sua compra em Transaction..."
        let reasonDetailMerchant = ReasonDetail(id: "merchant_recognized", title: "Reconhece o estabelecimento?")
        let reasonDetailCardPossession = ReasonDetail(id: "card_in_possession", title: "Está com o cartão em mãos?")
        let chargeBack = Chargeback(id: "fraud",
                                    commentHint: hint,
                                    title: "Não reconheço esta compra",
                                    autoblock: true,
                                    reasonDetails: [reasonDetailMerchant, reasonDetailCardPossession],
                                    links: [:])
        show(chargeback: chargeBack)
    }

    private func show (chargeback: Chargeback) {
        do {
            try presenter.show(chargeback: chargeback)
        } catch {
            presenter.showError()
        }
    }
}
