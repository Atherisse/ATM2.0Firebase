//
//  UserViewModel.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/25/22.
//

import Foundation
import Firebase

class UserViewModel: ObservableObject {
    
    @Published var userData = [UserModel]()
    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("users").getDocuments { usersTableContent, error in
            
            //Check for errors
            if error == nil {
                //No errors
                
                if let usersTableContent = usersTableContent {
                    
                    //Update the list property in the main thread in real time
                    DispatchQueue.main.async {
                        
                        //Get all the documents and create users
                        self.userData = usersTableContent.documents.map { users in
                            
                            //Fetches user details from Firebase
                            return UserModel(
                                id: users.documentID,
                                userFirstName: users["user_first_name"] as? String ?? "",
                                userLastName: users["user_last_name"] as? String ?? "",
                                userIdentificationNumber: users["user_id_number"] as? String ?? "",
                                userDateOfBirth: users["user_date_of_birth"] as? Date ?? Date(),
                                userPhoneNumber: users["user_phone_number"] as? String ?? "",
                                userEmail: users["user_email"] as? String ?? "",
                                userAddressNumberAndStreet: users["user_address_number_and_street"] as? String ?? "",
                                userAddressPostcode: users["user_address_postcode"] as? String ?? "",
                                userAddressCity: users["user_address_city"] as? String ?? "",
                                userAddressState: users["user_address_state"] as? String ?? "",
                                userAddressCountry: users["user_address_country"] as? String ?? "",
                                registrationTimeStamp: users["timestamp"] as? Date ?? Date(),
                                userRole: users["role"] as? String ?? ""
                            )
                        }
                    }
                }
            } else {
                //Error handling to be changed later
                print("There is an error.")
            }
        }
    }
    
}
