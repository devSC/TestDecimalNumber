//: Playground - noun: a place where people can play

import UIKit
import Foundation

func scopedExample(_ exampleDescription: String, _ action: (NumberFormatter) -> String?) {
    print("\n--- \(exampleDescription) --- \n")
    let formatter = NumberFormatter()
    guard let string = action(formatter) else {
        return
    }
    print(string)
}

scopedExample("formatWidth") { formatter in
    //必须显示多少个字符
    formatter.formatWidth = 8
    return formatter.string(from: formatter.number(from: "1234")!)
}

scopedExample("maximumFractionDigits") { (formatter) in
    formatter.maximumFractionDigits = 2
    return formatter.string(from: formatter.number(from: "123.12345678910")!)
}

scopedExample("minimumFractionDigits") { (formatter) in
    formatter.minimumFractionDigits = 2
    return formatter.string(from: formatter.number(from: "123.2")!)
}

scopedExample("minimumSignificantDigits") { (formatter) -> String? in
    //最小有效数字 如果不够位数自动补 0
    formatter.minimumSignificantDigits = 6
    return formatter.string(from: formatter.number(from: "23.2")!)
}

scopedExample("maximumSignificantDigits") { (formatter) -> String? in
    //最多有几个有效数字（1 - 9）
    formatter.maximumSignificantDigits = 4
    return formatter.string(from: formatter.number(from: "212340")!)
}

scopedExample("groupingSize") { (formatter) -> String? in
    formatter.numberStyle = .decimal
    //分组大小 默认为3位
    formatter.groupingSize = 3
    //第二组
//    formatter.secondaryGroupingSize = 4
//    formatter.groupingSeparator = ""
//    formatter.currencySymbol = ""
    formatter.maximumFractionDigits = 9
    return formatter.string(from: formatter.number(from: "123456789.1234512345")!)
}

scopedExample("maximum") { (formatter) -> String? in
    var number: NSNumber?
    //is nil if value max than maximum
    formatter.maximum = NSNumber(value: 3)
    if let unwrappedNumber = formatter.number(from: "2") {
        number = unwrappedNumber
    }
    if formatter.number(from: "4") == nil {
        print("the 4 is max than 3")
    }
    return formatter.string(from: number!)
}

scopedExample("minimum") { (formatter) -> String? in
    var number: NSNumber?
    //is nil if value max than maximum
    formatter.minimum = NSNumber(value: 1)
    if let unwrappedNumber = formatter.number(from: "2") {
        number = unwrappedNumber
    }
    if formatter.number(from: "0") == nil {
        print("the 0 is less than 1")
    }
    return formatter.string(from: number!)
}

//var decimalNumber = NSDecimalNumber(string: value)
//decimalNumber.dividing(by: NSDecimalNumber(string: "100"))

