
import Foundation
import SwiftUI


struct CreateUserView : View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State private var wrongEmail = 0
    @State private var showingCreateUserScreen = false
    
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
                    Text("Create Account 👥")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))
                    
                ZStack (alignment: .trailing){
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        

                    Image(systemName: "eye.fill")
                            .foregroundColor(Color(.systemGray))
                            .colorMultiply(.gray)
                            .alignmentGuide(.trailing, computeValue: { _ in 40 })
                    }
                    Button("Create") {
                        registerUser(email: email, login: username, password: password)
                            
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 130, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    
//                    Button("Editar"){
//                                            self.showEditView.toggle()
//                                        }.sheet(isPresented: $showEditView){
//                                            EditView(showEditView: self.$showEditView)
//                                        }
                    
                }
            }
            .navigationBarHidden(true)
            //tira a navigation bar
        }
    }
    
    func registerUser(email: String, login: String, password: String) {
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
//            let session = await API.login(username: username, password: password)
            let user = CreateUsersModel(name: username, email: email, password: password)
            let session = await API.createUser(user: user)
            print(session)
//            if (session != nil){
//
////                print("sucesso")
//
//            }
//            else {
////                print("falha")
//            }
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}

