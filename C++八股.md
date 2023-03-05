<font color=green>1. C++是如何支持函数重载的呢？ </font>

C语言单纯使用函数名查找函数地址，同名函数的符号表冲突。

C++函数的编译符号名称，和函数名、参数类型有关。对于编译器来说，这些函数并不相同。

<font color=green>2. 指针和引用的区别？ </font>

- 引用是变量的别名，没有独立空间，指针是变量，存储地址。
- 引用必须初始化，指针不要求初始化。
- 引用无法改变引用实体，指针可以改变指向。
- 没有空引用，只有空指针。
- 无多级引用，有多级指针。

<font color=green>3. auto关键字的作用？</font>

auto 定义的变量，编译器根据初始化的内容自动推导其类型。类型很长时可以使用 auto 代替，更简单省事。

<font color=green>4. 那些运算符不可被重载？</font>

共有5个运算符不可被重载，分别是：`.*`、`::`、`sizeof`、`?:`、`.`。

<font color=green>5. 哪些类型的变量必须放在初始化列表初始化？</font>

1. 引用类型
2. const 修饰的常变量
3. 无默认构造的自定义类型

<font color=green>6. this指针为空时解引用一定会出问题吗？</font>

this指针是非静态成员函数的隐含形参，如果成员函数内部没有访问成员变量，就不会出问题，因为成员函数存储在代码段，不占用对象空间。

<font color=green>7. 赋值运算符重载只能实现在类中？</font>

是的，赋值运算符重载只能实现在类中，因为赋值运算符重载是类中默认成员函数

<font color=green>8. 类中实现运算符重载有哪些要求？</font>

运算符重载函数最多有两个参数，分别作为左操作数和右操作数。如果实现为类成员函数，隐含形参this指针占第一个参数，所以只剩一个参数。

<font color=green>9. 以下代码调用的是赋值重载还是拷贝构造？</font>

```cpp
A a2 = a1; // 用已存在的对象在创建时初始化该对象，调用的是拷贝构造
a2 = a1;   // 两个已存在的对象相互赋值，调用的是赋值重载
```

<font color=green>10. 初始化列表中的顺序就是成员变量初始化的顺序吗？</font>

不是，成员变量初始化的顺序和在初始化列表的顺序无关，取决于成员在类中的声明顺序。

<font color=green>11. 类中成员变量的声明处可以赋值吗？</font>

不是，在成员变量声明处给的是初始化的缺省值，如果在初始化列表中该成员变量没有被初始化，就会使用缺省值进行初始化。

<font color=green>12. 以下代码为什么整型值可以“赋值”给一个对象？</font>

```cpp
class A {
public:
    A(int a) {};
};
A a = 1; // ?
```

这是在用整型值初始化一个类对象，本质是用整型值调用构造函数，创建出一个临时对象，再用这个临时对象拷贝构造出一个对象。

编译器会将这一次构造+一次拷贝，优化成一次构造，直接用该整型值调用构造函数。

如果不允许发生这样的隐式类型转换，可用`explicit`修饰构造函数。

<font color=green>12. 静态成员变量有哪些特点？</font>

静态成员变量只属于类不属于任意对象，所以不能用构造函数初始化，只能在类外定义。

静态成员存储在静态区，计算类的大小时不包括静态成员。

<font color=green>13. 友元函数是否隐含this指针？没有的话，为什么能访问类成员？</font>

友元函数是全局函数，没有隐含的this指针。友元函数突破封装，是指可通过对象直接访问私有成员。

```cpp
class A {
    int _a;
};
friend f(A& a) { // 通过传参获取类对象访问成员，并不是像成员函数一样通过this指针访问成员，注意区分
    cout << a._a;
}
```

友元类同样如此。友元类中必须含有对方类的对象作成员变量。

```cpp
class Time {
    friend class Date;
private:
    int _hour, _min, _sec;
};
class Date {
public:
    Date(int year = 1, int month = 1, int day = 1)
        : _year(year), _month(month), _day(day)
    {
        _t._hour = _t._minute = _t._second = 0; // 突破封装，直接访问私有成员
    }
	int _year, _month, _day;
    Time _t; //对方类对象作成员变量
};
```

<font color=green>14. new/detete不搭配使用会造成什么问题？</font>

- 内置类型不搭配不会造成内存泄漏，也不会有什么资源清理问题。
- 自定义类型，如果没有实现析构，不会有什么问题。如果实现了析构，可能因析构次数不对，程序崩溃。

<font color=green>15. new/delete 底层都是什么？</font>

- new 底层先调用 operator new 开辟空间，再利用定位 new 表达式调用构造初始化。
- delete 底层先调用析构函数清理资源，再调用 operator delete 释放空间。

operator new/delete 是全局函数，内部实现也是调用c语言的 malloc/free。

定位 new 表达式，用来为已开辟的内存空间调用构造函数初始化。

```cpp
A* pa = operator new(sizeof(A)); // 开辟空间
new(pa) A(1, 2, 3);              // 定位new构造初始化
```

> 构造函数无法手动调用，只能用定位new。析构函数可手动调用，所以不需要。

<font color=green>16. 如下类对象，构造和析构的调用顺序是怎么样的？</font>

```cpp
C c;
int main() {
    A* a = new A();
    B b;
    static D d;
    delete a;
}
```



<font color=green>17. 类模版的声明 class 和 typename，有什么讲究？</font>

```cpp
template <class T1>
template <class T1, class T2>
template <class T1, typename T2>
```

class 和 typename 可以混用，但不能缺少。

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

