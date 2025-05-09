# argo

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://argoproj.github.io/argo-helm | argo-cd | 7.8.8 |
| https://argoproj.github.io/argo-helm | argo-rollouts | 2.39.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| argo-cd.applicationSet.enabled | bool | `true` |  |
| argo-cd.applicationSet.extraArgs | list | `[]` |  |
| argo-cd.applicationSet.resources | object | `{}` |  |
| argo-cd.dex.enabled | bool | `true` |  |
| argo-cd.notifications.enabled | bool | `true` |  |
| argo-cd.repoServer.autoscaling.enabled | bool | `true` |  |
| argo-cd.repoServer.autoscaling.maxReplicas | int | `5` |  |
| argo-cd.repoServer.autoscaling.minReplicas | int | `1` |  |
| argo-cd.repoServer.resources | object | `{}` |  |
| argo-cd.server.autoscaling.enabled | bool | `true` |  |
| argo-cd.server.autoscaling.maxReplicas | int | `5` |  |
| argo-cd.server.autoscaling.minReplicas | int | `1` |  |
| argo-cd.server.extraArgs[0] | string | `"--insecure"` |  |
| argo-cd.server.resources | object | `{}` |  |
| argo-rollouts.extraObjects | list | `[]` |  |
| gitOpsRepository.bootstrapPath | string | `""` |  |
| gitOpsRepository.sshPrivateKeyBase64 | string | `""` |  |
| gitOpsRepository.targetRevision | string | `"HEAD"` |  |
| gitOpsRepository.url | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
