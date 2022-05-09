# Affirmation API

This API allows you to get a random affirmation from a predefined list.

| *Method*           |           *Returns*           |
| ------------------ | :---------------------------: |
| /randomAffirmation | String represents affirmation |

A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```