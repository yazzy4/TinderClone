//
//  AuthenticationViewModel.swift
//  TinderClone
//
//  Created by Yaz Burrell on 11/12/22.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsValid: Bool  { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
        && password?.isEmpty == false
    }
}

struct RegistrationViewModel: AuthenticationViewModel {
    var email: String?
    var fullname: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
        && password?.isEmpty == false
        && fullname?.isEmpty == false
    }
    
}
