//
// Created by douglas.barreto on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

extension NSAttributedString {
    static func titlePurple(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func titleBlack(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func titleButtonPurple(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func titleButtonGray(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }
}

extension NSAttributedString {

    static func descriptionHTMLGray(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func descriptionGray(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func descriptionRed(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func descriptionBlack(withText text: String ) -> NSAttributedString {
        return attributedText(withText: text,
                              andColor: UIColor.purpleNu,
                              andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func attributedText (withText text: String, andColor color: UIColor, andFont font: UIFont ) -> NSAttributedString {
        let nuAttributes: [NSAttributedStringKey: Any] = [.foregroundColor: color,
                                                          .font: font]
        return NSAttributedString(string: text, attributes: nuAttributes)
    }
}
