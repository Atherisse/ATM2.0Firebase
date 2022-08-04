//
//  LogInView.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/25/22.
//

import SwiftUI
import Combine

struct LogInView: View {
    var creditCardValidator = CreditCardValidator()
    var logInViewModel = LogInViewModel()
    @State var alertText: String = ""
    @State var accountNumberInput: String = ""
    @State var pinNumberInput: String = ""
    @State var passwordInput: String = ""
    @State var isLogInValid: Bool = false
    @State var showAlert: Bool = false
    @State var filteredAccountNumber: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Doughbank")
                    .font(Font.custom("Charter Roman", size: 50))
                Form {
                    
                    Section {
                        TextField ("xxxx-xxxx-xxxx-xxxx", text: $accountNumberInput)
                        
                        //restricts input to only include what's permitted
                        //the onReceive method makes View subscribe to the Just publisher (requires Combine framework)
                        //Just publisher takes "just" a single value (the new value of numberOfPeople) and emits it when asked.
                            .onReceive(Just(accountNumberInput)) { newValue in
                                //only the characters in the string are allowed in the textfield
                                let filteredAccountNumberInput = newValue.filter { "0123456789- ".contains($0) }
                                if filteredAccountNumberInput != newValue {
                                    self.accountNumberInput = filteredAccountNumberInput
                                }
                            }
                        //limits the maximum character allowed in the text field
                            .onChange(of: accountNumberInput) { _ in
                                if accountNumberInput.count > accountNumberInputCharacterCountLimitWithHyphen {
                                    self.accountNumberInput = creditCardValidator.accountNumberCharacterLimiter(textInput: accountNumberInput)
                                }
                            }
                    } header: {
                        Text ("Account Number")
                            .font(.headline)
                            .foregroundColor(.black)
                    } footer: {
                        Text ("16 digits account number")
                    }
                    
                    Section {
                        TextField ("Enter your password", text: $passwordInput)
                    } header: {
                        Text ("Password")
                            .font(.headline)
                            .foregroundColor(.black)
                    } footer: {
                        Text ("Password is case sensitive")
                    }
                    
                    Section {
                        TextField ("Enter your PIN code", text: $pinNumberInput)
                            .onReceive(Just(pinNumberInput)) { newValue in
                                //only the characters in the string are allowed in the textfield
                                let filteredPinNumberInput = newValue.filter { "0123456789".contains($0) }
                                if filteredPinNumberInput != newValue {
                                    self.pinNumberInput = filteredPinNumberInput
                                }
                            }
                            .onChange(of: pinNumberInput) { _ in
                                if pinNumberInput.count > pinNumberInputCharacterCountLimit {
                                    self.pinNumberInput = creditCardValidator.pinNumberCharacterLimiter(textInput: pinNumberInput)
                                }
                            }
                    } header: {
                        Text ("PIN Code")
                            .font(.headline)
                            .foregroundColor(.black)
                    } footer: {
                        Text ("4 digits code")
                    }
                    
                }
                .background(Color.clear)
                
                // to disable Form{} initial background color making the desired background color visible.
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                
                HStack {
                    
                    NavigationLink(destination: AccountDetailView(), isActive: $isLogInValid) {
                        /*
                         Here we put the content view of `NavigationLink`.
                         It could be any `View` even `Button`.
                         */
                        Button("Log In", action: {
                            self.filteredAccountNumber = creditCardValidator.filterAccountNumber(accountNumber: accountNumberInput)
                            self.isLogInValid = logInViewModel.authenticatingLogInDetails(accountNumber: filteredAccountNumber, password: passwordInput, pinNumber: pinNumberInput)
                            self.showAlert = logInViewModel.determineShowAlert(logInValidity: isLogInValid)
                            if filteredAccountNumber == logInViewModel.testAccountNumber {
                                if passwordInput == logInViewModel.testPassword {
                                    if pinNumberInput == logInViewModel.testPinNumber {
                                        
                                    } else {
                                        self.alertText = "Please use the correct PIN code."
                                    }
                                } else {
                                    self.alertText = "Please ensure your password is correct."
                                }
                            } else {
                                self.alertText = "Please ensure your account number is correct or register if you have yet to own an account."
                            }
                        })
                    }
                        .frame(width: 120, height: 40)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text(alertText))
                        }
                        
                    NavigationLink("Register", destination: RegisterView())
                        .frame(width: 120, height: 40)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
            )
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
