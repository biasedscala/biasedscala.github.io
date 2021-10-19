---
title: "Biased Scala之Hello World"
date: 2021-10-10T08:47:11+01:00
---


![](images/cover.jpg)

Scala3出来之前， 写个简单hello world程序要声明一个object:

```scala
object Main{
    def main(args: Array[String]) : Unit = {
        println("Hello, World")
    }
}
```


Scala3出来之后，有了一个革命性的改善， 那就是main方法的入口直接用@main标注一下就可以了, hello world即刻变成one-liner:

```scala
@main def hello: Unit = println("Hello world!")
```

Scala3的编译器会自动生成外围结构，对于程序员来说，那些劳神子本就不应该操心，**程序员是计算机语言的用户**， 对用户来说，越简单越好，越少敲几次键盘越好。 编译器搞得好，就会**把简单留给用户，把复杂留给自己**。


再加上Scala3废除了很傻逼的package object，用Scala3写脚本也将成为更加赏心悦目的体验。



当然， Scala2.x也不是说不能写脚本， lihaoyi搞的[Ammonite](https://ammonite.io/)(https://ammonite.io/)也还不错， 但碰上Scala3就遭遇降级了，`@main`直接冲突，你有我也有，哈



之前用Ammonite写了满满一个`workspace.amm`（项目），但架不住自己是IDE拉扯大的程序员出身啊， 没有了依赖的自动管理和语法的自动提示，语法再简单，用来写复杂一点儿的脚本也是小痛苦的事情，所以， Scala2.x时代， 囧最终还是宁愿新建一个dirtyWorks项目，IDE里写，IDE里跑， 实在高频的脚本，那咱就编译成jar直接`java -jar xyz.jar`呗，甚至于想进一步追求性能与迅速可用，那就用GraalVM的native-image编译成native的可执行文件并加到PATH里去run呗！


Anyway，我觉得Scala3里第一个走对了的路就是去除`package object`，而且还一`@main`解千愁。

