//
//  Extension+UILabel.swift
//  ProjectExample
//
//  Created by Suite on 25/11/25.
//

import UIKit

extension UILabel {
    
    func setBold() {
        self.font = UIFont.boldSystemFont(ofSize: self.font.pointSize)
    }

    func setFontSize(size: Double) {
        self.font = self.font.withSize(CGFloat(size))
    }
    
    func setText(_ text: String) {
        self.text = text
    }
    
    func setLinesFree() {
        self.numberOfLines = 0
    }
    
    func setColor(_ color: UIColor) {
        self.textColor = color
    }
    
    func underLine() {
        guard let text = self.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        self.attributedText = attributedString
    }
}
