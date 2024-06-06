The network setup is the usual with a bridge set with `kraft net`.

The `wrk` command I use for single connection is:
```
$ wrk -t1 -c1 -d1m -R100000 http://172.44.0.2:8080/
```

For 30 concurrent connections I use:
```
$ wrk -t14 -c30 -d1m -R100000 http://172.44.0.2:8080/
```
