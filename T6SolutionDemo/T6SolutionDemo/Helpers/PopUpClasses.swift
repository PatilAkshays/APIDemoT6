//
//  PopUpClasses.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 30/07/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import Foundation
@objc enum EventType : Int, CustomStringConvertible {
    
    case personal, common
    
    static var allValues = [EventType.personal, .common]
    
    var description: String {
        switch self {
        case .personal: return "Personal"
        case .common: return "Common"
        }
    }
    
}

class EventTypeModel : NSObject {
    @objc dynamic var eventType = EventType.personal
}


@objc enum EventVenue : Int, CustomStringConvertible {
    
    case inOwnHouse, other
    
    static var allValues = [EventVenue.inOwnHouse, .other]
    
    var description: String {
        switch self {
        case .inOwnHouse: return "In Own House"
        case .other: return "Other"
        }
    }
}

class EventVenueModel : NSObject {
    @objc dynamic var eventVenue = EventVenue.inOwnHouse
}

@objc enum EventTime : Int, CustomStringConvertible {
    
    case a, b, c, d ,e, f, g, h, i, j, k
    static var allValues = [EventTime.a, .b, .c, .d, .e, .f, .g, .h, .i, .j, .k]
    
    var description: String {
        switch self {
        case .a: return "01:00"
        case .b: return "01:30"
        case .c: return "02:00"
        case .d: return "02:30"
        case .e: return "03:00"
        case .f: return "03:30"
        case .g: return "04:00"
        case .h: return "04:30"
        case .i: return "05:00"
        case .j: return "05:30"
        case .k: return "06:00"
            
        }
    }
}

class EventTimeModel : NSObject {
    @objc dynamic var eventTime = EventTime.a
}
@objc enum EventMember : Int, CustomStringConvertible {
    
    case a, b, c, d ,e, f
    static var allValues = [EventMember.a, .b, .c, .d, .e, .f]
    
    var description: String {
        switch self {
        case .a: return "A-204"
        case .b: return "B-205"
        case .c: return "A-206"
        case .d: return "A-207"
        case .e: return "A-208"
        case .f: return "A-209"
        }
    }
}

class EventMemberModel : NSObject {
    @objc dynamic var eventMember = EventMember.a
}



