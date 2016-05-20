//
//  ArrayShuffle.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 20.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}