//
//  Service.swift
//  TinderClone
//
//  Created by Yaz Burrell on 11/28/22.
//

import Foundation
import Firebase
import UIKit

// base service class for all API calls, used in multiple places

struct Service {
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
   static func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        
        COLLECTION_USERS.getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                
                users.append(user)
                
                if users.count == snapshot?.documents.count {
                    completion(users)
                }
            })
        }
    }
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("DEBUG: error uploading image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
