//
//  LoginView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black).ignoresSafeArea()
                VStack {
                    VStack(spacing: -15) {
                        // Image Logo and Title
                        Image("vroom").resizable().frame(width: 400, height: 400)
                        //Input Fields
                        VStack(spacing: 30) {
                            //Email Input Field
                        CustomInputField(text: $email, title: "Email Address", placeholder: "name@example.com")
                            //Password Input Field
                         CustomInputField(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                            Button {
                                
                            } label: {
                                Text("Forgot Password?").font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top)
                            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        }.padding(.horizontal)
                            .padding(.top,10)
                            .padding(.bottom, 15)
                        

                        
                        // social media sign in
                        VStack {
                            HStack(spacing: 24){
                                Rectangle()
                                    .frame(width: 76, height: 1)
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                                
                                Text("Sign in with social").foregroundColor(.white).fontWeight(.semibold)
                                Rectangle()
                                    .frame(width: 76, height: 1)
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                            }
                            
                            HStack(spacing: 24) {
                                Button {
                                    
                                }label: {
                                    Image("facebooklogo").resizable().frame(width: 30, height: 30)
                                }
                                Button {
                                    
                                }label: {
                                    Image("googlelogo").resizable().frame(width: 30, height: 30)
                                }
                            }
                        }
                        .padding(.vertical)
                        Spacer()
                        //sign in button
                        
                        Button(action: {
                            viewModel.signIn(withEmail: email, password: password)
                        }, label: {
                            HStack {
                                Text("SIGN IN").foregroundColor(.black)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }.frame(width: UIScreen.main.bounds.width - 32, height: 45)
                        })
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.top, 20)
                            .padding(.bottom, 35)
                        Spacer()
                        NavigationLink {
                            RegistrationView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack {
                                Text("Don't have an account?").font(.system(size: 14))
                                Text("Sign Up").font(.system(size: 14, weight: .semibold))
                            }.foregroundColor(.white)
                        }
                        //sign up button
                    }
                }
            }
        }
    }
        
}

#Preview {
    LoginView()
}
