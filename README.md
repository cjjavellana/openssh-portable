# Fork to allow scp & ssh to run on containers started as non-root
Allows usage of native scp & ssh on containers started as non-root users

## Building from source
```bash
$ docker build -t scp:latest .
```

## Running container

Enabling gdb debugging in container
```bash
$ docker run -i --entrypoint /bin/bash --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --user 100:100 -t scp:latest
```

## Generating Certificate
```bash
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f $HOME/.ssh/id_rsa
```

## Testing
1. Copy id_rsa.pub into the ~/.ssh/authorized_keys of the machine you wish to transfer the files to
2. Run the container a non-root user
```bash
$ docker run -i --entrypoint /bin/bash --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --user 100:100 -t scp:latest
```
3. Copy the private_key to /tmp and set appropriate permission
```bash
$ cd /opt/openssh && cp id_rsa /tmp && chmod 600 /tmp/id_rsa
```
4. Test file transfer
```bash
$ cd /opt/openssh
$ ./scp -S ./ssh -i /tmp/id_rsa README.md <remote user>@<remote machine host or ip>:/tmp
```
