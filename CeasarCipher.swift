//
//  CeasarCipher.swift
//  CeasarCypher
//
//  Created by Michael Lapuebla on 4/19/16.
//  Copyright © 2016 Mike Lapuebla. All rights reserved.
//

import Foundation

func cipherStringWithKey(plainString: String, key: Int) -> String {
    var encodedString = ""
    
    for char in plainString.characters {
        var c = Int(String(char).unicodeScalars.first!.value)
        var isUpperCase = false
        var isAlphabet = false
        
        if char >= "a" && char <= "z" {
            isAlphabet = true
        } else if char >= "A" && char <= "Z" {
            isAlphabet = true
            isUpperCase = true
        }
        
        if isAlphabet {
            let x = isUpperCase ? Int(String("A").unicodeScalars.first!.value) : Int(String("a").unicodeScalars.first!.value)
            c = (c + key - x) % 26 + x
        }
        encodedString.append(Character(UnicodeScalar(c)))
    }
    
    return encodedString
}