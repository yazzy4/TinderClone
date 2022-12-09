//
//  CardViewModel.swift
//  TinderClone
//
//  Created by Yaz Burrell on 10/26/22.
//

import UIKit

class CardViewModel {
    
    let user: User
    
    let userInfoText: NSAttributedString
    private var imageIndex = 0
    
    var imageCollection: UIImage?
    
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]))
        
        self.userInfoText = attributedText
    }
    
    func showNextPhoto() {
//        guard imageIndex < user.images.count - 1 else { return }
//        
//        imageIndex += 1
//        self.imageCollection = user.images[imageIndex]
    
    }
    
    func showPreviousPhoto() {
//        guard imageIndex > 0 else { return }
//        imageIndex -= 1
//        self.imageCollection = user.images[imageIndex]
    }
}
