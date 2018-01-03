//
//  ViewController.swift
//  字符串第一讲
//
//  Created by 周希财 on 2018/1/2.
//  Copyright © 2018年 VIC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // 一、字符概述
          // 在Swift编程语言中，对字符的表示是独立于某一种特定的Unicode编码的。在Objective-C、Java等编程语言中，编译器内部一般以UTF-16编码格式保存并处理字符序列的，而在Swift编程语言中则是直接通过Unicode标准组织所制定的标准码点（code point）来保存并处理字符串字符序列的。在Swift中把Unicode码点值又称作为Unicode标量值（Unicode scalar values）。所以Swift中引入了 UnicodeScalar 类型，直接可用于表示某一字符的码点值
        // 这里直接通过UnicodeScalar的构造方法来创建一个UnicodeScalar常量对象zero，
        // 这里要注意的是，
        // 通过UnicodeScalar构造出来的对象是一个Optional对象
        let zero = UnicodeScalar("0")!
        
        // 这里使用类型标注的方式显式给常量a声明为UnicodeScalar类型，
        // 然后用"a"字符串字面量对它初始化
        let a: UnicodeScalar = "a"
        
        // 声明UnicodeScalar常量π
        let π = UnicodeScalar("π")!
        
        // 声明UnicodeScalar常量好
        let 好: UnicodeScalar = "好"
        
        // 输出zero的标量值：48（与ASCII码兼容）
        print("\(zero) scalar value = \(zero.value)")
        
        // 输出a的标量值：97（与ASCII兼容）
        print("\(a) scalar value = \(a.value)")
        
        // 输出π的标量值：960（与UCS-2兼容）
        print("\(π) scalar value = \(π.value)")
        
        // 输出好的标量值：22909（与UCS-2兼容）
        print("\(好) scalar value = \(好.value)")
        
        let 😄: UnicodeScalar = "😄"
        
        // 输出😄的标量值为128516（在补充平面中）
        print("\(😄) scalar value = \(😄.value)")
        
        //Swift编程语言特意使用了 Character 类型以覆盖所有可被编码的字符。这也意味着一个 Character 对象可包含多个 UnicodeScalar 对象
        
        let flag: Character = "🇺🇸"
        print("flag is:\(flag)")
        
        //光使用Character，我们没有办法获取码点值，所以我们这里借助String.UnicodeScalarView类型
        let scalars = flag.unicodeScalars;
        print("scalars:", separator: "", terminator: " ")
        
        // 我们这里可以发现一个很有意思的情况：
        // 🇺🇸正好是由两个Emoji字符构成：🇺和🇸
        for scalar in scalars {
            print("\(scalar)=\(scalar.value)", separator: "", terminator: " ")
        }
        
        
        let c = UnicodeScalar(127464)!
        let n = UnicodeScalar(127475)!
        print("c = \(c), n = \(n)")
        
        // 我们将两个UnicodeScalar对应的字符对象拼在一起，
        // 构成一个String对象，
        // 然后用Character构造方法将此String对象中的内容转换为Character相应的值
        let cn = Character(String([Character(c), Character(n)]))
        // 这里我们就能看到中国国旗的Emoji了
        print("cn = \(cn)")
        
//       二、转义字符
        /*
        "\0" 表示空字符（null character），一般用于传统ASCII编码的字符串的结束符。
        "\\" 表示倒斜杠（backslash）。
        "\t" 表示水平制表符（horizontal tab）。
        "\n" 表示换行（line feed）。
        "\r" 表示回车（carriage return）。
        "\"" 表示双引号。
        "\'" 表示单引号。当然，一般单引号在Swift编程语言中表示字符或字符串字面量时不需要做转义，直接用 "'" 也行。”
        */
        
        /**
         * 这里将会输出：
         The string is: Say, "Hello, world"!
         非常好！
         * 注意双引号与换行符的输出
         */
        let d = "Say,\"Hello,World!\"!\n非常好"
        print("The string is:\(d)")
        
    //三、字符串简述
        //一个字符串是一组字符序列，在Swift中使用 String 类型来表示一个字符串类型
        
        //字符串的实例方法与属性
            /*
            1.字符串与数组对象类似，也可用 + 操作符将两个字符串对象拼接起来，构成一个新的字符串对象。
            2.对于一个可修改的字符串对象，则可使用 += 操作符将 += 右边的字符串的内容添加到 += 左边的可修改的字符串对象的末尾
            3.我们还能直接通过 == 操作符来比较两个字符串对象中的字符序列内容是否完全相同，如果相同则返回 true，否则返回 false
            4.而要判断一个字符串是否为空，则可使用 isEmpty 实例属性
            5.判定字符串是否包含指定的子串，则可使用  contains(_:) 实例方法。
            6.如果我们要判断一个字符串对象的开头是否包含某个子串，可以使用 hasPrefix(_:) 实例方法
            7.如果我们要判断一个字符串对象的末尾是否包含某个子串，那么可以使用 hasSuffix(_:) 实例方法。
         
            */
        
        // 这里通过 + 操作符将两个字符串字面量拼接在一起构造出一个新的字符串对象给常量a
        let e = "Hello, " + "world!"
        // 字符串常量b则是将两个"Hello, world!"中间用换行符连接在一起
        let f = e + "\n" + e
        print("f = \(f)")
        // 比较字符串对象a与"Hello, world!"是否相同
        // 比较结果为true
        print("Is equal? \(e == "Hello, world!")")
        // 判定字符串对象是否为空字符串
        // 结果为false
        print("Is empty? \(e.isEmpty)")
        // 判断是否包含 , 符号
        // 结果为true
        print("contains ','? \(e.contains(","))")
        // 判断字符串对象a是否含有前缀"Hello"
        // 结果为true
        print("Has prefix 'Hello'? \(e.hasPrefix("Hello"))")
        // 判断字符串对象a是否含有后缀"d!"
        // 结果为true
        print("Has suffix 'd!'? \(e.hasSuffix("d!"))")
        // 这里声明了字符串变量str，
        // 并将a的内容对它初始化
        var str = e
        // 在str对象后添加一个字符串内容
        str += " 你好，世界！"
        print("str = \(str)")
        
    //四、字符串插值
        //Swift编程语言提供了一种十分便利的方式可将几乎任一类型的对象转换为一个字符串的表示形式，这在Swift中称为字符串插值（String Interpolation）。
        let x = 10, y = 20
        let s = "x + y = \(x+y)"
        print("s is: \(s)")
        // 当然，因为s本身是字符串类型，
        // 所以我们也可以直接用字符串拼接方式来打印
        print("s is: " + s)
        
    //五、字符串的characters属性
        //如果我们想要迭代访问一个字符串中的每个字符，或者是查询当前字符串中包含多少字符个数，那么我们可以访问 String 对象的 characters 属性。这里的 characters 属性并不是 [Character] 类型，而是 String.CharacterView 类型，使得我们可以使用 for-in 循环迭代语句将其中的字符一一枚举出，但是我们无法使用整数作为下标索引来访问 characters 中的指定字符。
        var str1 = "看旗帜：\u{1f1e8}"
        // 我们先观察当前str对象的长度，
        // 长度为5
        print("str count: \(str1.characters.count)")
        print("before appending:", separator: "", terminator: " ")
        // 我们输出当前str中的字符序列
        for ch in str1.characters {
            print("\(ch)", separator: "", terminator: " ")
        }
         print("")
        // 我们再新增一个字符
        str1.append("\u{1f1f3}")
        // 输出当前字符串中字符个数，
        // 仍然为5
        print("str count: \(str1.characters.count)")
        print("After appending:", separator: "", terminator: " ")
        // 最后，我们再逐一输出字符序列
        for ch in str1.characters {
            print("\(ch)", separator: "", terminator: " ")
        }
        print("")
        
        //String.CharacterView 类型中包含了 first 属性，可用于获取当前字符序列中的第一个字符；另外还有 last 属性，可用于获取当前字符序列的最后一个字符。由于当前字符串可能是一个空串（即 ""），所以这两个属性的返回类型都是Optional。如果当前字符串是一个空串，那么这两个属性的值都是为空（nil）。我们下面来看以下代码示例：
        let str2 = "看旗帜：\u{1f1e8}\u{1f1f3}"
        var ch = str2.characters.first!
        // 这里输出：看
        print("first character: \(ch)")
        ch = str2.characters.last!
        // 这里输出🇨🇳的Emoji
        print("ch = \(ch)")
        //六、字符串的索引及字符访问
        //Swift编程语言转为 String 类型引入了 索引类型 String.Index 用于表示字符串对象中字符序列的索引值。由于 String.Index 类型也遵循了 Comparable 协议，所以它可以作为范围操作符的操作数。
        //我们通过调用字符串对象的 index(_:offsetBy:) 实例方法即可得到指定的索引值。该方法的第一个参数填参考索引值，第二个参数填指定的偏移 n，偏移值为正数，说明返回的索引值往后挪 n 位，如果是负数，则说明往前挪 n 位。
        //String 类型还有一个 index(_:offsetBy:limitedBy:) 实例方法，功能与 index(_:offsetBy:) 一样，只不过这里多了一个参数，第三个参数用于做边界检测，如果索引计算的结果超出了第三个参数所指定的值，那么此方法将会返回空。因此它返回的是一个Optional对象。
        //有了索引值之后，我们就可以拿它通过字符串的 substring(with:) 实例方法获取字符串的指定子串，然后通过子串的 characters 属性中的 first 属性或 last 属性来获取到当前指定的字符了。我们下面来看一个例子：
        
        let str3 = "看旗帜：🇨🇳"
        // str字符串对象的起始索引，索引值相当于0
        let startIndex = str3.startIndex
        // str字符串对象的末尾索引，索引值相当于：
        // str.characters.count - 1
        let endIndex = str3.endIndex
        // index2作为索引2
        let index2 = str3.index(startIndex, offsetBy: 2)
        // index3作为索引3
        let index3 = str3.index(startIndex, offsetBy: 3, limitedBy: endIndex)!
        // 这里通过范围操作符构造一个Range<String.Index>对象，
        // 作为substring方法的参数，以获取子串。
        // 各位注意，这里必须使用 ..< 操作符，
        // 而不能使用 ... 操作符。
        // 因为 ... 操作符对应的是ClosedRange类型，
        // 而不是Range类型
        var substr = str3.substring(with: index2 ..< index3)
        // 我们这里可以观察到，
        // substr.characters的first字符与last字符都是同一个，
        // 即“帜”这个字。
        var ch2 = substr.characters.first!
        print("ch = \(ch)")
        ch2 = substr.characters.last!
        print("ch = \(ch)")
        // 这里以index3作为参考索引，
        // 然后偏移-2表示往前移2个位置，
        // 所以index1的索引值对应的是1
        let index1 = str2.index(index3, offsetBy: -2)
        // 获取第二个字符
        substr = str3.substring(with: index1 ..< index2)
        ch = substr.characters.first!
        // 这里输出：
        // 第二个字符为：旗
        print("第二个字符为：\(ch)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

