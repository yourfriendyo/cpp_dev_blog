<font color=green>1. 动静态链接的不同？以及优缺点是什么？</font>

静态链接是在链接时，将库文件链接进程序文件中，会导致程序文件占存大。

动态链接是在程序运行时，由系统的装载程序将内存中的库，加载进程序。

| 动静态链接   | 优点                       | 缺点                   |
| ------------ | -------------------------- | ---------------------- |
| **静态链接** | 运行速度快                 | 浪费空间、更新较为麻烦 |
| **动态链接** | 避免空间浪费、维护比较方便 | 运行速度相对慢一点     |

<font color=green>2. 进程和程序的区别是什么？</font>

程序的本质是二进制文件。进程是程序的代码数据和进程相关内核数据结构的总和。

> 进程相关的内核数据结构一般有：进程控制块、进程打开的文件、进程地址空间等。

<font color=green>3. 僵尸进程和孤儿进程，分别是什么？</font>

- 僵尸进程是指进程死亡后资源不被回收，停留在僵尸状态没有死亡。通常是父进程因某种原因无法释放该进程，造成资源泄漏。
- 只要父进程没有wait或waitpid，子进程就一直保持僵尸状态。

- 孤儿进程是指进程的父进程变成1号进程，被系统领养。通常是因为父进程提前结束导致的。

> 父进程退出，当前前台进程就变成shell解释器，所以孤儿进程就变成了后台进程。

精灵进程和守护进程是一种进程，脱离终端，独立存在。

<font color=green>4. 进程地址空间是什么？</font>

每一个进程都有自己独立的mm_struct 结构体，描述进程的虚拟地址空间。

用始末两个指针来维护一段空间，其中有多个指针，标识不同区域。

系统通过页表和 MMU，将虚拟地址和物理地址关联起来。

<font color=green>5. 进程地址空间存在的意义是什么？</font>

- 防止进程非法访问空间，保护内存和进程安全。
- 将进程管理和内存管理解耦，高效使用内存。
- CPU能以统一方式看待进程的代码和数据。数据也可以随意存储在物理内存中。

<font color=green>6. 如何理解fork返回值问题？</font>

fork 函数 return 时会有两个执行流，父进程得到子进程 pid，子进程得到 0。父子进程同一个变量值却不同，也是发生了写时拷贝。

<font color=green>7. 写时拷贝是如何实现的？</font>

写时拷贝是在物理内存上重新开辟空间，修改方的页表将变量的虚拟地址和新空间的真实地址作映射。

写时拷贝完全是系统底层做的工作，并不会改变虚拟地址，所以用户层无法感知。

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

<font color=green>11. </font>

