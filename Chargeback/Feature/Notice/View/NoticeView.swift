//
// Created by douglas.barreto on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class NoticeView: BindableView<NoticeViewModel> {

    private let titleLabel: UILabel
    private let descriptionLabel: UILabel
    private let continueButton: UIButton
    private let closeButton: UIButton

    private let labelHolderView: UIView
    private let buttonHolderView: UIStackView

    override init(frame: CGRect = .zero) {
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        continueButton = UIButton()
        closeButton = UIButton()
        labelHolderView = UIView()
        buttonHolderView = UIStackView()
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    override func bind (to viewModel: ViewModel) {
        titleLabel.attributedText = viewModel.title
        descriptionLabel.attributedText = viewModel.description
        continueButton.setAttributedTitle(viewModel.continueButtonTitle, for: .normal)
        closeButton.setAttributedTitle(viewModel.closeButtonTitle, for: .normal)
    }
}

// MAK: Notice View Constraints

extension NoticeView {

    private func setupLayout() {
        addSubview(buttonHolderView)
        addSubview(labelHolderView)
        setupButtonStackView()
        setupLabelStackView()
        setupTitleLayout()
        setupDescriptionLayout()
    }

    private func setupButtonStackView() {
        buttonHolderView.addArrangedSubview(continueButton)
        buttonHolderView.addArrangedSubview(closeButton)
        buttonHolderView.axis = .vertical
        buttonHolderView.distribution = .fillProportionally
        buttonHolderView.startAnchor()
                        .bottomAnchor(to: self)
                        .leadingAnchor(to: self)
                        .trailingAnchor(to: self)
    }

    private func setupLabelStackView() {
        labelHolderView.backgroundColor = .disabledGrayNu
        labelHolderView.startAnchor()
                       .topAnchor(to: self)
                       .leadingAnchor(to: self)
                       .trailingAnchor(to: self)
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
                        .topAnchor(toEqualAnchor: titleLabel.bottomAnchor)
    }
}
