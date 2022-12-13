### 1. 变量

```go
// 定义单个变量
var age int
var name string

// 定义多个变量
var (
	name string
    age int
    addr string
)
```

var 形式的声明语句往往是用于需要显式指定变量类型地方。

```go
// 定义后初始化
var (
    name string
    age int
    addr string
)

name = "yyo"
age = 24
addr = "jiangsu"


// 类型推导 + 简化初始化
name := "yyo"
age := 18
```

### 2. 常量

```go
const (
   a = iota    // 有些类似枚举
   b = "hello"
   c           // 默认前面的值
   d = 5
   e
   f = iota    // 恢复增加
   g
)
fmt.Println(a, b, c, d, e, f, g) // 0 hello hello 5 5 5 7

const (
   j = iota
   k
   l
)
fmt.Println(j, k ,l) // 0 1 2
```

`iota`一个可以被编译器修改的常量。是 go 语言的常量计数器。

iota 在 const 关键字出现时将被重置为 0，const 中每新增一行常量就将 iota 增加一次。

iota 可理解为 const语句块中的行索引。



### 3. 数据类型

```go
/* bool */
var b1 bool = true
var b2 bool = false

fmt.Println(b1, b2)
fmt.Println(true, false)

/* uint8 uint16 uint32 uint64 int8 int16 int32 int64(int) */
//byte uint8
//rune int32
//int  int64
var age int = 18
fmt.Printf("%T, %v\n", age, age)

/* float32 float64 */
var f32 float32 = 33.35
var f64 float64 = 33.39
var flt = 33.39 // go 中默认就是 float64
fmt.Println(f32, f64, flt)
fmt.Printf("%.1f\n", f32)
fmt.Printf("%.1f\n", f64) /* 不是向下取正，也不是四舍五入，而是五舍六入 */

/* string */
var str string
str = "hello world"
fmt.Printf("%T, %s\n", str, str)

v1 := 'A'
v2 := "A"
fmt.Printf("%T, %c\n", v1, v1) // char=>int32
fmt.Printf("%T, %s\n", v2, v2)

fmt.Println(str + ", hello yyx")
```

浮点数设置精度打印时，不是向下取正，也不是四舍五入，而是五舍六入。

```go
a := 3   // int
b := 5.5 // float64
fmt.Printf("%T, %T\n", a, b)

c := float64(a)
fmt.Printf("%T, %v\n", c, c)

d := int(b)
fmt.Printf("%T, %v\n", d, d)

// e : bool(a) // Err	
```

Go语言不存在隐式类型转换，所有的类型转换都必须显式的声明。

相近类型能够转换，不相近类型不能转换。



### 4. 运算符

#### 算术运算符

```go
+ - * / & ++ --
```

```go
var a int = 30
var b int = 4

fmt.Println(a + b)
fmt.Println(a - b)
fmt.Println(a * b)
fmt.Println(a / b)
fmt.Println(a & b)
// fmt.Println(a++) //Err
// fmt.Println(a--) //Err
```

go 只有后置++/––，且表达式没有返回值。其他与C/C++一致。

#### 关系运算符

```go
== != < <= > >=
```

关系运算符返回结果都是布尔值。

`==`判断相等，`=`赋值符号，`:=`仅用于初始化变量。

```go
fmt.Println(a == b)
fmt.Println(a != b)
fmt.Println(a <  b)
fmt.Println(a <= b)
fmt.Println(a >  b)
fmt.Println(a >= b)
// fmt.Println(a = b) //Err 表达式是否具有返回值有严格限定
```

#### 位运算符

```go
& | ^ &^ << >>
```

`&^`位清空：

`a&^b`，对于b上的每个二进制位，如果为0，则取a对应位上的数值，如果为1，则取0。

> 其他没有必要的，和C/C++无异的，就不再赘述了。



### 5. 分支循环

```go
if scroe > 90 && scroe < 100 {
    fmt.Println("better")
} else if scroe > 80 && scroe < 90 {
    fmt.Println("good")
} else if scroe > 70 && scroe < 80 {
    fmt.Println("midden")
} else {
    fmt.Println("lowest")
}
 
switch score {
case 90:
	fmt.Println("A")
	fallthrough
case 80:
	fmt.Println("B")
	if score == 90 {
        break
    }
case 70:
	fmt.Println("C")
case 60:
	fmt.Println("D")
}

switch { // 默认true
case false:
	fmt.Println("false")
case true:
    fmt.Println("true")
}
```

```go
for i := 0; i < 10; i++ {
    fmt.Print(i, " ")
    if i == 5 {
        break
    }
}

for i, v := range str {
    fmt.Print(i)
    fmt.Printf("%c", v) //0h1e2l3l4o5 6w7o8r9l10d
}
```

### 6. 函数

