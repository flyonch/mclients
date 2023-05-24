//
//  UserManager.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation

class UserManager {
    
    static let defaults = UserDefaults.standard
    
    private static let accessToken = "ACCESS_TOKEN"
    private static let refreshToken = "REFRESH_TOKEN"
    
    private static let userId = "USER_ID"
    private static let userRole = "USER_ROLE"

    
    static func saveTokens(_ accessToken: String, _ refreshToken: String) {
        defaults.set(accessToken, forKey: self.accessToken)
        defaults.set(refreshToken, forKey: self.refreshToken)
        defaults.synchronize()
    }
    
    static func getTokens() -> (accessToken: String?, refreshToken: String?) {
        let accessToken = defaults.string(forKey: self.accessToken)
        let refreshToken = defaults.string(forKey: self.refreshToken)
        return (accessToken, refreshToken)
    }
    
    static func setUserId(userId: Int, userRole: Int) {
        defaults.set(userId, forKey: self.userId)
        defaults.set(userRole, forKey: self.userRole)

        defaults.synchronize()
    }
    
    static func getUserId() -> (userId: Int?, userRole: Int?) {
        let userId = defaults.integer(forKey: self.userId)
        let userRole = defaults.integer(forKey: self.userRole)
        return(userId, userRole)
    }
    
    static func removeAllData() {
        if let appDomain = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: appDomain)
        }
    }
    
}
