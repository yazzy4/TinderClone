//
//  LoginController.swift
//  TinderClone
//
//  Created by Yaz Burrell on 11/1/22.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "app_icon")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .white
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        configureGradient()
        
        view.addSubview(iconImageView)
        iconImageView.centerX(inView: view)
        iconImageView.setDimensions(height: 100, width: 100)
        iconImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    }
    
    func configureGradient() {
        guard let topColor = UIColor(hex: "#FD297Bff") else { return }
        guard let bottomColor = UIColor(hex: "#FF655Bff") else { return }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0, 1]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.frame
        
    }
    
}
