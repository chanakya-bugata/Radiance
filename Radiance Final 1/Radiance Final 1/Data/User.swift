//
//  User.swift
//  Radiance Final 1
//
//  Created by admin12 on 08/12/24.
//


import Foundation

class User {
    static let shared = User()
    
    // Properties for user data
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var name: String = ""
    var age: Int = 0
    var gender: String = ""
    var skinConcerns: [String] = []
    var skinTypes: [String] = []
    var skinGoals: [String] = []
    
    private init() {} // Singleton
}
