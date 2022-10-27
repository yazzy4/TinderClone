//
//  CardView.swift
//  TinderClone
//
//  Created by Yaz Burrell on 10/19/22.
//

import UIKit

enum SwipeDirection: Int {
    case left = -1
    case right = 1
}


class CardView: UIView {
    
    // MARK: - Properties
    
    // class level to access in more than one place
    private let gradientLayer = CAGradientLayer()
    
    private let viewModel: CardViewModel
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // have to make this lazy because not accessible outside of a method
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.attributedText = viewModel.userInfoText
        return label
       
    }()
    
    // always original keeps white color for button
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "info_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    // creates custom initializer from cardViewVm vs the default initializer given from UIView subclass
    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        confugureGestureRecognizer()
        
        imageView.image = viewModel.user.images.first
    
        // can also put attributed text here if using private let
        // infolabel.attributedText = viewModel.userInfoText
        
        backgroundColor = .systemPurple
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        configureGradientLayer()
        
        addSubview(infoLabel)
        infoLabel.anchor(left: leftAnchor, bottom:  bottomAnchor, right: rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
        
        addSubview(infoButton)
        infoButton.setDimensions(height: 40, width: 40)
        infoButton.centerY(inView: infoLabel)
        infoButton.anchor(right: rightAnchor, paddingRight: 16)
        
        
        
        
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.frame
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            print("DEBUG: pan began...")
        case .changed:
            panCard(sender: sender)
        case .ended:
            resetCardPosition(sender: sender)
        default: break
        }
    }
    
    @objc func handleChangePhoto(sender: UITapGestureRecognizer) {
        
    }
    
    // MARK: - Helpers
    
    func panCard(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 100
        let rotationalTransform = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
    }
    
    func resetCardPosition(sender: UIPanGestureRecognizer) {
        // handles if user swipes more than 100 pixels either right or left
        let direction: SwipeDirection = sender.translation(in: nil).x > 100 ? .right : .left
        
        // dismisses the card only if it has been swiped greated than 100 pixels
        let shouldDismissCard = abs(sender.translation(in: nil).x) > 100
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            
            if shouldDismissCard {
                let xTranslation = CGFloat(direction.rawValue) * 1000
                let offscreenTransform = self.transform.translatedBy(x: xTranslation, y: 0)
                self.transform = offscreenTransform
            } else {
                // returns to orginal form
                self.transform = .identity
            }

        }) { _ in
            if shouldDismissCard {
                self.removeFromSuperview()
            }
        }
    }
    
    func configureGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        layer.addSublayer(gradientLayer)
        
    }
    
    func confugureGestureRecognizer() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleChangePhoto))
        addGestureRecognizer(tap)
    }
    
}
