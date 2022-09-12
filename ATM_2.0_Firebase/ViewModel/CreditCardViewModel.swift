//
//  CardViewModel.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 8/4/22.
//

import Foundation
import Firebase
import SwiftUI

class CreditCardViewModel: ObservableObject {
    
    @Published var creditCardDetails = [CreditCardModel]()
    
    func loginUser(userAccountNumberInput: String, userPasswordInput: String, userPinCodeInput: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        let dbQuery = db.collection("credit_cards_table").whereField("account_number", isEqualTo: userAccountNumberInput)
        
        dbQuery.getDocuments() {(documents, error) in
            if (error != nil) {
                print("Error: \(error?.localizedDescription ?? "")")
            }
            
            var accountNumber: String = ""
            var password: String = ""
            var pinCode: String = ""
            
            for document in documents!.documents {
                accountNumber = document.get("account_number") as? String ?? ""
                password = document.get("account_password") as? String ?? ""
                pinCode = document.get("account_pin_number") as? String ?? ""
            }
            
            if (accountNumber != "" && userPasswordInput == password && userPinCodeInput == pinCode) {
                self.getUserCreditCardData(accountNumber: userAccountNumberInput)
                completion(true)
                return
            } else {
                completion(false)
            }
        }
    }
    
    func getUserCreditCardData(accountNumber: String) {
            
            let db = Firestore.firestore()
            
            db.collection("credit_cards_table").whereField("account_number", isEqualTo: accountNumber)
                .getDocuments() { (creditCardTableContent, error) in
                    
                    if error == nil {
                        
                        if let creditCardTableContent = creditCardTableContent {
                            
                            DispatchQueue.main.async {
                                self.creditCardDetails = creditCardTableContent.documents.map { account in
                                    return CreditCardModel(
                                        id: account.documentID,
                                        accountNumber: account["account_number"] as? String ?? "",
                                        accountPassword: account["account_password"] as? String ?? "",
                                        accountPinNumber: account["account_pin_number"] as? String ?? "",
                                        cardCvcCode: account["card_cvc_code"] as? String ?? "",
                                        accountBalance: account["account_balance"] as? Double ?? 0)
                                }
                            }
                        }
                    } else {
                        print("Error in fetching data: \(String(describing: error))")
                    }
                    
                }
        }
    
    func generateAccountNumber() -> String {
        var accountNumber: String = bankNumber

        for _ in 1...3 {
            accountNumber.append(String(Int.random(in: 1000..<10000)))
        }

        return accountNumber
    }
    
    func generatePinNumber() -> String {
        
        let pinNumber: String = String(Int.random(in: 1000..<10000))
        
        return pinNumber
    }

}
