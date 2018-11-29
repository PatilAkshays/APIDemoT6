//
//  RegistrationObject.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 01/08/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import UIKit

class RegistrationObject: NSObject {

    var id: String = String()
    var member_name: String = String()
    var Event_Type: String = String()
    var Event_Venue: String = String()
    var Title: String = String()
    var Description: String = String()
    var Event_Date: String = String()
    var Event_timing: String = String()
    var Event_Schedule: String = String()

    init(member_name: String, Event_Type: String, Event_Venue: String, Title: String,Description : String, Event_Date: String,Event_timing: String,Event_Schedule: String) {
        self.member_name = member_name
        self.Event_Type = Event_Type
        self.Event_Venue = Title
        self.Title = Title
        self.Description = Description
        self.Event_Date = Event_Date
        self.Event_timing = Event_timing
        self.Event_Schedule = Event_Schedule

    }
    
}
