---
title: "BiasedScala: I like Future more than yesterday"
date: 2021-10-15T08:47:11+01:00
---


![](images/cover.jpg)

Although we have **Executor/ExecutorService**, even **ForkJoinPool**, most of the time, I only use Scala's **Future** instead. Not because others are not excellent or no good, just because I feel natural to use Future.

I had said, if the syntax of a programming language is the taste of it, then I like scala's taste  and stick with it. Same same, I like **Future** style instead of `submit(task)` or `execute(runnable)` styles, although the underneath mechanism is almost a same.

One of the scenarios I would like to use scala **Future** is where I use Vert.x to create some HTTP API. Since Vert.x advocates to write async code, and if the processing of IO or business logic takes too long, it will warn explicitly via `io.vertx.core.impl.BlockedThreadChecker`, so usually, I will wrap the processing in a **Future** block: 

```scala
    if (channelRepository.channels.containsKey(channelId)) {
        Future {
            logger.info(s"push message: ${pushPayload} with channel: $channelId")
            channelRepository.channels.get(channelId).send(pushPayload)
        }
        ctx.response().end()
    } else {
        throw new IllegalArgumentException(s"no channel with id=${channelId} found as per the push request.")
    }
```

fire and forget, fucking easy!

OK, I admit I am not telling you the whole story,  In fact, Future block needs some implicit **ExecutionContext** available in context, so we have to `import scala.concurrent.ExecutionContext.Implicits.global` in the beginning or some where before **Future** block is used. Of course, we can create some ExecutionContext by ourselves, and implicitly import it when using **Future** block, but since `import scala.concurrent.ExecutionContext.Implicits.global` is available, I don't think it's necessary anymore, most of the time, one global ExecutionContext will be cool.

In Scala3, we can provide an implicit dependency with `given`, that's will be another story, stay tuned. 


