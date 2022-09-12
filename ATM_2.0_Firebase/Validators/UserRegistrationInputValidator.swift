//
//  UserInputValidator.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 8/22/22.
//

import Foundation

struct UserRegistrationInputValidator {
    
    func userNameValidator(name: String) -> Bool {
        let nameRegExPattern = "(^[A-Za-z']{2,25})$"
           let userName = NSPredicate(format:"SELF MATCHES %@", nameRegExPattern)
        return userName.evaluate(with: name)
    }
    
    func userIdentificationNumberValidator(identificationNumber: String) -> Bool {
        if (identificationNumber.count >= 8) {
            return true
        }
        return false
    }
    
    func userEmailValidator(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func userPhoneNumberValidator(phoneNumber: String) -> Bool {
        do{
            let regexPatternForPhoneNumber = "(^[+]?[0-9]{8,17})$"
            let userPhoneNumberRegex = try NSRegularExpression(pattern: regexPatternForPhoneNumber, options: .caseInsensitive)
            let range = NSRange(location: 0, length: phoneNumber.count)
            if (userPhoneNumberRegex.firstMatch(in: phoneNumber, options:[], range: range) != nil){
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func userAddressValidator(address: String) -> Bool {
        if (address.count >= 3) {
            return true
        }
        return false
    }
    
    func userAddressPostcodeValidator(postcode: String) -> Bool {
        if (postcode.count == 5) {
            return true
        }
        return false
    }
    
}
