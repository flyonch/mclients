//
//  UserProfile.swift
//  MyClient
//
//  Created by Leonid Fedorov on 11.05.2023.
//
// временные данные профиля пользователя храним тут после перезапуска приложения запрашиваем вновь
import Foundation

class UserDataManagerProfile {
    
    static let shared = UserDataManagerProfile()
    
    var userId: Int?
    var userFullName: String?
    var userPhone: String?
    var userEmail: String?
    var isActivated: Bool = false
    var userRole: Int?
    var avatarURL: String?
    
    private init() {
        // Инициализация
    }
    
    func saveData(userId: Int?, userFullName: String?, userPhone: String?, userEmail: String?, isActivated: Bool, userRole: Int?, avatarURL: String?) {
        self.userId = userId
        self.userFullName = userFullName
        self.userPhone = userPhone
        self.userEmail = userEmail
        self.isActivated = isActivated
        self.userRole = userRole
        self.avatarURL = avatarURL
    }
    
    func getData() -> (userId: Int?, userFullName: String?, userPhone: String?, userEmail: String?, isActivated: Bool, userRole: Int?, avatarURL: String?) {
         return (userId, userFullName, userPhone, userEmail, isActivated, userRole, avatarURL)
     }
}
