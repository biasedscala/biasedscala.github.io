---
title: "BiasedScala: Initializing without new"
date: 2021-10-27T12:42:10+08:00
---

In the old days, when we want to create some instances of some classes, we have to use the `new` keyword, just like this:


```scala
val payloadOldWay = new JsonObject();

val message = new JsonObject
```

It's not a big deal in the most of the time, but when Scala3 comes, the `new` keyword is not mandatory anymore, I think it's a small change BUT a big step, **less keystrokes matter**:

```scala
val payload = JsonObject()
```

Underneatch, Scala3 compiler will take care of the old `new` things, this time, scala team **leave simple to user and leave complexity to themselves**.

The most beautiful thing with this feature is that it makes method chaining easier:

```scala
val payload = JsonObject()
  .put("apiUser","xyz")
  .put("apiKey","xxx")
  .put("message", JsonObject().put("text", "Hello world!"))

// of course, most of the time, I just write above code in one-liner:
// val payload = JsonObject().put("apiUser","xyz").put("apiKey","xxx").put("message", JsonObject().put("text", "Hello world!"))
```

As a vertx json API user, I like this feature very much ;)

I am old fashioned, so simple json libray which is easy to understand like vertx is my favorite, I don't like marshalling/unmarshalling with other libraries with reflection or other meta programming tricks.


