# NGINX-PROXY-SERVER


## #1. nGrinder 설정

### Controller
- Build
```
$ docker pull ngrinder/controller
$ docker run -d -v ~/ngrinder-controller:/opt/ngrinder-controller -p 8080:80 -p 16001:16001 -p 12000-12009:12000-12009 ngrinder/controller
```
- Agent와 Controller의 PC가 다르기에 외부접속을 위한 Setting

  - Window 방화벽 해제
  - WSL 방화벽 해제
    ```
    sudo ufw disable
    ```
  - port forwarding
    ```
    관리자 권한으로 CMD 접속
    $ netsh interface portproxy add v4tov4 listenport=8080 listenaddress=0.0.0.0 connectport=8080 connectaddress=172.27.121.71
    $ netsh interface portproxy add v4tov4 listenport=16001 listenaddress=0.0.0.0 connectport=16001 connectaddress=172.27.121.71
    ```

### Agent
- 192.168.0.29:8080 접속 후 admin/admin 로그인
- Agent Download
    ```
    tar -xvf ngrinder-agent-3.5.9-192.168.0.29.tar
    ```
- vi ~/.ngrinder_agent/agent.conf 수정
    ```
    common.start_mode=agent
    agent.controller_host=192.168.0.29
    agent.controller_port=16001
    agent.subregion=
    agent.owner=admin
    #agent.host_id=
    #agent.server_mode=true

    # provide more agent java execution option if necessary.
    #agent.java_opt=
    # provide more agent jvm classpath if necessary.
    #agent.jvm.classpath=
    # set following false if you want to use more than 1G Xmx memory per a agent process.
    #agent.limit_xmx=true
    # please uncomment the following option if you want to send all logs to the controller.
    #agent.all_logs=true
    # some jvm is not compatible with DNSJava. If so, set this false.
    #agent.enable_local_dns=false
    # please uncomment the following option if you want to run controller_to_agent connection mode agent.
    #agent.connection_mode=controller_to_agent
    #agent.connection_port=14000
    # set following with the ip you want to broadcast yourself. Set this option if the agent needs to be discovered as public ip.
    #agent.broadcast_ip=
    ```
- Agent run
    ```
    $ sh run_agent.sh
    ```

