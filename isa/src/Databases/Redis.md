# Remote Dictionary Server

> Redis, which stands for Remote Dictionary Server, is a fast, open source, in-memory, key-value data store.
What is Redis and Why is it used by leading industries?
By Jaidev Singh Bhui June 02, 2021 10 min read
What is Redis and Why is it used by leading industries?
In this age of modern technology, no one likes to wait for a long time for their search results or Twitter feeds to show up. Similarly, if you’re playing a game you would want to view the leaderboard updated in real-time. All these needs require a solution that is highly performant and rapid, which helps us in accessing data faster. Redis is a solution that makes all of this possible.

## What is Redis?
Redis actually stands for Remote Dictionary Server.

It is basically a data-structure store that stores the data in the primary memory of a computer system. It uses key-value pairs to store the data, which is just like a HashMap in Java, a dictionary in Python, or an object in JavaScript. This is also why it is sometimes referred to as a NoSQL database.

## Redis is an open-source project with a flourishing community.

Features of Redis
In-memory storage
Well, conventionally all the databases store and access the data from hard disks and SSDs, which are secondary memory. As we all know, primary memory is faster than secondary memory, as it can be accessed directly by the processor.

Now, since Redis stores its data on the primary memory, reading and writing are made faster than databases that store data on disks.


## Memory & Storage Hierarchy
This is also why Redis is used as a cache in many applications, to provide results rapidly. But we could store our data directly on the primary memory or in the system cache, we won’t require Redis then, right?

Redis is so much more than ‘just a cache’, as you will see.

## Advanced Data Structures

Redis stores its data in a key-value pair and has the ability to store the data using a variety of data structures like:

- Strings
- Lists
- Sets
- Sorted Sets
- Hashes
- Bit Arrays
- HyperLogLogs
- Streams

## Key-value store

This is not possible if you would wish to store data directly in the memory, without using Redis. Even Memcached, which is another very popular in-memory key-value store used as a caching mechanism, only supports Strings but not such data structures which Redis provides.

As a developer, you must have used some of these data structures, which also makes Redis easier to use and implement.

There is no serialization required here since the data is stored directly in the form of the data structures you are coding in. Had this not been the case, you would have to convert or serialize the data into Strings before storing it into any other data store or database.

## Persistence

Another disadvantage of directly using primary memory or system cache is the data being volatile. All the data on primary memory gets washed off or cleaned as soon as there is no power source or when the system is shut down.

Redis offers two mechanisms to help prevent this - Snapshots and AOFs (Append Only Files), which are basically a backup of the Redis data-store on the secondary memory, so that if there is a system failure or if there is a power outage, it can recall the current state of the database, by loading data from these backups present on the disks.

## Replication

Redis uses master-slave (primary-replica) architecture, where data can be replicated to multiple replica servers. This boosts the read performance since requests can split among different servers. This also helps in faster recovery in case the master or primary server experiences an outage.

## Huge Support

Being an Open Source project with a diverse community, Redis has no technology constraint, as it is based on open standards, and supports open data formats. It also supports a rich set of clients, with support in more than 40 programming languages.

Since Redis stores everything in-memory, in the form of a wide variety of data structures, and also provides persistence and the ability of replicating servers, it stands out when comparing to other databases/caches which cannot serve the same purpose as Redis.

## Twitter - Caching with low latency

Twitter is a social-networking site, which is much like any other social media application out there, with features like a user can create posts, like other user’s posts, comment on a post, or even follow other users. Posts in this context are tweets, but let’s keep it general.

Let’s say you’re building a social media application.

You would want to save user profiles in a cache, with information like number of posts, followers and following, so that a lot of overhead is reduced on the system, to fetch data from the database and recompute every time the user asks for it.

Similarly, when you would open the application signed in as a user, the first screen you would see is your feed or timeline, which would have posts from all the users you follow.

Now, of course, if you follow only 2-3 users, getting their posts in reverse order and then merging them is not that heavy of a computation. But if it’s a pretty big application, with millions of users, where they are following hundreds of thousands of users, this performs very poorly, as this needs to be computed for every user, every time they open the app.

This is where Redis comes into the picture and solves the problem by computing and storing all of these timelines in a cache, and serving it to the clients from there.

It’s faster, provides lower latency, and performs way better.

As you can see, Redis is basically a swiss army knife and has multiple use cases in the real world. I hope that now you have a better knowledge of how these real-world applications use Redis, and what causes your feeds and gaming leaderboards to update in real-time.