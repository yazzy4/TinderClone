//
//  HomeController.swift
//  TinderClone
//
//  Created by Yaz Burrell on 10/18/22.
//

import UIKit

class HomeController: UIViewController {
    // MARK: - Properties
    
    private let topStack = HomeNavigationStack()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(topStack)
        topStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
    }
}
