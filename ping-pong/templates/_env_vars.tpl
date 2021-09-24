{{- define "chartstack.chart-env-vars" }}
  {{ range .Values.env.configmap }}
  - name: {{ .name }}
    valueFrom:
      configMapKeyRef:
        name: {{ $.Release.Name }}-{{ $.Chart.Name }}-configmap
        key: {{ .name }}
  {{- end }}
  {{ range .Values.env.secret }}
  - name: {{ .name }}
    valueFrom:
      secretKeyRef:
        name: {{ $.Release.Name }}-{{ $.Chart.Name }}-secret
        key: {{ .name }}
  {{- end }}
{{- end }}