//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Mac  on 12.08.2024.
//

import SwiftUI

@main
struct TestProjectApp: App {
    @StateObject var cart = Cart()
    
    var body: some Scene {
        WindowGroup {
            ProductListView()
                .background(Color.white)
                .environmentObject(cart)
        }
    }
}
