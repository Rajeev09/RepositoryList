//
//  UserDefaults+Extension.swift
//  Repositories
//
//  Created by Rajeev on 19/04/22.
//

import Foundation

let kUserTimeStamp = "userTimeStamp"

extension UserDefaults{

    //MARK: Save Time Stamp
    func setUserTimeStamp(value: Int){
        set(value, forKey: kUserTimeStamp)
    }

    //MARK: Retrieve Time Stamp
    func getUserTimeStamp() -> Int {
        return integer(forKey: kUserTimeStamp)
    }
}
