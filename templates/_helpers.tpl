{{/* vim: set filetype=mustache: */}}
{{- define "cloudsql-proxy.name" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cloudsql-proxy.selector" -}}
release: {{ .Release.Name | quote }}
app: {{ .Chart.Name | quote }}
{{- end -}}

{{- define "cloudsql-proxy.labels" -}}
heritage: {{ .Release.Service | quote }}
chart: {{ printf "%s-%s" .Chart.Name (.Chart.Version | replace "+" "_") | quote }}
{{ include "cloudsql-proxy.selector" . -}}
{{- end -}}
