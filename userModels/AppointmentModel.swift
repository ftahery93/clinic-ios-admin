//
//  File.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 04/07/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
struct AppointmentModel: Codable{
    var appointments : [Appointment]?
    
}
struct Appointment: Codable{
    var id : Int?
    var start_time : String?
    var end_time : String?
}
