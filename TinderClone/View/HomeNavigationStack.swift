//
//  HomeNavigationStack.swift
//  TinderClone
//
//  Created by Yaz Burrell on 10/18/22.
//

import UIKit

class HomeNavigationStack: UIStackView {
    // MARK: - Properties
    
    let settingsButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let tinderIcon = UIImageView(image: UIImage(named: "app_icon"))
    
    // MARK: - Lifecycycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        tinderIcon.contentMode = .scaleAspectFit
      
        settingsButton.setImage(UIImage(named: "top_left_profile")?.withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(UIImage(named: "top_right_messages")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        [settingsButton, UIView(), tinderIcon, UIView(), messageButton].forEach { view in
            addArrangedSubview(view)
        }
        
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
