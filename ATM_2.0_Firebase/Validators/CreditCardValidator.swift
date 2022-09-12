//
//  File.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/28/22.
//

import Foundation

let accountNumberInputCharacterCountLimitWithHyphen: Int = 19
let pinNumberInputCharacterCountLimit: Int = 4
let bankNumber: String = "9875"

struct CreditCardValidator {
    
    func filterAccountNumber(accountNumber: String) -> String {
        //filters account number input, removing hyphens and white spaces to match the format stored in the database
        let filteredAccountNumber = accountNumber.filter { "0123456789".contains($0) }
        return filteredAccountNumber
    }
    
    public func accountNumberCharacterLimiter(textInput: String) -> String {
        if textInput.count > accountNumberInputCharacterCountLimitWithHyphen {
            let limitedText = textInput.dropLast()
            return String(limitedText)
        }
        return ""
    }
    
    public func pinNumberCharacterLimiter(textInput: String) -> String {
        if textInput.count > pinNumberInputCharacterCountLimit {
            let limitedText = textInput.dropLast()
            return String(limitedText)
        }
        return ""
    }
}
