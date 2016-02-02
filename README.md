OpenShift Tomcat Build Patterns
======================

This example demonstrates deploying the default Apache Websocket Chat application using different [build](https://docs.openshift.com/enterprise/3.1/dev_guide/builds.html) strategies to [Tomcat](https://docs.openshift.com/enterprise/3.1/using_images/xpaas_images/jws.html) on OpenShift.

## Uploading the Templates

This repository contains two [templates](https://docs.openshift.com/enterprise/3.1/architecture/core_concepts/templates.html) that demonstrate building an application using the [Docker](https://docs.openshift.com/enterprise/3.1/architecture/core_concepts/builds_and_image_streams.html#docker-build) and [Source to Image (S2I)](https://docs.openshift.com/enterprise/3.1/architecture/core_concepts/builds_and_image_streams.html#source-build) build strategies.

Execute the following command using the *oc* client tool to add the included templates to OpenShift

    oc create -f tomcat8-build-patterns-docker.json,tomcat8-build-patterns-s2i.json

## Instantiate the Templates

The templates can be instantiated by executing the following commands

### Docker Build

    oc new-app --template=tomcat8-build-patterns-docker

### Source to Image Build

    oc new-app --template=tomcat8-build-patterns-s2i

## Access the application 


Once built and deployed to OpenShift, the application can be access at the following URL's depending on the build type

 * Docker -  http://jws-app-docker-&lt;project&gt;.&lt;app_subdomain&gt;/websocket-chat
 * Source to Image - http://jws-app-s2i-&lt;project&gt;.&lt;app_subdomain&gt;/websocket-chat
