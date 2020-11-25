{{/*
Expand the name of the chart.
*/}}
{{- define "openbalena.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openbalena.fullname" -}}
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

{{/*
Create a fully qualified api name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openbalena.api.fullname" -}}
{{- if .Values.api.fullnameOverride -}}
{{- .Values.api.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified registry name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openbalena.registry.fullname" -}}
{{- if .Values.registry.fullnameOverride -}}
{{- .Values.registry.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.registry.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.registry.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified vpn name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openbalena.vpn.fullname" -}}
{{- if .Values.vpn.fullnameOverride -}}
{{- .Values.vpn.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.vpn.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.vpn.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified db name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openbalena.db.fullname" -}}
{{- if .Values.db.fullnameOverride -}}
{{- .Values.db.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.db.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.db.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified s3 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openbalena.s3.fullname" -}}
{{- if .Values.s3.fullnameOverride -}}
{{- .Values.s3.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.s3.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.s3.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified redis name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openbalena.redis.fullname" -}}
{{- if .Values.redis.fullnameOverride -}}
{{- .Values.redis.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.redis.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.redis.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openbalena.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "openbalena.labels" -}}
helm.sh/chart: {{ include "openbalena.chart" . }}
{{ include "openbalena.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common api labels
*/}}
{{- define "openbalena.api.labels" -}}
{{ include "openbalena.labels" . }}
app.kubernetes.io/component: {{ .Values.api.name }}
{{- end }}

{{/*
Common registry labels
*/}}
{{- define "openbalena.registry.labels" -}}
{{ include "openbalena.labels" . }}
app.kubernetes.io/component: {{ .Values.registry.name }}
{{- end }}

{{/*
Common vpn labels
*/}}
{{- define "openbalena.vpn.labels" -}}
{{ include "openbalena.labels" . }}
app.kubernetes.io/component: {{ .Values.vpn.name }}
{{- end }}

{{/*
Common db labels
*/}}
{{- define "openbalena.db.labels" -}}
{{ include "openbalena.labels" . }}
app.kubernetes.io/component: {{ .Values.db.name }}
{{- end }}

{{/*
Common s3 labels
*/}}
{{- define "openbalena.s3.labels" -}}
{{ include "openbalena.labels" . }}
app.kubernetes.io/component: {{ .Values.s3.name }}
{{- end }}

{{/*
Common redis labels
*/}}
{{- define "openbalena.redis.labels" -}}
{{ include "openbalena.labels" . }}
app.kubernetes.io/component: {{ .Values.redis.name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "openbalena.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openbalena.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector api labels
*/}}
{{- define "openbalena.api.selectorLabels" -}}
{{ include "openbalena.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.api.name }}
{{- end }}

{{/*
Selector registry labels
*/}}
{{- define "openbalena.registry.selectorLabels" -}}
{{ include "openbalena.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.registry.name }}
{{- end }}

{{/*
Selector vpn labels
*/}}
{{- define "openbalena.vpn.selectorLabels" -}}
{{ include "openbalena.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.vpn.name }}
{{- end }}

{{/*
Selector db labels
*/}}
{{- define "openbalena.db.selectorLabels" -}}
{{ include "openbalena.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.db.name }}
{{- end }}

{{/*
Selector s3 labels
*/}}
{{- define "openbalena.s3.selectorLabels" -}}
{{ include "openbalena.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.s3.name }}
{{- end }}

{{/*
Selector redis labels
*/}}
{{- define "openbalena.redis.selectorLabels" -}}
{{ include "openbalena.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.redis.name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "openbalena.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "openbalena.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
