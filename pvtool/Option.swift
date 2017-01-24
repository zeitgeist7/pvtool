//
//  Option.swift
//  pvtool
//
//  Created by Rajiv Jhoomuck on 24/01/2017.
//  Copyright © 2017 Rajiv Jhoomuck. All rights reserved.
//

import Foundation

enum Option: String {
    case currentVersion
    case currentBuildNumber
    case bumpBuildNumber
    case bumpMajor
    case bumpMinor
    case bumpBugFix
    case help
    case unknown
    
    init(value: String) {
        switch value {
        case "h", "help", "-h", "--help":
            self = .help
        case "currentBuildNumber", "cbn":
            self = .currentBuildNumber
        case "currentVersion", "cv":
            self = .currentVersion
        case "bumpBuildNumber", "+build", "bbn":
            self = .bumpBuildNumber
        case "bumpMajor", "+major", "+maj":
            self = .bumpMajor
        case "bumpMinor", "+minor", "+min":
            self = .bumpMinor
        case "bumpBugFix", "+bugFix", "+bf":
            self = .bumpBugFix
        default:
            self = .unknown
        }
    }
}

