---
title: "Biased Scala: Hello World"
date: 2021-10-10T08:47:11+01:00
---

![](images/cover.jpg)

Before Scala3, you have to declare a wrapper object for a simple hello world program:

```scala
object Main{
    def main(args: Array[String]) : Unit = {
        println("Hello, World")
    }
}
```

When Scala3 comes, a great change follows. If we want to delare an entry method to run a program, we only need to annotate any method you want it to be the main with `@main` annotation, now, our hello world program becomes a simple one-linner:

```scala
@main def hello: Unit = println("Hello world!")
```

Scala3's compiler(dotty) will automatically generate all of the legacy external program structures for us, We don't care these legacy structures either, since we, the programers, are the users of the program language, we only need simplicity as users, even one key stroke causes burden ;)  If compiler rocks, simplicity will company us, and leaves complexicity to experts and scientists.

Scala3 deprecated the `package object` feature, it's a right decision, which makes it a pleasure to do scripting with scala.


Of course, Scala2.x also has alternatives for scripting, lihaoyi's [Ammonite](https://ammonite.io/)(https://ammonite.io/) is one of them. But since `@main` exists in both ammonite and scala3, they can't work together smoothly.

I had written a lot of ammonite scripts under project repository `workspace.amm`, but I have to say, it's not a pleasant experience to do scripting things with ammonite, since I have worked in IDE so many years(wrote java a lot too), without dependency management and auto hint/completion, it's still a pain in the neck. So most of the time, I will setup a scala project in IDE, and write scala code in IDE, run scala code in IDE. When some scripts have to be executed in high frequent way, I will build it to uber jar and then run `java -jar xyz.jar`,  furthermore, if performance and quick availability is a must, I will build the jar to native executable with native-image of GraalVM. There always is another way, right? 


Anyway, deprecating/removing `package object` makes it right, and `@main` makes scripting much easier with scala.


