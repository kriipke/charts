<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [`values.yaml` Conventions](#valuesyaml-conventions)
  - [Images](#images)
  - [Labels](#labels)
  - [HPA](#hpa)
  - [Resrouces](#resrouces)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# `values.yaml` Conventions

```yaml
grafana:
  dashboard:
    enabled: true

replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: ""

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # Annotations to add to the service account
  annotations: {}
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name: ""

podAnnotations: {}

podSecurityContext: {}
  # fsGroup: 2000

securityContext: {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: false
  className: ""
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

resources: {}
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  # limits:
  #   cpu: 100m
  #   memory: 128Mi
  # requests:
  #   cpu: 100m
  #   memory: 128Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
```


## Images

__By default, leaving `.Values.image.tag` without a value should result in the image URL being templated with `.Chart.appVersion` in place of `.Values.image.tag`.__

```yaml
image:
  repository: ""
  pullPolicy: IfNotPresent
  tag: ""
```
The image specification should always have the exact structure above in the default `values.yaml` for your chart.

This `.Values.image` must always be placed at the top level of the `values.yaml`. This container image and this Helm Chart should have an intimate connection.

If there are multiple containers being deployed and it's not obvious which one is appropriate for the value of `.Chart.appVersion`, consider making an umbrella chart, with each microservice gettings its own chart. These can easily be composited into complex "parent" charts.

## Labels

## HPA

`Deployments` and `DaemonSets` are to have an **HPA** configured.

## Resrouces

```yaml
resources: {}
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  # limits:
  #   cpu: 100m
  #   memory: 128Mi
  # requests:
  #   cpu: 100m
  #   memory: 128Mi
```

== Ingress
