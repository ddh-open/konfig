templates_json_example = """\
{
  "apiVersion": "clickhouse.altinity.com/v1",
  "kind": "ClickHouseInstallationTemplate",
  "metadata": {
    "name": "01-default-volumeclaimtemplate"
  },
  "spec": {
    "templates": {
      "volumeClaimTemplates": [
        {
          "name": "chi-default-volume-claim-template",
          "spec": {
            "accessModes": [
              "ReadWriteOnce"
            ],
            "resources": {
              "requests": {
                "storage": "2Gi"
              }
            }
          }
        }
      ],
      "podTemplates": [
        {
          "name": "chi-default-oneperhost-pod-template",
          "distribution": "OnePerHost",
          "spec": {
            "containers" : [
              {
                "name": "clickhouse",
                "image": "clickhouse/clickhouse-server:22.3",
                "ports": [
                  {
                    "name": "http",
                    "containerPort": 8123
                  },
                  {
                    "name": "client",
                    "containerPort": 9000
                  },
                  {
                    "name": "interserver",
                    "containerPort": 9009
                  }
                ]
              }
            ]
          }
        }
      ]
    }
  }
}
"""

default_pod_template_yaml_example = """\
apiVersion: "clickhouse.altinity.com/v1"
kind: "ClickHouseInstallationTemplate"
metadata:
  name: "default-oneperhost-pod-template"
spec:
  templates:
    podTemplates:
      - name: default-oneperhost-pod-template
        distribution: "OnePerHost"
"""

default_storage_template_yaml_example = """\
apiVersion: "clickhouse.altinity.com/v1"
kind: "ClickHouseInstallationTemplate"
metadata:
  name: "default-storage-template-2Gi"
spec:
  templates:
    volumeClaimTemplates:
      - name: default-storage-template-2Gi
        spec:
          accessModes:
            - ReadWriteOnce
          resources:
            requests:
              storage: 2Gi
"""

readme = """\
Templates in this folder are packaged with an operator and available via 'useTemplate'
"""
