//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class NoticeView: BindableView<NoticeViewModel> {

    private let titleLabel: UILabel
    private let descriptionLabel: UILabel
    private let continueButton: NuDefaultButton
    private let closeButton: NuDefaultButton

    private let labelHolderView: UIView
    private let buttonHolderView: UIStackView

    var continueAction: SharedSequence<SignalSharingStrategy, Void> {
        return continueButton.rx.tap.asSignal(onErrorJustReturn: ())
    }

    var closeAction: SharedSequence<SignalSharingStrategy, Void> {
        return closeButton.rx.tap.asSignal(onErrorJustReturn: ())
    }

    override init(frame: CGRect = .zero) {
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        continueButton = NuDefaultButton()
        closeButton = NuDefaultButton()
        labelHolderView = UIView()
        buttonHolderView = UIStackView()
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    override func bind (to viewModel: ViewModel) {
        super.bind(to: viewModel)
        titleLabel.attributedText = viewModel.title
        descriptionLabel.attributedText = viewModel.description
        continueButton.setAttributedTitle(viewModel.continueButtonTitle, for: .normal)
        closeButton.setAttributedTitle(viewModel.closeButtonTitle, for: .normal)
    }
}

// MAK: Notice View Constraints

extension NoticeView {

    private func setupLayout() {
        addChild(view: buttonHolderView)
        addChild(view: labelHolderView)
        setupButtonStackView()
        setupLabelStackView()
        setupTitleLayout()
        setupDescriptionLayout()
    }

    private func setupButtonStackView() {
        //closeButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        //continueButton.heightAnchor.constraint(equalToConstant: 150)

        buttonHolderView.addArrangedSubview(continueButton)
        buttonHolderView.addArrangedSubview(closeButton)
        buttonHolderView.axis = .vertical
        buttonHolderView.distribution = .fillEqually
        buttonHolderView.startAnchor()
                        .bottomAnchor(to: contentView)
                        .leadingAnchor(to: contentView)
                        .trailingAnchor(to: contentView)
                        .heightAnchor.constraint(equalToConstant: 210).isActive = true
    }

    private func setupLabelStackView() {
        labelHolderView.startAnchor()
                       .topAnchor(to: contentView, constant: 40)
                       .leadingAnchor(to: contentView, constant: 20)
                       .trailingAnchor(to: contentView, constant: -20)
                       .bottomAnchor(toEqualAnchor: buttonHolderView.topAnchor)
    }

    private func setupTitleLayout () {
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byTruncatingTail

        labelHolderView.addSubview(titleLabel)
        titleLabel.startAnchor()
                  .trailingAnchor(to: labelHolderView)
                  .leadingAnchor(to: labelHolderView)
                  .topAnchor(to: labelHolderView)
    }

    private func setupDescriptionLayout() {
        descriptionLabel.textAlignment = .left
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0

        labelHolderView.addSubview(descriptionLabel)
        descriptionLabel.startAnchor()
                        .leadingAnchor(to: labelHolderView)
                        .trailingAnchor(to: labelHolderView)
                        .bottomAnchor(lessThanOrEqualTo: labelHolderView, constant: 10)
                        .topAnchor(toEqualAnchor: titleLabel.bottomAnchor, constant: 30)
    }
}
