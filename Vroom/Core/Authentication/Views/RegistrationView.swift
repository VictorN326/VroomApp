//
//  RegistrationView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel : AuthenticationViewModel
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 20) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left").font(.title).imageScale(.medium).padding()
                })
                Text("Create new account").font(.system(size: 40))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 250)
                
                Spacer()
                
                VStack {
                    VStack(spacing: 56){
                        CustomInputField(text: $fullName, title: "Full Name", placeholder: "Enter your name")
                        CustomInputField(text: $email, title: "Email Address", placeholder: "name@gmail.com")
                        CustomInputField(text: $password, title: "Create Password", placeholder: "Enter your password", isSecureField: true)
                    }
                    .padding(.leading)
                    
                    Spacer()

                    Button(action: {
                        viewModel.registerUser(withEmail: email, password: password, fullName: fullName)
                    }, label: {
                        HStack {
                            Text("SIGN UP").foregroundColor(.black)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                        }.frame(width: UIScreen.main.bounds.width - 32, height: 45)
                    })
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                    
                    Spacer()
                }
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    RegistrationView()
}
