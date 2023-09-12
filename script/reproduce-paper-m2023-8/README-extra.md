# CM script to run and reproduce experiments

Original repository: [https://github.com/FPSG-UIUC/micro23-teaal-artifact](https://github.com/FPSG-UIUC/micro23-teaal-artifact)

## Reusability using MLCommons CM automation language

Install MLCommmons CM using [this guide](https://github.com/mlcommons/ck/blob/master/docs/installation.md).

Install this repository with CM interface for reproduced experiments:

```bash
cm pull repo ctuning@cm-reproduce-research-projects
```

## Run TeAAL via the CM interface

To install dependencies, run:

```bash
cmr "reproduce paper m 2023 8 _install_deps"
```

To check that the environment is correctly set up and evaluate each accelerator configuration on a small example, run:

```bash
cmr "reproduce paper m 2023 8 _check"
```

To run the real experiments, run:

```bash
cmr "reproduce paper m 2023 8 _run"
```

To plot the results of the real experiments, run
```bash
cmr "reproduce paper m 2023 8 _plot"
```

The plots will be stored at `/path/to/CM/repos/local/cache/<some hash>/data/plots`. The hash is printed whenever any of the scripts is called.

To plot pregenerated results (e.g., if you don't want to run the experiments yourself), run:
```bash
cmr "reproduce paper m 2023 8 _plot_pregenerated"
```
