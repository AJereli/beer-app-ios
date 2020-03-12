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
    
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isValidEmail: Bool = false
    private var bag = Set<AnyCancellable>()

    init() {
        isValidEmailPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValidEmail, on: self)
            .store(in: &bag)
    }
    private var isValidEmailPublisher: AnyPublisher<Bool, Never> {
        $email
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { email in
                return email.count > 4
        }
        .eraseToAnyPublisher()
    }
    
    func login(){
        email = "vfbf" + email
        
        print(email)
    }
}
