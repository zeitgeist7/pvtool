//
//  Version.swift
//  pvtool
//
//  Created by Rajiv Jhoomuck on 24/01/2017.
//  Copyright © 2017 Rajiv Jhoomuck. All rights reserved.
//

import Foundation

// Version represents the marketing version of the project (name used in agvtool)
// Build number is represented by BuildNumber struct although agvtool calls that Version
struct Version {
    private let major: Int
    private let minor: Int
    private let bugFix: Int
    
    var text: String { return "\(major).\(minor).\(bugFix)" }
    
    init(major: Int, minor: Int, bugFix: Int) {
        self.major = major
        self.minor = minor
        self.bugFix = bugFix
    }
    
    init(using versionText: String) {
        let trimmedVersionText = versionText.trimmingCharacters(in: CharacterSet.init(charactersIn: " \n"))
        guard
            !trimmedVersionText.isEmpty else {
                major = 1
                minor = 0
                bugFix = 0
                return
        }
        
        let components = trimmedVersionText.components(separatedBy: ".")
        switch components.count {
        case 1:
            major = Int(components[0]) ?? 1
            minor = 0
            bugFix = 0
        case 2:
            major = Int(components[0]) ?? 1
            minor = Int(components[1]) ?? 0
            bugFix = 0
        case 3:
            major = Int(components[0]) ?? 1
            minor = Int(components[1]) ?? 0
            bugFix = Int(components[2]) ?? 0
        default:
            fatalError("Reconsider versioning structure")
        }
    }
    
    func bumpedMajor() -> Version {
        return Version(major: major + 1, minor: 0, bugFix: 0)
    }
    
    func bumpedMinor() -> Version {
        return Version(major: major, minor: minor + 1, bugFix: 0)
    }
    
    func bumpedBugFix() -> Version {
        return Version(major: major, minor: minor, bugFix: bugFix + 1)
    }
}
