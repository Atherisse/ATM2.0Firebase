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
    var userEmail: String
    var userDateOfBirth: Date
}
