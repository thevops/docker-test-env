# Docker env for testing purposes


## Look at Makefile
```
 ---------------------------------------------------------------------------- 
   Test docker with SSH and systemd 
 ---------------------------------------------------------------------------- 
                             
build                          Docker build
run                            Docker run
stop                           Docker stop
exec-bash                      Docker exec into bash
start-ssh                      Run 'systemctl start ssh' in container
ssh                            SSH into container
```

Example: `make run port=3333 name=testing1`


After `build` you need to `run` container with optional parameters `port` and `name`.
If you want to run multiple containers you can't set **the same** `name`.


When container starts, execute `make start-ssh name=xxx` to start SSH service in container.
