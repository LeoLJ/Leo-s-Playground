//
//  GameProtocol.swift
//  BullsAndCows
//
//  Created by Leo on 5/31/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import UIKit

protocol GameProtocol {
    
    var answear: AnyObject {get set}
    func setGame()
    func generateAnswear()
    func guessAndJudgement()

}
