//
//  RegisterView.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/25/22.
//

import SwiftUI

struct RegisterView: View {
    
    //--- USER INPUT VARIABLES ---//
    @State var userFirstNameInput: String = ""
    @State var userLastNameInput: String = ""
    @State var userIdentificationNumberInput: String = ""
    @State var userDateOfBirthInput: Date = Date()
    @State var userPhoneNumberInput: String = ""
    @State var userEmailInput: String = ""
    @State var userAddressNumberAndStreetInputLine1: String = ""
    @State var userAddressNumberAndStreetInputLine2: String = ""
    @State var userAddressPostcode: String = ""
    @State var userAddressCity: String = ""
    @State var userAddressStateSelection: String = "Select state"
    @State var userAddressCountry: String = "Malaysia"
    
    var registrationTimeStamp: Date = Date.now
    var userRole: String = "User"
    var pickerStateSelection: [String] = [
        "Johor",
        "Kedah",
        "Kelantan",
        "Melaka",
        "Negeri Sembilan",
        "Pahang",
        "Perak",
        "Perlis",
        "Pulau Pinang",
        "Sabah",
        "Sarawak",
        "Selangor",
        "Terengganu",
        "W.P. Kuala Lumpur",
        "W.P. Labuan",
        "W.P. Putrajaya"
    ]
    
    var userAddressNumberAndStreetCompiled: String {
        if (!userAddressNumberAndStreetInputLine2.isEmpty) {
            return (userAddressNumberAndStreetInputLine1 + "\n" + userAddressNumberAndStreetInputLine2)
        } else {
            return (userAddressNumberAndStreetInputLine1)
        }
    }
    //--- USER INPUT VARIABLES ---//
    
    //--- INPUT VALIDATION VARIABLES ---//
    @State var isFirstNameValid: Bool = false
    @State var isLastNameValid: Bool = false
    @State var isIdentificationNumberValid: Bool = false
    @State var isDateOfBirthPickerValueSet: Bool = false
    @State var isEmailValid: Bool = false
    @State var isPhoneNumberValid: Bool = false
    @State var isAddressNumberAndStreetValid: Bool = false
    @State var isPostcodeValid: Bool = false
    @State var isCityValid: Bool = false
    @State var isCountryValid: Bool = false
    @State var isTermsAndConditionsChecked: Bool = false
    @State var isRegistrationAllowed: Bool = false
    
    var isStateSelected: Bool {
        
        if (userAddressStateSelection == "Select state"){
            return false
        }
        return true
        
    }
    //--- INPUT VALIDATION VARIABLES ---//
    
    //--- ERROR AND ALERT VARIABLES ---//
    @State var showRegistrationAlert: Bool = false
    @State var registrationAlertTitle: String = ""
    @State var registrationAlertText: String = ""
    //--- ERROR AND ALERT VARIABLES ---//
    
    
    
    //--- DATE RANGE FOR DATE PICKER FOR DOB ---//
    var dateRange: ClosedRange<Date> {
        let minimumDate = Calendar.current.date(byAdding: .year, value: -150, to: Date())!
        let maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        
        return minimumDate...maximumDate
    }
    //--- DATE RANGE FOR DATE PICKER FOR DOB ---//
    
    
    var body: some View {
        
        //--- BACKGROUND COLOR ---//
        ZStack {
            Color.mint
                .ignoresSafeArea()
        //--- BACKGROUND COLOR ---//
            
            ScrollView {
                
                //--- VIEW TITLE ---//
                Text("Doughbank Registration")
                    .font(Font.custom("Charter Roman", size: 30))
                    .padding(.bottom)
                //--- VIEW TITLE ---//
                
                Group {
                    
                    HStack {
                        
                        //--- FIRST NAME INPUT ---//
                        VStack {
                            Section {
                                TextField ("", text: $userFirstNameInput)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 165, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                    .cornerRadius(8)
                                    .padding(3)
                            } header: {
                                Text ("First Name")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                        //--- FIRST NAME INPUT ---//
                        
                        //--- LAST NAME INPUT ---//
                        VStack {
                            Section {
                                TextField ("", text: $userLastNameInput)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 165, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                    .cornerRadius(8)
                                    .padding(3)
                            } header: {
                                Text ("Last Name")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                        //--- LAST NAME INPUT ---//
                    }
                    .padding()
                    
                    //--- ID NUMBER INPUT ---//
                    Section {
                        TextField ("", text: $userIdentificationNumberInput)
                            .multilineTextAlignment(.center)
                            .frame(width: 280, height: 30)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                            .cornerRadius(8)
                            .padding(3)
                    } header: {
                        Text ("National ID / Passport Number")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    //--- ID NUMBER INPUT ---//
                    
                    //--- DOB DATE PICKER ---//
                    DatePicker("Date of Birth", selection: $userDateOfBirthInput, in: dateRange, displayedComponents: [.date])
                        .font(.headline)
                        .onChange(of: userDateOfBirthInput) { newValue in
                            self.isDateOfBirthPickerValueSet = true
                        }
                        .padding(.leading, 75)
                        .padding(.trailing, 75)
                        .padding()
                    //--- DOB DATE PICKER ---//
                    
                    //--- PHONE NUMBER INPUT ---//
                    HStack {
                        Section {
                            TextField ("", text: $userPhoneNumberInput)
                                .multilineTextAlignment(.center)
                                .frame(width: 180, height: 30)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                .cornerRadius(8)
                        } header: {
                            Text ("Phone Number")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    //--- PHONE NUMBER INPUT ---//
                    
                    //--- EMAIL INPUT ---//
                    HStack {
                        Section {
                            TextField ("", text: $userEmailInput)
                                .multilineTextAlignment(.center)
                                .frame(width: 250, height: 30)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                .cornerRadius(8)
                        } header: {
                            Text ("E-Mail")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    //--- EMAIL INPUT ---//
                }
                
                Group {
                    VStack {
                        
                        //--- ADDRESS NUMBER AND STREET INPUT ---//
                        Section {
                            TextField ("", text: $userAddressNumberAndStreetInputLine1)
                                .multilineTextAlignment(.center)
                                .frame(width: 300, height: 30)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                .cornerRadius(8)
                        } header: {
                            Text ("Address")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.top)
                        }
                        
                        TextField ("", text: $userAddressNumberAndStreetInputLine2)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 30)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                            .cornerRadius(8)
                        //--- ADDRESS NUMBER AND STREET INPUT ---//
                        
                        //--- ADDRESS POSTCODE INPUT ---//
                        HStack {
                            
                            Section {
                                TextField ("", text: $userAddressPostcode)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 215, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                    .cornerRadius(8)
                            } header: {
                                Text ("Postcode")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                        //--- ADDRESS POSTCODE INPUT ---//
                        
                        //--- ADDRESS CITY INPUT ---//
                        HStack {
                            Section {
                                TextField ("", text: $userAddressCity)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 215, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                    .cornerRadius(8)
                            } header: {
                                Text ("City")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.leading, 42)
                        //--- ADDRESS CITY INPUT ---//
                        
                        //--- ADDRESS STATE PICKER ---//
                        HStack {
                            Menu  {
                                Picker (selection: $userAddressStateSelection, label: Text("")){
                                    ForEach(pickerStateSelection, id: \.self){
                                        Text($0)
                                    }
                                }
                            } label: {
                                Text("State")
                                    .font(.headline)
                                Text(userAddressStateSelection)
                                    .frame(width: 160, height: 30, alignment: .center)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                            }
                            .accentColor(.black)
                        }
                        .padding(.trailing, 23)
                        //--- ADDRESS STATE PICKER ---//
                        
                        //--- ADDRESS COUNTRY INPUT ---//
                        HStack {
                            Section {
                                TextField ("", text: $userAddressCountry)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 160, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Material.thinMaterial))
                                    .cornerRadius(8)
                            } header: {
                                Text ("Country")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.trailing, 45)
                        //--- ADDRESS COUNTRY INPUT ---//
                    }
                }
                .padding()
                
                //--- AGREE TO TERMS AND CONDITIONS CHECKBOX ---//
                HStack {
                    CheckBoxView(checked: $isTermsAndConditionsChecked)

                    Text("I agree to Doughbank \n terms and conditions.")
                        .multilineTextAlignment(.center)
                }
                .padding()
                //--- AGREE TO TERMS AND CONDITIONS CHECKBOX ---//
                
                //--- REGISTRATION BUTTON ---//
                NavigationLink(destination: PasswordSetupView()
                    .navigationTitle("")
                    .navigationBarHidden(true)) {
                    Button("Register", action: {
                        
                        //--- USER INPUT VALIDATION ---//
                        self.isFirstNameValid = UserRegistrationInputValidator().userNameValidator(name: userFirstNameInput)
                        
                        self.isLastNameValid = UserRegistrationInputValidator().userNameValidator(name: userLastNameInput)
                        
                        self.isIdentificationNumberValid = UserRegistrationInputValidator().userIdentificationNumberValidator(identificationNumber: userIdentificationNumberInput)
                        
                        self.isEmailValid = UserRegistrationInputValidator().userEmailValidator(email: userEmailInput)
                        
                        self.isAddressNumberAndStreetValid = UserRegistrationInputValidator().userAddressValidator(address: userAddressNumberAndStreetCompiled)
                        
                        self.isPostcodeValid = UserRegistrationInputValidator().userAddressPostcodeValidator(postcode: userAddressPostcode)
                        
                        self.isCityValid = UserRegistrationInputValidator().userAddressValidator(address: userAddressCity)
                        
                        self.isCountryValid = UserRegistrationInputValidator().userAddressValidator(address: userAddressCountry)
                        //--- USER INPUT VALIDATION ---//
                        
                        if(isFirstNameValid &&
                           isLastNameValid &&
                           isIdentificationNumberValid &&
                           isDateOfBirthPickerValueSet &&
                           isEmailValid &&
                           isPhoneNumberValid &&
                           isAddressNumberAndStreetValid &&
                           isPostcodeValid &&
                           isCityValid &&
                           isStateSelected &&
                           isCountryValid &&
                           isTermsAndConditionsChecked) {
                            
                            //--- COLLECTING USER INPUT ---//
                            let userSignUpDetails: [String : Any] = [
                                "firstName" : userFirstNameInput,
                                "lastName" : userLastNameInput,
                                "identificationNumber" : userIdentificationNumberInput,
                                "dateOfBirth" : userDateOfBirthInput,
                                "email" : userEmailInput,
                                "addressNumberAndStreet" : userAddressNumberAndStreetCompiled,
                                "addressPostcode" : userAddressPostcode,
                                "addressCity" : userAddressCity,
                                "addressState" : userAddressStateSelection,
                                "addressCountry" : userAddressCountry,
                                "timestamp" : registrationTimeStamp,
                                "role" : userRole
                            ]
                            //--- COLLECTING USER INPUT ---//
                            
                        } else {
                            self.registrationAlertTitle = "The following field(s) are empty or incorrect:"
                            
                            if(!isFirstNameValid){
                                self.registrationAlertText = "First Name"
                            }
                            
                            if(!isLastNameValid){
                                self.registrationAlertText = registrationAlertText + "\n Last Name"
                            }
                            
                            if(!isIdentificationNumberValid){
                                self.registrationAlertText = registrationAlertText + "\n National ID / Passport Number"
                            }
                            
                            if(!isDateOfBirthPickerValueSet){
                                self.registrationAlertText = registrationAlertText + "\n Date of Birth"
                            }
                            
                            if(!isPhoneNumberValid){
                                self.registrationAlertText = registrationAlertText + "\n Phone Number"
                            }
                            
                            if(!isEmailValid){
                                self.registrationAlertText = registrationAlertText + "\n E-Mail"
                            }
                            
                            if(!isAddressNumberAndStreetValid){
                                self.registrationAlertText = registrationAlertText + "\n Address"
                            }
                            
                            if(!isPostcodeValid){
                                self.registrationAlertText = registrationAlertText + "\n Postcode"
                            }
                            
                            if(!isCityValid){
                                self.registrationAlertText = registrationAlertText + "\n City"
                            }
                            
                            if(!isStateSelected){
                                self.registrationAlertText = registrationAlertText + "\n State"
                            }
                            
                            if(!isCountryValid){
                                self.registrationAlertText = registrationAlertText + "\n Country"
                            }
                            
                            if(!isTermsAndConditionsChecked){
                                self.registrationAlertText = registrationAlertText + "\n Terms and Conditions"
                            }
                            
                            self.showRegistrationAlert = true
                        }
                    })
                }
                    .frame(width: 180, height: 40)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                    .alert(isPresented: $showRegistrationAlert) {
                        Alert(title: Text(registrationAlertTitle),
                        message: Text(registrationAlertText),
                        dismissButton: .default(Text("OK"), action: {
                            self.registrationAlertText = ""
                            })
                        )
                    }
                //--- REGISTRATION BUTTON ---//
                
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
        .navigationBarHidden(true)

    }
}
