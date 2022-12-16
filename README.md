# atomic-red-team
# T1525 -  Implant Internal Image
## [Description from ATT&CK](https://attack.mitre.org/techniques/T1525/)
<blockquote>An attacker can easily implant cloud or container images once they have gained access to a system in order to obtain persistence. This method concentrates on adversaries inserting an image in a registry within a victim's environment, as opposed to Upload Malware. If the infrastructure provisioning tool is told to always utilise the most recent image, this can offer persistent access depending on how the infrastructure is set up.</blockquote>

## Atomic Tests

- [Atomic Test #1 - Implant Internal Image](#atomic-test-1---ImplantInternalImage)


<br/>

## Atomic Test #1 - ImplantInternalImage
Adversaries may attempt to implant any sort of malicious code or any other thing which gives persistent to the adversary over the containers.

**Supported Platforms:** container



#### Attack Commands: Run with `bash`! 


```bash
   docker run -d  --name T1525_container -itt alpine:3 sh -c "echo '1' > /tmp/test "
   docker commit T1525_container my-alpine


```

#### Cleanup Commands:
```bash
    docker stop T1525_container
    docker rm -f T1525_container
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



<br/>
