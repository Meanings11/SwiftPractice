//
//  loan.swift
//  KivaLoan
//
//  Created by 李名夫 on 5/30/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation
import HandyJSON

struct Loan:HandyJSON{
    var name: String = ""
    var country: String = ""
    var use: String = ""
    var amount: Int = 0
}

