//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ChargebackView: BindableViewDefaultConstraints<ChargebackViewModel>, UITextViewDelegate {

    private let titleLabel = UILabel()
    private let commentTextView = UITextView()
    private let headerContentView = UIView()
    private let contestButton = UIButton()
    private let cancelButton = UIButton()

    private let padlockImageView = UIImageView()
    private let cardBlockDescription = UILabel()

    private let bodyContentView = UIView()
    private let bottomContentView = UIView()
    private let buttonsStackView = UIStackView()

    private let separatorHeaderView = UIView()
    private let separatorBottomView = UIView()

    private let reasonCardInPossessionView = ReasonDetailView()
    private let reasonMerchantView = ReasonDetailView()
    private let cardBlockerStatusView = CardBlockerStatusView()

    var blockCardAction: SharedSequence<SignalSharingStrategy, Bool> {
        return cardBlockerStatusView.blockCardAction
    }

    var contestAction: SharedSequence<SignalSharingStrategy, Void> {
        return contestButton.rx.tap.asSignal(onErrorJustReturn: ())
    }

    var cancelAction: SharedSequence<SignalSharingStrategy, Void> {
        return cancelButton.rx.tap.asSignal(onErrorJustReturn: ())
    }

    var hinComment: String {
        return commentTextView.text
    }

    var reasonCardInPossessionIsOn: Bool {
        return reasonCardInPossessionView.isOn
    }

    var reasonMerchantIsOn: Bool {
        return reasonMerchantView.isOn
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
        setupCommentTextView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    override func bind(to viewModel: ViewModel) {
        super.bind(to: viewModel)
        titleLabel.attributedText = viewModel.title
        commentTextView.attributedText = viewModel.descriptionHint
        cancelButton.setAttributedTitle(viewModel.titleCancelButton, for: .normal)
        reasonMerchantView.bind(to: viewModel.reasonMerchantViewModel)
        contestButton.setAttributedTitle(viewModel.titleContestButton, for: .normal)
        contestButton.setAttributedTitle(viewModel.titleContestDisabledButton, for: .disabled)
        reasonCardInPossessionView.bind(to: viewModel.reasonCardInPossessionViewModel)
        updateButtonContext()
    }

    private func setupCommentTextView() {
        commentTextView.delegate = self
    }

    // In the next refactor Remover cardBlockerStatusView and move to view controller
    func bind(toCardBlockerViewModel viewModel: CardBlockerStatusViewModel) {
        cardBlockerStatusView.bind(to: viewModel)
    }

    // MARK: TextView Delegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if commentTextView.attributedText == viewModel.descriptionHint {
            commentTextView.text = ""
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        updateButtonContext()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if commentTextView.text.isEmpty {
            commentTextView.attributedText = viewModel.descriptionHint
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        commentTextView.resignFirstResponder()
    }

    private func updateButtonContext() {
        if commentTextView.attributedText != viewModel.descriptionHint && !commentTextView.text.isEmpty {
            contestButton.isEnabled = true
        } else {
            contestButton.isEnabled = false
        }
    }
}

// MARK: Layout Chargeback View

extension ChargebackView {
    private func setupLayout() {
        setupHeaderLayout()
        setupTitleLayout()
        setupBodyLayout()
        setupBottomLayout()
        setupButtonStackViewLayout()
        setupCommentViewLayout()
        setupCardBalockStackViewLayout()
        setupREasonMerchanViewLayout()
        bodyContentView.addSubview(reasonCardInPossessionView)
        reasonCardInPossessionView.startAnchor()
                                  .leadingAnchor(to: bodyContentView)
                                  .trailingAnchor(to: bodyContentView)
                                  .topAnchor(toEqualAnchor: reasonMerchantView.bottomAnchor)
        reasonCardInPossessionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        setupSeparatorLayout()
    }

    private func setupSeparatorLayout() {
        addChild(view: separatorHeaderView)
        separatorHeaderView.startAnchor()
                           .topAnchor(toEqualAnchor: bodyContentView.bottomAnchor)
                           .leadingAnchor(to: contentView)
                           .trailingAnchor(to: contentView)
                .heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorHeaderView.backgroundColor = .disabledGrayNu
        addChild(view: separatorBottomView)
        separatorBottomView.startAnchor()
                           .topAnchor(toEqualAnchor: bodyContentView.topAnchor)
                           .leadingAnchor(to: contentView)
                           .trailingAnchor(to: contentView)
                .heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorBottomView.backgroundColor = .disabledGrayNu
    }

    private func setupREasonMerchanViewLayout() {
        bodyContentView.addSubview(reasonMerchantView)
        reasonMerchantView.startAnchor()
                          .leadingAnchor(to: bodyContentView)
                          .trailingAnchor(to: bodyContentView)
                          .topAnchor(toEqualAnchor: cardBlockerStatusView.bottomAnchor)
        reasonMerchantView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        reasonMerchantView.backgroundColor = .clear
    }

    private func setupCardBalockStackViewLayout() {
        bodyContentView.addSubview(cardBlockerStatusView)
        cardBlockerStatusView.startAnchor()
                             .leadingAnchor(to: bodyContentView)
                             .trailingAnchor(to: bodyContentView)
                             .topAnchor(to: bodyContentView)
                .heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupCommentViewLayout() {
        bottomContentView.addSubview(commentTextView)
        commentTextView.clipsToBounds = true
        commentTextView.textAlignment = .left
        commentTextView.isEditable = true
        commentTextView.startAnchor()
                       .topAnchor(to: bottomContentView, constant: 0)
                       .leadingAnchor(to: bottomContentView, constant: 0)
                       .trailingAnchor(to: bottomContentView, constant: 0)
                       .bottomAnchor(toEqualAnchor: buttonsStackView.topAnchor)
    }

    private func setupButtonStackViewLayout() {
        bottomContentView.addSubview(buttonsStackView)
        buttonsStackView.startAnchor()
                        .bottomAnchor(to: bottomContentView)
                        .leadingAnchor(to: bottomContentView)
                        .trailingAnchor(to: bottomContentView)
        buttonsStackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(contestButton)
        buttonsStackView.spacing = 80
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
    }

    private func setupBottomLayout() {
        addChild(view: bottomContentView)
        bottomContentView.startAnchor()
                         .bottomAnchor(to: contentView)
                         .leadingAnchor(to: contentView, constant: 15)
                         .trailingAnchor(to: contentView, constant: -15)
                         .topAnchor(toEqualAnchor: bodyContentView.bottomAnchor)
    }

    private func setupBodyLayout() {
        addChild(view: bodyContentView)
        bodyContentView.startAnchor()
                       .topAnchor(toEqualAnchor: headerContentView.bottomAnchor)
                       .leadingAnchor(to: contentView, constant: 15)
                       .trailingAnchor(to: contentView, constant: -15)
        bodyContentView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }

    private func setupTitleLayout() {
        titleLabel.textAlignment = .center
        headerContentView.addSubview(titleLabel)
        titleLabel.startAnchor()
                  .leadingAnchor(to: headerContentView)
                  .trailingAnchor(to: headerContentView)
                .centerYAnchor.constraint(equalTo: headerContentView.centerYAnchor).isActive = true
    }

    private func setupHeaderLayout() {
        addChild(view: headerContentView)
        headerContentView.startAnchor()
                         .topAnchor(to: contentView)
                         .leadingAnchor(to: contentView)
                         .trailingAnchor(to: contentView)
                .heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
