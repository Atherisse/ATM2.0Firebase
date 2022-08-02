//
//  File.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/28/22.
//

import Foundation

let accountNumberInputCharacterCountLimitWithHyphen: Int = 19
let pinNumberInputCharacterCountLimit: Int = 4

struct CreditCardValidator {
    
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
