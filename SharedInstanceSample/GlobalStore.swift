//
//  GlobalStore.swift
//  SharedInstanceSample
//
//  Created by Gyroball on 2017/05/18.
//  Copyright © 2017年 tom.factory. All rights reserved.
//

import Foundation
import UIKit

class GlobalStore: NSObject
{
    // シングルトンオブジェクトのインスタンス宣言
    static let sharedManager = GlobalStore()

    // メンバ変数
    // どこからでも参照できる
    var distanceNameArray: [String] = []
    var distanceTotalCount: Int = 0

    class var sharedInstance: GlobalStore
    {
        struct Static
        {
            static let instance: GlobalStore = GlobalStore()
        }
        return Static.instance
    }

    // 列挙型も参照どこからでも参照できる
    enum Status
    {
        case Start
        case Progress
        case Finalize
        case Other
    }
}

