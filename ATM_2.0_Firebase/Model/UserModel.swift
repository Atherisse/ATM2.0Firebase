//
//  UserModel.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/25/22.
//

import Foundation
import Firebase

struct UserModel: Identifiable {
    
    var id: String
    var userFirstName: String
    var userLastName: String
    var userIdentificationNumber: String
    var userDateOfBirth: Date
    var userPhoneNumber: String
    var userEmail: String
    var userAddressNumberAndStreet: String
    var userAddressPostcode: String
    var userAddressCity: String
    var userAddressState: String
    var userAddressCountry: String
    var registrationTimeStamp: Date
    var userRole: String
    
}
