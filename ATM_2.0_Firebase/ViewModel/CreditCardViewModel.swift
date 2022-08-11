//
//  CardViewModel.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 8/4/22.
//

import Foundation
import Firebase

class CreditCardViewModel: ObservableObject {
    
    @Published var creditCardDetails = [CreditCardModel]()
    
    func doesAccountExist(accountNumber: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        
        db.collection("credit_cards_table").whereField("account_number", isEqualTo: accountNumber).getDocuments() {(documents, error) in
            
            if(error != nil) {
                print("Error: \(error?.localizedDescription ?? "")")
                print("We have localized error")
                    completion(false)
            }
            
            for document in documents!.documents{
                
                let tableAccountNumber = document.get("account_number")
                if(accountNumber == tableAccountNumber as! String){
                    print("We have matched user input to database")
                    completion(true)
                    return
                }
            }
            completion(false)
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

}
