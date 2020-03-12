//
//  LoginViewModel.swift
//  BeerApp
//
//  Created by user on 13.03.2020.
//  Copyright © 2020 Anatoliy.V. All rights reserved.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {

    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @Published var email: String = ""
    var password: String = ""
    
    
    func login(){
        print(email)
    }
}
