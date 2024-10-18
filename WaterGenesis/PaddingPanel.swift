//
//  PaddingPanel.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//


import Foundation
import UIKit

class PaddingLabel: UILabel {
    
    override public var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    func setup() {
        isUserInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(
            target: self,
            action: #selector(showCopyMenu(sender:))
        ))
    }
    override func copy(_ sender: Any?) {
        UIPasteboard.general.string = text
        UIMenuController.shared.setMenuVisible(false, animated: true)
    }

    @objc func showCopyMenu(sender: Any?) {
        becomeFirstResponder()
        let menu = UIMenuController.shared
        if !menu.isMenuVisible {
            menu.setTargetRect(bounds, in: self)
            menu.setMenuVisible(true, animated: true)
        }
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return (action == #selector(copy(_:)))
    }
    var upInset: CGFloat = 0
    var downInset: CGFloat = 0
    var leftInset: CGFloat = 0
    var rightInset: CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        self.sendSubviewToBack(underline)
        let insets = UIEdgeInsets.init(top: upInset, left: leftInset, bottom: downInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize

            return CGSize(width: size.width + leftInset + rightInset,
                                 height: size.height + upInset + downInset)
    }
    
    
    
    private var underline = UIImageView()
    
    func makeunderline(color: UIColor) {
        self.addSubview(underline)
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        underline.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        underline.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 7).isActive = true
        underline.backgroundColor = color
        self.sendSubviewToBack(underline)
    }
}
