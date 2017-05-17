//
//  ViewController.swift
//  SharedInstanceSample
//
//  Created by Gyroball on 2017/05/18.
//  Copyright © 2017年 tom.factory. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // シングルトンオブジェクトの宣言
    let sharedInstance: GlobalStore = GlobalStore.sharedInstance

    // MARK: Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        self.setValue()
        self.excuteCount()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: SampleLogic
    func setDistanceNameWithDistanceName(distanceName: String)
    {
        if !distanceName.isEmpty
        {
            self.sharedInstance.distanceNameArray.append(distanceName)
            print(distanceName)
        }
    }

    func shouldCountDistanceName()
    {
        if self.sharedInstance.distanceNameArray.count > 0
        {
            let distanceNameTmpArray = self.sharedInstance.distanceNameArray
            var tryCount: Int = 0
            let limitValue: Int = 10

            var index: Int = 0
            
            while tryCount < limitValue
            {
                let distanceName = distanceNameTmpArray[index]
                if distanceName.contains("A")
                {
                    self.sharedInstance.distanceTotalCount += 1
                    index += 1
                }
                tryCount += 1
            }
        }
    }

    func setValue()
    {
        self.setDistanceNameWithDistanceName(distanceName: "Apple")
        self.setDistanceNameWithDistanceName(distanceName: "America")
        self.setDistanceNameWithDistanceName(distanceName: "Asia")
        self.setDistanceNameWithDistanceName(distanceName: "France")
        self.setDistanceNameWithDistanceName(distanceName: "China")
    }

    func excuteCount()
    {
        self.shouldCountDistanceName()
    }
}

