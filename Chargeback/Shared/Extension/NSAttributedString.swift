//
// Created by douglas.barreto on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

enum NSAttributedStringError: Error {
    case problemToConvertStringInData
}

extension NSAttributedString {
    static func titlePurple(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: UIColor.purpleNu,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func titleBlack(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: UIColor.purpleNu,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func titleButtonPurple(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: UIColor.purpleNu,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func titleButtonGray(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: UIColor.purpleNu,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }
}

extension NSAttributedString {

    static func descriptionHTMLGray(withText text: String ) -> NSAttributedString {
        return try! attributedStringHTML(withText: text,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func descriptionGray(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: UIColor.purpleNu,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func descriptionRed(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: UIColor.purpleNu,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func descriptionBlack(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: UIColor.purpleNu,
                                andFont: UIFont.systemFont(ofSize: 30, weight: .bold))
    }

    static func attributedString (withText text: String, andColor color: UIColor, andFont font: UIFont) -> NSAttributedString {
        let nuAttributes: [NSAttributedStringKey: Any] = [.foregroundColor: color,
                                                          .font: font]
        return NSAttributedString(string: text, attributes: nuAttributes)
    }

    static func attributedStringHTML(withText text: String,
                                     andFont font: UIFont) throws -> NSAttributedString {
        guard let stringData = text.data(using: .unicode) else {
            throw NSAttributedStringError.problemToConvertStringInData
        }

        var mutableAttr = try NSMutableAttributedString(data:
                               stringData,
                               options: [.documentType: NSAttributedString.DocumentType.html],
                               documentAttributes: nil)

        let mutableString = mutableAttr.mutableString
        let range = mutableString.range(of: mutableString.description)

        mutableAttr.addAttribute(.font, value: font, range: range)

        return mutableAttr
    }
}
