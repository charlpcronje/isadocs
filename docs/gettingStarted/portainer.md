# 1 Portainer

Accelerate container adoption and reduce time-to-value on Docker and Kubernetes with a smart, self-service management portal, allowing you to deliver containerized applications from the data centre to the edge

## 1.1 Platform Management

The ability to set up, manage and configure a containerized environment is central to the Platform Manager's role. 

Portainer's platform management functionality allows engineers to both configure the orchestrator and then set up configuration 'rules' which define what users of the platform (typically developers) can and can't do inside the environment. 

## 1.2 Storage Management

Managing persistent storage is a challenge in any containerized environment, given the differing needs of applications. Portainer makes the provisioning and management of storage very straightforward for users. 

### 1.2.1 Docker provisioning

From a provisioning perspective, Portainer supports the creation of persistent volumes against either a local path on a docker host, or a CIFS share, or a NFS mount.

### 1.2.2 Volume Browsing

Portainer provides authorized users with the ability to browse the persistent volumes attached to containers. Users can interact directly with the volume content, either uploading/downloading files, or renaming/deleting.

## 1.3 Network Management

Making sure applications are properly networked within clusters is critical and Portainer makes it easy. For Docker, you can create and use additional bridge, overlay, or MACVLAN networks.  For Kubernetes, you can configure and use Ingress and Load Balancers across the cluster.

### 1.3.1 Kubernetes: Application load balancing

Portainer allows users to publish their application via a Kubernetes Ingress controller (reverse proxy) which includes defining the http routes, rewriting headers, or performing SSL offload.

### 1.3.2 Kubernetes: Network load balancing

Portainer allows users to publish their application via a Kubernetes Load Balancer (or Swarm Ingress), which provides enables their application to be globally visible across the cluster.

## 1.4 Application Deployment

At its heart, Portainer helps developers deploy cloud-native applications into containers simply, quickly and securely.

Portainer has its own simplified GUI, which makes it easy for users to get started. For advanced users, Portainer incorporates an API that allows it to connect to CI/CD tools or third-party dashboards/deployment tools.

### 1.4.1 Manual deployment options

For users with limited to zero knowledge of containers Portainer’s custom Application Templates are the ultimate “click to deploy” bootstrap for getting commonly used applications up and running fast. The Custom Templates can also be used by developers to rapidly prototype and test against a disposable system, or for repetitive use cases such as QA. To use an Application Template, a user simply needs to deploy an application, tune/configure it as they wish, and then select the option to “save as template”. This applications configuration will now be available to “single click deploy” any subsequent time.

Portainer’s support for HELM charts is limited to Kubernetes clusters, and provides users with the ability to deploy any application that is made available via the Bitnami HELM repo; alternatively, the Portainer administrator can connect Portainer to an internal repository, thereby restricting user deployments from only this trusted repo. Helm charts can be adjusted inside Portainer through our “values” editor, which lets you set whatever options are made available by the publisher of the HELM chart.

Portainer's Application Deployment Form is by far the easiest and quickest way to get your application up and running. You don’t need to know how to write complex deployment code for Docker or Kubernetes, nor any need to know how best to deploy your application atop any orchestrator. You simply need to be able to answer some natural language questions about your application and Portainer will determine the best way to deploy it.

The Application Deployment Form is pre-configured with all the rules the underlying platforms must adhere to, and the constraints application deployments must operate within, which prevents users from requesting a deployment configuration that won’t work. If the deployment button is available, your deployment will succeed, period.

![Deployment](https://www.portainer.io/hubfs/App_Dep_PB.png)

## 1.5 Observability

To do their jobs properly, developers need to know how their apps are behaving inside their containers. This capability is captured under the category of 'observability'

To monitor container-based apps properly you need to have direct and deep visibility into the underlying container platform. Containers can crash and be rescheduled in seconds, often meaning failures could go unnoticed by end users, but this doesn’t mean there isn’t a problem.

Through its close integration with the underlying container platforms, Portainer is able to help users not only identify issues in the application deployment but also identify issues in the container platform itself and provide a live visualization of what’s running where and how

### 1.5.1 Logging

Portainer is able to display your application logs, either at an individual container/pod level, or via an aggregated service/application view. Logs remain visible for the life of the container and are presented to the user via the Portainer GUI. Portainer even allows the logs to be saved locally to allow for in depth forensic analysis.

Application logs can be easily redirected to an external logging solution, such as ELK, Greylog, or Syslog.

### 1.5.2 Performance visualization

Portainer displays the real-time performance of all applications running on the cluster through a dashboard. It incorporates a live steam of CPU/RAM/Disk/Network stats for each container/pod in the stack.

## 1.6 Installation

First, create the volume that Portainer Server will use to store its database:

```shell
docker volume create portainer_data
```

Then, download and install the Portainer Server container:

```shell
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    cr.portainer.io/portainer/portainer-ce:2.9.3
```

> By default, Portainer generates and uses a self-signed SSL certificate to secure port 9443. Alternatively you can provide your own SSL certificate [during installatin](https://docs.portainer.io/v/ce-2.9/advanced/ssl#docker-standalone) or [via the Portainer UI](https://docs.portainer.io/v/ce-2.9/admin/settings#ssl-certificate) after installation is complete.
> If you require HTTP port 9000 open for legacy reasons, add the following to your docker run command:
> `-p 9000:9000`

Portainer Server has now been installed. You can check to see whether the Portainer Server container has started by running `docker ps:`

```shell
root@server:~# docker ps
CONTAINER ID   IMAGE                          COMMAND                  CREATED       STATUS      PORTS                                                                                  NAMES             
de5b28eb2fa9   portainer/portainer-ce:2.9.3   "/portainer"             2 weeks ago   Up 9 days   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp   portainer
```

## 1.7 Logging In

Now that the installation is complete, you can log into your Portainer Server instance by opening a web browser and going to:
[https://192.168.9.55:9443](https://192.168.9.55:9443)
Replace localhost with the relevant IP address or FQDN if needed, and adjust the port if you changed it earlier.
You will be presented with the initial setup page for Portainer Server.
