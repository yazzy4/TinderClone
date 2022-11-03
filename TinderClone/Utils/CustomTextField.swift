//
//  CustomTextField.swift
//  TinderClone
//
//  Created by Yaz Burrell on 11/3/22.
//

import UIKit

class CustomTextField: UITextField {

    init(placeholder: String, isSecureTextField: Bool? = false) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        keyboardAppearance = .dark
        borderStyle = .none
        textColor = .white
        backgroundColor = UIColor(white: 1, alpha: 0.2)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        layer.cornerRadius = 5
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        isSecureTextEntry = isSecureTextField!
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
