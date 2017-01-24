//
//  VersionAssistant.swift
//  pvtool
//
//  Created by Rajiv Jhoomuck on 24/01/2017.
//  Copyright © 2017 Rajiv Jhoomuck. All rights reserved.
//

import Foundation

struct VersionAssistant {
    
    private static let consoleHelper = ConsoleHelper()
    
    static func showUsageInformation() {
        print("pvtool - \n  Project versioning tool that wraps agvtool from Apple (check if installed).\n  Expects marketing version in the form: (major).(minor).(bugFix).\n  Build version is just an integer although might change the future.")
        print("\nUsage:")
        print("  pvtool [help | --help | h | -h]")
        print("  pvtool [currentBuildNumber | cbn] : Prints the current build number of the project.")
        print("  pvtool [currentVersion | cv] : Prints the current marketing version of the project.")
        print("  pvtool [bumpBuildNumber | +build | bbn]: Increments the build number.")
        print("  pvtool [bumpMajor | +major | +maj] : Increments to the next major marketing version.")
        print("  pvtool [bumpMinor | +minor | +min] : Increments to the next minor marketing version.")
        print("  pvtool [bumpBugFix | +bugFix | +bf] : Increments to the next `bug fix` marketing version.")
    }
    
    static func currentBuildNumber() -> String {
        // Trimming any spaces and carriage return since we might want to pipe or redirect the output to a file or other stuff
        // Other suggestions are welcome
        return consoleHelper.shell("agvtool", "what-version", "-terse").trimmingCharacters(in: CharacterSet.init(charactersIn: " \n"))
    }
    
    static func currentVersion() -> String {
        // Trimming any spaces and carriage return since we might want to pipe or redirect the output to a file or other stuff
        // Other suggestions are welcome
        return consoleHelper.shell("agvtool", "what-marketing-version", "-terse1").trimmingCharacters(in: CharacterSet.init(charactersIn: " \n"))
    }
    
    static func bumpBuildNumber() {
        _ = consoleHelper.shell("agvtool", "next-version", "-all")
        print(currentBuildNumber())
    }
    
    static func bumpMajor() {
        let version = Version(using: currentVersion())
        let bumpedVersionText = version.bumpedMajor().text
        _ = consoleHelper.shell("agvtool", "new-marketing-version", "-all", bumpedVersionText)
        print(bumpedVersionText)
    }
    
    static func bumpMinor() {
        let version = Version(using: currentVersion())
        let bumpedVersionText = version.bumpedMinor().text
        _ = consoleHelper.shell("agvtool", "new-marketing-version", "-all", bumpedVersionText)
        print(bumpedVersionText)
    }
    
    static func bumpBugFix() {
        let version = Version(using: currentVersion())
        let bumpedVersionText = version.bumpedBugFix().text
        _ = consoleHelper.shell("agvtool", "new-marketing-version", "-all", bumpedVersionText)
        print(bumpedVersionText)
    }
    
    static func execute(with argument: String) {
        let option: Option = Option(value: argument)
        switch option {
        case .help:
            VersionAssistant.showUsageInformation()
        case .currentBuildNumber:
            print(VersionAssistant.currentBuildNumber())
        case .currentVersion:
            print(VersionAssistant.currentVersion())
        case .bumpBuildNumber:
            VersionAssistant.bumpBuildNumber()
        case .bumpMajor:
            VersionAssistant.bumpMajor()
        case .bumpMinor:
            VersionAssistant.bumpMinor()
        case .bumpBugFix:
            VersionAssistant.bumpBugFix()
        case .unknown:
            print("Invalid option passed in: \(argument)")
            print("Use one of these options: [bumpMajor, bumpMinor, bumpBugFix, currentVersion]")
            exit(EXIT_FAILURE)
        }
    }
}
