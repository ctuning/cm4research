# CM script to run and reproduce experiments

Original repository: https://github.com/UofT-EcoSystem/Grape-MICRO56-Artifact/wiki#installation

### Reusability using MLCommons CM automation language

Install MLCommmons CM using [this guide](https://github.com/mlcommons/ck/blob/master/docs/installation.md).

Install reusable MLCommons automations: 

```bash
cm pull repo mlcommons@ck
```

Install this repository with CM interface for reproduced experiments:
```bash
cm pull repo ctuning@cm-reproduce-research-projects
```

### Install dependencies

```bash
cmr "reproduce project micro-2023 22 _install_deps"
cmr "reproduce project micro-2023 22 _install_deps_driver"
cmr "reproduce project micro-2023 22 _install_deps_cuda"
cmr "reproduce project micro-2023 22 _install_deps_pytorch"
cmr "reproduce project micro-2023 22 _install_deps_transformers"
```

