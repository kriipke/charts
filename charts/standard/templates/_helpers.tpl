/*====================================================*/
/*                                                    */
/*   (STANDARD) ./templates/_helpers.tpl              */
/*                                                    */
/*   THIS FILE CONTAINS TEMPLATES USED FOR LOGIC TOO  */
/*   COMPLEX OR LONG FOR EXECUTING IN A TEMPLATE AS   */
/*   WELL AS TO CENTRALLY DEFINE COMMONLY OCCURING    */
/*   TEMPLATED COMPONENTS                             */
/*                                                    */
/*====================================================*/


/*             "CHART-TEMPLATE.FULLNAME"              */
/*   ==============================================   */

{{- define "chart-template.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


/*             "CHART-TEMPLATE.FULLNAME"              */
/*   ==============================================   */

{{- define "chart-template.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

/*             "CHART-TEMPLATE.CHART"                 */
/*   ==============================================   */

{{- define "chart-template.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


/*             "CHART-TEMPLATE.LABELS"                */
/*   ==============================================   */

{{- define "chart-template.labels" -}}
helm.sh/chart: {{ include "chart-template.chart" . }}
{{ include "chart-template.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


/*          "CHART-TEMPLATE.SELECTORLABELS"           */
/*   ==============================================   */

{{- define "chart-template.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chart-template.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


/*         "CHART-TEMPLATE.SERVICEACCOUNTNAME"        */
/*   ==============================================   */

{{- define "chart-template.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chart-template.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
