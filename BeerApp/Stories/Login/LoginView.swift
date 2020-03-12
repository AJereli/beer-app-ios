//
//  ContentView.swift
//  BeerApp
//
//  Created by user on 12.03.2020.
//  Copyright © 2020 Anatoliy.V. All rights reserved.
//

import SwiftUI
import Combine


struct LoginView: View {
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @State private var name = Array<String>.init(repeating: "", count: 3)
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            Text("You always know the best beer")
                .bold()
                .font(.title)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Just Login").bold().font(.title)
                .padding([.leading, .bottom, .trailing])
            Spacer()
            
            TextField("email", text: $viewModel.email)
                .font(.callout)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("password", text: $viewModel.password)
                .font(.callout)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.viewModel.login()
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black)
                    .cornerRadius(15.0)
            }
            .background(GeometryGetter(rect: $kGuardian.rects[0]))
            .disabled(!viewModel.isValidEmail)
            
            
            Button(action: {}) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black)
                    .cornerRadius(15.0)
            }
            
            Spacer()
           
        }
        .padding()
            
        .offset(y: kGuardian.slide).animation(.easeInOut(duration: 0.3))
        .onAppear { self.kGuardian.addObserver() }
        .onDisappear { self.kGuardian.removeObserver() }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
