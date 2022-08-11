//
//  LogInViewModel.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/29/22.
//

import Foundation

struct LogInViewModel {
    
    func authenticatingLogInDetails(passwordInput: String, pinNumberInput: String, databasePassword: String, databasePinNumber: String) -> Bool {
        //determine login validity
        let logInIsValid: Bool = passwordInput == databasePassword && pinNumberInput == databasePinNumber
        
        //trigger logic
        if logInIsValid {
            print("Successful log in")
            return true //trigger NavigationLink
        }
        print("Unsuccessful log in")
        return false
    }
    
    func determineShowAlert(logInValidity: Bool) -> Bool {
            
            //if the login details are invalid, show alert
            if logInValidity {
                print("No alert")
                return false
            }
            print("Show alert")
            return true
        }
    
}
