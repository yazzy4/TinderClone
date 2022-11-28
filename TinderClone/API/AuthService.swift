//
//  AuthService.swift
//  TinderClone
//
//  Created by Yaz Burrell on 11/28/22.
//

import Foundation
import UIKit
import Firebase

// handle all auth here

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let profileImage: UIImage
}

struct AuthService {
    
    static func registerUser(withCredentials credentials: AuthCredentials) {
        
        Service.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (results, error) in
                if let error = error {
                    print("DEBUG: error uploading image \(error.localizedDescription)")
                    return
                }
            }
        }
    }
}
