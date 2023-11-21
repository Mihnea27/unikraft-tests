`ubuntu` folder contains the command used to start the VM (VM image is not in the repo because it is too big, but it is just a ubuntu cloud image that contains the same http-reply server as the kraft project.
In the `app-httpreply` you can find the commands I run to start the unikernel with kraft. 
The `wrk` command I use is:
```
$ wrk -t1 -c1 -d30s -R2000 http://172.44.0.2:8123/
```
