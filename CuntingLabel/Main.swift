//
//  Main.swift
//  CuntingLabel
//
//  Created by Bing on 7/9/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

class Main: UIViewController
{
    var cardView1: CardView!
    var cardView2: CardView!
    var cardView3: CardView!
    var cardView4: CardView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()

        // 整数Demo
        cardView1 = CardView()
        cardView1.totalMoney?.text = "0"
        cardView1.totalMoney?.format = "%.0f"
        cardView1.totalMoney?.countFrom(fromNum: 0, toNum: 100, duration: 1.0)
        view.addSubview(cardView1)
        
        // 浮点型Demo
        cardView2 = CardView()
        cardView2.totalMoney?.text = "1.02"
        cardView2.totalMoney?.format = "%.2f"
        cardView2.totalMoney?.countFrom(fromNum: 1.02, toNum: 520.00, duration: 2.0)
        view.addSubview(cardView2)
        
        // 千分位分隔符Demo
        cardView3 = CardView()
        cardView3.totalMoney?.text = "1.02"
        cardView3.totalMoney?.formatBlock = { (value: Double) -> NSString in
            let str = NSString(format: "%.2f", value)
            
            // 按照千分位分隔符输出
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            formatter.positiveFormat = "###,##0.00"
            
            return formatter.stringFromNumber(NSNumber(double: str.doubleValue))!
        }
        cardView3.totalMoney?.countFrom(fromNum: 1.02, toNum: 13145.20, duration: 3.0)
        view.addSubview(cardView3)
        
        // 点击启动Demo
        cardView4 = CardView()
        cardView4.totalMoney?.text = "1.02"
        cardView4.totalMoney?.formatBlock = { (value: Double) -> NSString in
            let str = NSString(format: "%.2f", value)
            
            // 按照千分位分隔符输出
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            formatter.positiveFormat = "###,##0.00"
            
            return formatter.stringFromNumber(NSNumber(double: str.doubleValue))!
        }
        view.addSubview(cardView4)
        
        // 重启按钮
        let startBtn = UIButton()
        startBtn.setTitle("重启", forState: .Normal)
        startBtn.setTitleColor(.flatGrayColor(), forState: .Normal)
        startBtn.addTarget(self, action: .startBtnClick, forControlEvents: .TouchUpInside)
        view.addSubview(startBtn)
        
        // 停止按钮
        let stopBtn = UIButton()
        stopBtn.setTitle("停止", forState: .Normal)
        stopBtn.setTitleColor(.flatGrayColor(), forState: .Normal)
        stopBtn.addTarget(self, action: .stopBtnClick, forControlEvents: .TouchUpInside)
        view.addSubview(stopBtn)

        // 布局
        cardView1.snp_makeConstraints { (make) in
            make.top.equalTo(self.view).offset(40)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(100)
        }
        cardView2.snp_makeConstraints { (make) in
            make.top.equalTo(cardView1.snp_bottom).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(100)
        }
        cardView3.snp_makeConstraints { (make) in
            make.top.equalTo(cardView2.snp_bottom).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(100)
        }
        cardView4.snp_makeConstraints { (make) in
            make.top.equalTo(cardView3.snp_bottom).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(100)
        }
        startBtn.snp_makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(cardView4.snp_bottom).offset(20)
            make.centerX.equalTo(view).offset(-100)
        }
        stopBtn.snp_makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(cardView4.snp_bottom).offset(20)
            make.centerX.equalTo(view).offset(100)
        }
    }
    
    // 点击重新启动按钮
    func startBtnClick()
    {
        cardView4.totalMoney?.countFrom(fromNum: 1.02, toNum: 10000013145.20, duration: 4.0)
    }
    
    // 点击停止按钮
    func stopBtnClick()
    {
        cardView4.totalMoney?.stopCounting()
    }
   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

private extension Selector
{
    static let startBtnClick = #selector(Main.startBtnClick)
    static let stopBtnClick = #selector(Main.stopBtnClick)
}