//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct Strings {

    struct LoadingAlert {
        static let message = "Por favor espere..."
    }

    struct NuAlert {
        static let successTitle = "Contestação de compra recebida"
        static let successDescription = "Fique de olho no seu email! Nos próximos 3 dias você deverá receber um primeiro retorno sobre sua contestação"

        static let failTitle = "Ops, Ocorreu alguma problema"
        static let failDescription = "Verifique sua conexão com a rede ou tente mais tarde. Muito Obrigado"

        static let closeButtonTitle = "Fechar"
    }

    struct Chargeback {
        static let titleContestButton = "Contestar"
        static let titleCancelButton = "Cancelar"
        static let descriptionLockedCard = "Bloqueamos preventivamente o seu cartão"
        static let descriptionUnLockedCard = "Cartão desbloqueado, recomendamos mantê-lo bloqueado"
    }
}
