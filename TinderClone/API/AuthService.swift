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
    
    static func registerUser(withCredentials credentials: AuthCredentials, completion: @escaping((Error?) -> Void)) {
        
        Service.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                if let error = error {
                    print("DEBUG: error signing user up \(error.localizedDescription)")
                    return
                }
                
                guard let uid  = result?.user.uid else { return }
                
                let data = ["email": credentials.email,
                            "fullname": credentials.fullname,
                            "imageUrl": imageUrl,
                            "uid": uid,
                            "age": 18] as [String: Any]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion) 
            }
        }
    }
}
