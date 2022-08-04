//
//  LogInViewModel.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/29/22.
//

import Foundation

struct LogInViewModel {
    
    //hard coded test values
    var testAccountNumber: String = "9875485236982525"
    var testPassword: String = "Ilikefish1971"
    var testPinNumber: String = "1971"
    
    func authenticatingLogInDetails(accountNumber: String, password: String, pinNumber: String) -> Bool {
        
        //determine login validity (for now it compares with hard coded values)
        let logInIsValid: Bool = accountNumber == testAccountNumber && password == testPassword && pinNumber == testPinNumber
        
        //trigger logic
        if logInIsValid {
            return true //trigger NavigationLink
        }
        
        return false
    }
    
    func determineShowAlert(logInValidity: Bool) -> Bool {
        
        //if the login details are invalid, show alert
        if logInValidity {
            return false
        }
        return true
    }
}
