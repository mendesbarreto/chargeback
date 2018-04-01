//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct CardBlockerStatusViewModel {
    let lockIconImage: UIImage
    let unLockIconImage: UIImage
    let descriptionLockedCard: NSAttributedString
    let descriptionUnLockedCard: NSAttributedString
}

final class CardBlockerStatusView: BindableView<CardBlockerStatusViewModel> {
    private let descriptionLabel: UILabel = UILabel()
    private let padLockImageView: UIImageView = UIImageView()

    private let blockCardPublishSubject = PublishSubject<Bool>()
    var blockCardAction: SharedSequence<SignalSharingStrategy, Bool> {
        return blockCardPublishSubject.asSignal(onErrorJustReturn: false)
    }

    private var isCardBlocked: Bool = false {
        didSet {
            updateCardBlockImageView()
            blockCardPublishSubject.onNext(isCardBlocked)
        }
    }

    override init (frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
        setupCardBlockStackViewGesture()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    override func bind (to viewModel: ViewModel) {
        super.bind(to: viewModel)
        isCardBlocked = false
    }

    private func updateCardBlockImageView () {
        if isCardBlocked {
            padLockImageView.image = viewModel.lockIconImage
            descriptionLabel.attributedText = viewModel.descriptionLockedCard
        } else {
            padLockImageView.image = viewModel.unLockIconImage
            descriptionLabel.attributedText = viewModel.descriptionUnLockedCard
        }
    }

    private func setupCardBlockStackViewGesture () {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onCardBlockStackViewTapped))
        addGestureRecognizer(gesture)
    }

    @objc private func onCardBlockStackViewTapped () {
        isCardBlocked = !isCardBlocked
    }
}

// MARK: Layout Card Blocker Status View

extension CardBlockerStatusView {
    private func setupLayout () {
        addChild(view: padLockImageView)
        addChild(view: descriptionLabel)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textAlignment = .left
        descriptionLabel.lineBreakMode = .byClipping
        padLockImageView.contentMode = .scaleAspectFit
        padLockImageView.startAnchor()
                        .leadingAnchor(to: contentView)
                .widthAnchor.constraint(equalToConstant: 30).isActive = true
        padLockImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        padLockImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionLabel.startAnchor()
                        .trailingAnchor(to: contentView)
                .leadingAnchor.constraint(equalTo: padLockImageView.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
