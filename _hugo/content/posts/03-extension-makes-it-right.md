---
title: "BiasedScala: extension makes a right way"
date: 2021-10-15T08:47:11+01:00
---

I get to know extension is via Kotlin, After Scala3, extension comes to scala also. Cheerful, isn't it?

`extension` is an elegant way to extend types and classes. 

I use Commons-Lang3 library a lot to process string things, Let's say, `StringUtils.isEmpty(StringUtils.trimToEmpty(..))` or `StringUtils.substringBetween(StrinUtils.trimToEmpty(..), .., ..)`, it's necessary for precaution, but tedious, isn't it?  With Scala 3's `extension` ability, we can make this more natural and elegant:

```scala
extension (s:String) {
    def isEmpty():Boolean = StringUtils.isEmpty(s)
    def trimToEmpty():String = StringUtils.trimToEmpty(s)
    def isEmptyAfterTrim():Boolean = StringUtils.isEmpty(StringUtils.trimToEmpty(s))
    def substringBetween(from:String, to:String) :String = StringUtils.substringBetween(s, from, to)
    ...
}
```

after that, we just use String as the way it is: 

```scala
val str = "...."
if(str.isEmpty()) ...
if(str.isEmptyAfterTrim())...
val partWeWant = str.substringBetween(.., ..)
```

This's so cool, and I like it this way.

We can also make extension generic, for example, we want our Money type has a display symbol when convert to string, then we can add an extension to it:

```scala
extension [M <: Money] (money: M) {
    def toStringWithSymbol():String = {
        money match {
            case USD => "$"
            case CNY => "¥"
            case GBP => "£"
            case _ => "#"
        } + money.amount
    }
}
```

With this extension, we can display meaningful information to our customers on GUIs or Pages of our applications: 

```scala
val m:Money = ...
println(m.toStringWithSymbol) // usually pass with DTO
```

Formerly, if we want to extend some 3rd party libraries classes, we have to wrap them in some utility classes, especially these 3rd classes don't expose enough priviledge to extend them. 

Now, with extension of Scala 3, we just provide an extension to them, and everything goes like a charm.


