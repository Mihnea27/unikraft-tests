`ubuntu` folder contains the command used to start the VM (VM image is not in the repo because it is too big, but it is just a ubuntu cloud image that contains the same http-reply server as the kraft project.
In the `app-httpreply` you can find the commands I run to start the unikernel with kraft. 
The `wrk` command I use is:
```
$ wrk -t1 -c1 -d30s -R2000 http://172.44.0.2:8123/
```
The results I get are:
1. Unikernel
```
Running 30s test @ http://172.44.0.2:8123/
  1 threads and 1 connections
  Thread calibration: mean lat.: 18.888ms, rate sampling interval: 137ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     -nanus    -nanus   0.00us    0.00%
    Req/Sec     0.00      0.00     0.00    100.00%
  3189 requests in 30.01s, 691.37KB read
  Socket errors: connect 0, read 0, write 0, timeout 14
Requests/sec:    106.26
Transfer/sec:     23.04KB
```
2. Ubuntu VM
```
Running 30s test @ http://172.44.0.2:8123/
  1 threads and 1 connections
  Thread calibration: mean lat.: 0.797ms, rate sampling interval: 10ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   803.65us  333.34us   1.69ms   58.15%
    Req/Sec     2.13k   110.45     2.44k    66.35%
  60000 requests in 30.00s, 12.70MB read
Requests/sec:   2000.01
Transfer/sec:    433.59KB
```

Results are similar using Unikraft v0.14
