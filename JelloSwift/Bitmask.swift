//
//  Bitmask.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 07/08/14.
//  Copyright (c) 2014 Luiz Fernando Silva. All rights reserved.
//

import UIKit

typealias Bitmask = Int;

infix operator +& { associativity left precedence 140 }
infix operator -& { associativity left precedence 140 }

func +&(inout lhs: Bitmask, rhs: Int) -> Bitmask
{
    lhs |= 1 << (rhs > 0 ? (rhs - 1) : 0);
    return lhs;
}

func -&(inout lhs: Bitmask, rhs: Int) -> Bitmask
{
    lhs &= ~(1 << (rhs > 0 ? (rhs - 1) : 0));
    return lhs;
}