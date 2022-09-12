//
//  AccountDetailView.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/25/22.
//

import SwiftUI

struct AccountDetailView: View {
    
    @EnvironmentObject var creditCardViewModel: CreditCardViewModel
    
    var body: some View {
        
        VStack {
            List(creditCardViewModel.creditCardDetails) { detail in
                Text("Account number: \(detail.accountNumber)")
            }
        }
        Text("Account Detail View")
        
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView()
    }
}
