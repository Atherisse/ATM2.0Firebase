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
                                userAccountNumber: users["user_account_number"] as? String ?? "",
                                username: users["user_username"] as? String ?? "",
                                userFirstName:users["user_first_name"] as? String ?? "",
                                userLastName: users["user_last_name"] as? String ?? "",
                                userEmail: users["user_email"] as? String ?? "",
                                userPassword: users["user_password"] as? String ?? "",
                                userPinNumber: users["user_pin_number"] as? String ?? ""
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
