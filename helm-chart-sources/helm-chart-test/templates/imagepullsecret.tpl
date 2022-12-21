{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.container.image.registry (printf "%s:%s" (required "Requires username." .Values.container.image.credentials.username) (required "Requires password." .Values.container.image.credentials.password) | b64enc) | b64enc }}
{{- end }}