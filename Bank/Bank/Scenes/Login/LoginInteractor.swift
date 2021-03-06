//
//  LoginInteractor.swift
//  Bank
//
//  Created by Oscar Veroneze Junior on 12/04/19.
//  Copyright (c) 2019 Junior Veroneze. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic {
    func validateFields(user: UITextField, password: UITextField, errorView: UIView, errorLabel: UILabel) -> Bool
}

protocol LoginDataStore {
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    // MARK: Validade fields to all condicional
    func validateFields(user: UITextField, password: UITextField, errorView: UIView, errorLabel: UILabel) -> Bool {
        if fieldIsEmpty(user: user, password: password, errorView: errorView, errorLabel: errorLabel) && textUserIsValid(user: user, password: password, errorView: errorView, errorLabel: errorLabel) && textPasswordIsValid(password: password, user: user, errorView: errorView, errorLabel: errorLabel) {
            
            presenter?.removeErrorTextField(textField: user)
            presenter?.removeErrorTextField(textField: password)
            presenter?.removeErrorMessage(errorView: errorView)
            
            return true
        }
        
        return false
    }
    
    // MARK: Empty field validade
    func fieldIsEmpty(user: UITextField, password: UITextField, errorView: UIView, errorLabel: UILabel) -> Bool {
        let userValue = user.text ?? ""
        let passwordValue = password.text ?? ""
        
        if userValue.isEmpty && passwordValue.isEmpty {
            presenter?.showErrorMessage(message: "Os campos de usuário e senha devem ser preenchidos.", errorView: errorView, errorLabel: errorLabel)
            presenter?.showErrorTextField(textField: user)
            presenter?.showErrorTextField(textField: password)
            return false
        }
        
        return true
    }
    
    // MARK: User text field validate
    func textUserIsValid(user: UITextField, password: UITextField, errorView: UIView, errorLabel: UILabel) -> Bool {
        let userValue = user.text ?? ""
        
        if userValue.isValidCPF() || userValue.isValidEmail() {
            return true
        }
        
        presenter?.removeErrorTextField(textField: password)
        presenter?.showErrorMessage(message: "O usuário deve ser um e-mail ou CPF válido.", errorView: errorView, errorLabel: errorLabel)
        presenter?.showErrorTextField(textField: user)
        
        return false
    }
    
    // MARK: Password text field validate
    func textPasswordIsValid(password: UITextField, user: UITextField, errorView: UIView, errorLabel: UILabel) -> Bool {
        let passwordValue = password.text ?? ""
        
        if passwordValue.isValidPassword() {
            return true
        }
        
        presenter?.removeErrorTextField(textField: user)
        presenter?.showErrorMessage(message: "A senha deve conter um número, um caracter especial e uma letra maiuscula.", errorView: errorView, errorLabel: errorLabel)
        presenter?.showErrorTextField(textField: password)
        
        return false
    }
}
