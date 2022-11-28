//
//  RegistrationController.swift
//  TinderClone
//
//  Created by Yaz Burrell on 11/1/22.
//

import UIKit


class RegistrationController: UIViewController {
    // MARK: - Properties
    
    private var viewModel = RegistrationViewModel()
    
    private let selectPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let fullnameTextField = CustomTextField(placeholder: "Full Name")
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecureTextField: true)
    
    private let authButton: AuthButton = {
        let button = AuthButton(title: "Sign Up", type: .system)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    private let goToLoginButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 17)])
        
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 17)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congfigureUI()
        configureTextFieldObservers()
    }
    
    // MARK: - Actions
    
    @objc func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else {
            viewModel.fullname = sender.text
        }
       checkForStatus()
    }
    
    @objc func handleSelectPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        present(picker, animated:  true)
    }
    
    @objc func handleRegistration() {
        AuthService.registerUser()
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func checkForStatus() {
        if viewModel.formIsValid {
            authButton.isEnabled = true
            authButton.backgroundColor = .systemPink
        } else {
            authButton.isEnabled = false
            authButton.backgroundColor = UIColor(hex: "#FF655Bff")
        }
    }
    
    func congfigureUI() {
        configureGradientLayer()
        
        view.addSubview(selectPhotoButton)
        selectPhotoButton.setDimensions(height: 275, width: 275)
        selectPhotoButton.centerX(inView: view)
        selectPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, fullnameTextField, passwordTextField, authButton])
        
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: selectPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(goToLoginButton)
        goToLoginButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
    }
    
    func configureTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        selectPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        selectPhotoButton.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        selectPhotoButton.layer.borderWidth = 3
        selectPhotoButton.layer.cornerRadius = 10
        selectPhotoButton.imageView?.contentMode = .scaleAspectFill
        
        dismiss(animated: true, completion: nil)
    }
}
