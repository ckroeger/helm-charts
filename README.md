# helm-charts
My published Helm-Charts

Based on medium article -> https://medium.com/@mattiaperi/create-a-public-helm-chart-repository-with-github-pages-49b180dbb417

# Lint the chart

As a good habit, helm lint runs a series of tests to verify that
the chart is well-formed:

````shell
$ helm lint helm-chart-sources/*
````

Create the Helm chart package

````shell
$ helm package helm-chart-sources/*
Successfully packaged chart and saved it to: /Users/perim/git/helm-chart/helm-chart-test-0.1.0.tgz
````

# Create the Helm chart repository index

According to Helm:

    A repository is characterized primarily by the presence of a special file called index.yaml that has a list of all of the packages supplied by the repository, together with metadata that allows retrieving and verifying those packages.

So, everything we need to create is the index.yaml file and the command to do that is:

````shell
$ helm repo index --url https://ckroeger.github.io/helm-charts/ .

$ cat index.yaml
apiVersion: v1
entries:
helm-chart-test:
- apiVersion: v1
  appVersion: "1.0"
  created: 2019-04-16T11:10:08.729944+02:00
  description: A Helm chart for Kubernetes
  digest: 35a4e31bfacc496f1b1bce664652916bb8701cc9df77f1b90534f5234ff297a6
  name: helm-chart-test
  urls:
    - https://ckroeger.github.io/helm-charts/helm-chart-test-0.1.0.tgz
      version: 0.1.0
      generated: 2019-04-16T11:10:08.729368+02:00
````