//
//  CountingLabel.swift
//  CuntingLabel
//
//  Created by Bing on 7/9/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

class CountingLabel: UILabel
{
    // 开始的数字
    var fromNum = NSNumber(integer: 0)
    
    // 结束的数字
    var toNum = NSNumber(integer: 100)
    
    // 动画的持续时间
    private var duration: NSTimeInterval = 1.0
    
    // 动画开始时刻的时间
    private var startTime: CFTimeInterval = 0
    
    // 字符串格式化
    var format: NSString = "%d"
    
    // 格式化字符串闭包
    var formatBlock: ((value: Double) -> NSString)?

    // 定时器
    private var displayLink: CADisplayLink!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 从数字fromNum经过duration长的时间变化到数字toNum
    func countFrom(fromNum fromNum: NSNumber, toNum: NSNumber, duration: Double)
    {
        self.text = fromNum.stringValue
        self.fromNum = fromNum
        self.toNum = toNum
        self.duration = duration
        
        startDisplayLink()
    }
    
    // 开始定时器
    private func startDisplayLink()
    {
        if displayLink != nil
        {
            displayLink.invalidate()
        }
        displayLink = CADisplayLink(target: self, selector: .handleDisplayLink)
        // 记录动画开始时刻的时间
        startTime = CACurrentMediaTime()
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    // 定时器的回调
    @objc private func handleDisplayLink(displayLink: CADisplayLink)
    {
        if displayLink.timestamp - startTime >= duration
        {
            if formatBlock != nil
            {
                self.text = self.formatBlock!(value: toNum.doubleValue) as String
            }
            else
            {
                self.text = NSString(format: self.format, toNum.doubleValue) as String
            }
            // 结束定时器
            stopCounting()
        }
        else
        {
            // 计算现在时刻的数字
            let current = (toNum.doubleValue - fromNum.doubleValue) * (displayLink.timestamp - startTime) / duration + fromNum.doubleValue
            if formatBlock != nil
            {
                self.text = self.formatBlock!(value: current) as String
            }
            else
            {
                self.text = NSString(format: self.format, current) as String
            }
        }
    }
    
    // 结束定时器
    func stopCounting()
    {
        displayLink.invalidate()
    }
}

private extension Selector
{
    static let handleDisplayLink = #selector(CountingLabel.handleDisplayLink)
}