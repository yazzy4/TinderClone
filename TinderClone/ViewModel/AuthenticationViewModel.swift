//
//  AuthenticationViewModel.swift
//  TinderClone
//
//  Created by Yaz Burrell on 11/12/22.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
        && password?.isEmpty == false
    }
}

struct RegistrationViewModel {
    
}
