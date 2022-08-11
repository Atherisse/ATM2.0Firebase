//
//  CreditCardModel.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 8/4/22.
//

import Foundation

struct CreditCardModel: Identifiable {
    
    var id: String
    var accountNumber: String
    var accountPassword: String
    var accountPinNumber: String
    var cardCvcCode: String
    var accountBalance: Double
    
}
