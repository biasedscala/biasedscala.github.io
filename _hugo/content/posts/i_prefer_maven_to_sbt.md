---
title: "I Prefer Maven To SBT as Scala Build Tool"
date: 2021-10-28T22:39:53+08:00
---

To work with scala with pleasure and effeciency, I had tried SBT, maven, gradle from time to time, but at last I stay with Maven as my main build tool for scala.

Although SBT is popular in scala community, and I had put a lot of time and attention to it before, let's say: 

- The chapter about SBT in "Real World Scala"(incomplete), <https://github.com/CSUG/real_world_scala/blob/master/02_sbt.markdown>
- [How to write a SBT 0.10+ plugin?](https://fujohnwang.blogspot.com/2011/10/how-to-write-sbt-010-plugin.html)
- [Understanding SBT In My Way](https://fujohnwang.blogspot.com/2010/11/understanding-sbt-in-my-way.html), 2011/10/09

But at last, I found, it's tricky to follow up the version and evolution of this tool, so I stay with maven finally, and with springboot's maven plugin, everything gets simple: 

1. maven with [scala-maven-plugin](http://davidb.github.io/scala-maven-plugin/usage.html) build java and scala;
2. springboot maven plugin package the whole application into an executable jar(that means, a simple command `java -jar xyz.jar` will launch the application without any surprises);
3. systemd with a consistent unit file deploys application with ease;

I do know docker and kubernetes, but most the time, springboot + maven + systemd get my things done. 

Granularity matters, if I run a startup with few projects, kubernetes is too heavey, with JVM, docker container seems not so necessary, maybe with GraalVM and its native image or ScalaNative, docker container or kubernetes make some sense.

It's not always the best way, but it's my way.








