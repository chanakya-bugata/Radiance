//
//  CSVManager.swift
//  Radiance Final 1
//
//  Created by admin12 on 08/12/24.
//


import Foundation

class CSVManager {
    static let shared = CSVManager()
    private let fileName = "users.csv"
    
    private var fileURL: URL {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsPath.appendingPathComponent(fileName)
    }
    
    private init() {
        // Create the file if it doesn't exist
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            try? "Username,Email,Password,Name,Age,Gender,SkinConcerns,SkinTypes,SkinGoals\n".write(to: fileURL, atomically: true, encoding: .utf8)
        }
    }
    
    func saveUserData() {
        let user = User.shared
        let row = "\(user.username),\(user.email),\(user.password),\(user.name),\(user.age),\(user.gender),\(user.skinConcerns.joined(separator: " ; ")),\(user.skinTypes.joined(separator: " ; ")),\(user.skinGoals.joined(separator: " ; "))\n"
        
        if let fileHandle = try? FileHandle(forWritingTo: fileURL) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(row.data(using: .utf8)!)
            fileHandle.closeFile()
        } else {
            try? row.write(to: fileURL, atomically: true, encoding: .utf8)
        }
    }
    
    func readAllUsers() -> [[String: String]] {
        guard let data = try? String(contentsOf: fileURL) else { return [] }
        let rows = data.split(separator: "\n")
        let header = rows.first?.split(separator: ",").map { String($0) } ?? []
        return rows.dropFirst().map { row in
            let values = row.split(separator: ",").map { String($0) }
            return Dictionary(uniqueKeysWithValues: zip(header, values))
        }
    }
    // Check if a user exists with the given email and password
    func validateUserLogin(email: String, password: String) -> Bool {
        let users = readAllUsers()
        
        for user in users {
            if let userEmail = user["Email"], let userPassword = user["Password"] {
                if userEmail == email {
                    if userPassword == password {
                        return true // Login successful
                    } else {
                        return false // Incorrect password
                    }
                }
            }
        }
        return false // Email not found
    }
}
