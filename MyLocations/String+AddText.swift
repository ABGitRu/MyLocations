//
//  String+AddText.swift
//  MyLocations
//
//  Created by Mac on 19.10.2021.
//

import Foundation

extension String {
    mutating func add(
        text: String?,
        separatedBy separator: String = ""
    ) {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
