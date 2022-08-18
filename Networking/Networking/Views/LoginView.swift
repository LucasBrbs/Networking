//
//  LoginView.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 09/08/22.
//

import Foundation
import SwiftUI


struct LoginView : View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    @State var username: String = ""
    @State var password: String = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    @State private var showCentralView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("User Login 👥")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                ZStack (alignment: .trailing){
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))

                    Image(systemName: "eye.fill")
                            .foregroundColor(Color(.systemGray))
                            .colorMultiply(.gray)
                            .alignmentGuide(.trailing, computeValue: { _ in 40 })
                    }

//                    Text("Não tem cadastro?").foregroundColor(Color.blue)
                    NavigationLink("Create Account",destination: CreateUserView())
                    
                    
                    Button("Login") {
                        autheticateUser(username: username, password: password)


                    }
                    .foregroundColor(.white)
                    .frame(width: 130, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    
//                    Button("Login"){
//                        self.showCentralView.toggle()
//                        autheticateUser(username: username, password: password)
//                    }.foregroundColor(.white)
//                        .frame(width: 130, height: 50)
//                        .background(Color.green)
//                        .cornerRadius(10)
//                    .sheet(isPresented: $showCentralView){
//                        if(session == true){
//                            CentralView(showCentralView: self.$showCentralView)
//                        }
//
//
//
//
//                    }
//                    NavigationLink(destination: Text("Você está logado em @\(username)"), isActive: $showingLoginScreen ) {
//                        EmptyView()
//                    }
                }
            }
            .navigationBarHidden(true)
            //tira a navigation bar
        }
    }
    
    func autheticateUser(username: String, password: String) {
//        if username.lowercased() == "madalena22" {
//            wrongUsername = 0
//        if password.lowercased() == "1234"{
//                wrongPassword = 0
//                showingLoginScreen = true
//        } else {
//            wrongPassword = 2
//        }
//        } else {
//            wrongUsername = 2
//        }
//
        Task {
            let session = await API.login(username: username, password: password)
            if (session != nil){
            
//                print("sucesso")
                
            }
            else {
//                print("falha")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

