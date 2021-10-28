---
title: "BiasedScala: collection converters should be gone"
date: 2021-10-27T12:39:39+08:00
---

Scala offers its own collection framework besides java's collections. But most of the time, I use more java's collection than scala's. So that means, I have to import converters to convert to or convert from java collections or scala collections. This is annoying in my opinion. 

Furthermore, in Scala2.12.x and Scala2.13.x, the collection converters are different, I have write down a note for this or put two code snippets in my Dash.app, **Consistency**, where are you?!

To use collections of Java with FP support, We have to do it this way in Scala 2.12.x:

```scala
import scala.collection.JavaConverters._

val s: java.util.Set[String] = Set("one", "two").asJava
val s2 = FileUtils.listFiles(...).asScala
```

In Scala 2.13.x this way:

```scala
import scala.jdk.CollectionConverters._

val s: java.util.Set[String] = Set("one", "two").asJava
val s2 = FileUtils.listFiles(...).asScala
```

It's not elegant and necessary, I think, especially when Scala 3 has introduced `extention` mechanism,  If I want to use Java collections with additional FP support which scala collections offer, I should use these FP support directly without import anything:

```scala
FileUtils.listFiles(...).foreach(file=> ...)
```

No more import converters, No more asScala/asJava things, that's what I think a good design.

Sadly, I can NOT see this currently in Scala 3.
