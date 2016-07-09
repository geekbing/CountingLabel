# CountingLabel
CountingLabel是一个实现数字变化的动画效果的Label控件

效果如下:

![image](https://github.com/geekbing/CountingLabel/blob/master/CuntingLabel.gif)

使用方法非常简单：

1.整数型变幻效果
<pre><code>label.format = "%.0f"
// 从0变幻到100
label.countFrom(fromNum: 0, toNum: 100, duration: 1.0)
</code></pre>

2.浮点型变幻效果
<pre><code>label.format = "%.2f"
// 从1.02变幻到520.00
label.countFrom(fromNum: 1.02, toNum: 520.00, duration: 2.0)
</code></pre>

3.千分位分隔符变幻效果
<pre><code>// formatBlock属性非常强大，完全可以自定义显示格式
label.formatBlock = { (value: Double) -> NSString in
	let str = NSString(format: "%.2f", value)
    
    // 按照千分位分隔符输出
	let formatter = NSNumberFormatter()
	formatter.numberStyle = .DecimalStyle
	formatter.positiveFormat = "###,##0.00"
            
	return formatter.stringFromNumber(NSNumber(double: str.doubleValue))!
}
// 从1.02变幻到13,145.20
label.countFrom(fromNum: 1.02, toNum: 13145.20, duration: 3.0)
</code></pre>

4.开始和停止变幻效果
<pre><code>// 点击重启按钮
func startBtnClick()
{
  // 从1.02变幻到10,000,013,145.20
	label.countFrom(fromNum: 1.02, toNum: 10000013145.20, duration: 4.0)
}
// 点击停止按钮
func stopBtnClick()
{
	label.stopCounting()
}
</code></pre>
