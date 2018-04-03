//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class CardBlockerStatusView: BindableView<CardBlockerStatusViewModel> {
    private let descriptionLabel: UILabel = UILabel()
    private let padLockImageView: UIImageView = UIImageView()

    private let blockCardPublishSubject = PublishSubject<Bool>()
    var blockCardAction: SharedSequence<SignalSharingStrategy, Bool> {
        return blockCardPublishSubject.asSignal(onErrorJustReturn: false)
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
        setupCardBlockStackViewGesture()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    override func bind(to viewModel: ViewModel) {
        super.bind(to: viewModel)
        updateCardBlockImageView()
    }

    private func updateCardBlockImageView() {
        if viewModel.isCardBlocked {
            padLockImageView.image = viewModel.lockIconImage
            descriptionLabel.attributedText = viewModel.descriptionLockedCard
        } else {
            padLockImageView.image = viewModel.unLockIconImage
            descriptionLabel.attributedText = viewModel.descriptionUnLockedCard
        }
    }

    private func setupCardBlockStackViewGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onCardBlockStackViewTapped))
        addGestureRecognizer(gesture)
    }

    @objc private func onCardBlockStackViewTapped() {
        let lastValue = viewModel.isCardBlocked
        let newValue = !viewModel.isCardBlocked
        if lastValue != newValue {
            blockCardPublishSubject.onNext(newValue)
        }
        updateCardBlockImageView()
    }
}

// MARK: Layout Card Blocker Status View

extension CardBlockerStatusView {
    private func setupLayout() {
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
