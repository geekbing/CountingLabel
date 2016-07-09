//
//  CardView.swift
//  CuntingLabel
//
//  Created by Bing on 7/9/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

class CardView: UIView
{
    // 总金额数字
    var totalMoney: CountingLabel?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 6
        
        // 总金额文字
        let label = UILabel()
        label.textAlignment = .Center
        label.text = "总金额"
        label.font = font16
        label.textColor = UIColor.flatGrayColor()
        self.addSubview(label)
        
        // 总金额数字
        totalMoney = CountingLabel()
        totalMoney?.textAlignment = .Center
        totalMoney?.font = font40
        totalMoney?.adjustsFontSizeToFitWidth = true
        totalMoney?.textColor = UIColor.flatRedColor()
        self.addSubview(totalMoney!)
        
        // 布局
        label.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(30)
        }
        totalMoney?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(label.snp_bottom)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        })
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}