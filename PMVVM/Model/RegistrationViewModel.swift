//
//  RegistrationViewModel.swift
//  PMVVM
//
//  Created by krupa on 1/20/18.
//  Copyright © 2018 sa. All rights reserved.
//

import Foundation

class RegistrationViewModel{

    var firstName:String!
    var lastName:String!
    var email:String!
    var password:String!
    
    init(firstName:String,lastName:String,email:String,password:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    func saveUserInfo(){
        let user = User(userInfo:self)
        DataModel.saveUserModel(userInfo: user)
    }
}
