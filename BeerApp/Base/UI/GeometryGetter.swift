//
//  GeometryGetter.swift
//  BeerApp
//
//  Created by user on 13.03.2020.
//  Copyright © 2020 Anatoliy.V. All rights reserved.
//

import SwiftUI


struct GeometryGetter: View {
    @Binding var rect: CGRect
    
    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }
                
                return AnyView(Color.clear)
            }
        }
    }
}
