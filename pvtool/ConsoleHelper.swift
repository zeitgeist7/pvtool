//
//  ConsoleHelper.swift
//  pvtool
//
//  Created by Rajiv Jhoomuck on 24/01/2017.
//  Copyright © 2017 Rajiv Jhoomuck. All rights reserved.
//

import Foundation

struct ConsoleHelper {
    func shell(_ args: String...) -> String {
        let outputPipe = Pipe()
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.standardOutput = outputPipe
        task.launch()
        task.waitUntilExit()
        let out = outputPipe.fileHandleForReading.readDataToEndOfFile()
        
        return String(data: out, encoding: .utf8) ?? "0"
    }
}
