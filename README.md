# atomic-red-team
# T1525 -  Implant Internal Image
## [Description from ATT&CK](https://attack.mitre.org/techniques/T1525/)
<blockquote>An attacker can easily implant cloud or container images once they have gained access to a system in order to obtain persistence. This method concentrates on adversaries inserting an image in a registry within a victim's environment,
as opposed to Upload Malware. If the infrastructure provisioning tool is told to always utilise the most recent image, this can offer persistent access depending on how the infrastructure is set up.</blockquote>

## Atomic Tests

- [Atomic Test #1 - ContainerResourceDiscovery](#atomic-test-1---ContainerResourceDiscovery)


<br/>

## Atomic Test #1 - ContainerResourceDiscovery
Adversaries may attempt to discover containers and other resources that are available within a containers environment. 

**Supported Platforms:** docker


**auto_generated_guid:** 


#### Attack Commands: Run with `bash`! 


```bash
docker ps
docker logs --tail 10 $(docker ps -l -q --filter ancestor=t1613)
docker stats --no-stream
docker inspect $(docker ps -a -q --filter ancestor=t1613)

```

#### Cleanup Commands:
```bash
docker stop T1525_container
docker rmi -f alpine:3
docker rmi -f my-alpine
```



#### Dependencies:  Run with `bash`!
##### Description: Docker must be installed
##### Check Prereq Commands:
```bash
which docker

```
##### Get Prereq Commands:
```bash
 sudo apt-get -y install docker

```
##### Description: Run test container
##### Check Prereq Commands:
```bash
docker ps

```
##### Get Prereq Commands:
```bash
docker build -t t1613 /src
docker run -d -t t1613

```




<br/>
