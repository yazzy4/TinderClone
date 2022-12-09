//
//  User.swift
//  TinderClone
//
//  Created by Yaz Burrell on 10/26/22.
//

import UIKit

struct User {
    var name: String
    var age: Int
    var email: String
    let uid: String
    let profileImageUrl: String
    
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["fullname"] as? String ?? ""
        self.age = dictionary["age"] as? Int ?? 0
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["imageUrl"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
