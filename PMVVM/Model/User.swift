//
//  User.swift
//  PMVVM
//
//  Created by krupa on 1/20/18.
//  Copyright © 2018 sa. All rights reserved.
//

import Foundation

class User {
    var firstName:String!
    var lastName:String!
    var email:String!
    var password:String!
    
    init(userInfo:RegistrationViewModel) {
        firstName = userInfo.firstName
        lastName = userInfo.lastName
        email = userInfo.email
        password = userInfo.password
    }
}
