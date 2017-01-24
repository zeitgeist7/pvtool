//
//  main.swift
//  pvtool
//
//  Created by Rajiv Jhoomuck on 24/01/2017.
//  Copyright © 2017 Rajiv Jhoomuck. All rights reserved.
//

import Foundation

private let arguments = CommandLine.arguments

guard
    arguments.count == 2
else {
    print("pvtool only accepts 1 and only 1 of the following options: [bumpMajor, bumpMinor, bumpBugFix, currentVersion]")
    exit(EXIT_FAILURE)
}

VersionAssistant.execute(with: arguments[1])
