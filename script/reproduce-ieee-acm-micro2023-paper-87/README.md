# CM script to run and reproduce experiments

Archived artifact: https://zenodo.org/record/8218698

## Reusability using MLCommons CM automation language

Install MLCommmons CM using [this guide](https://github.com/mlcommons/ck/blob/master/docs/installation.md).

Install this repository with CM interface for reproduced experiments:

```bash
cm pull repo ctuning@cm-reproduce-research-projects
```

## Install Python virtual environment via CM

```bash
cm run script "install python-venv" --name=reproducibility
export CM_SCRIPT_EXTRA_CMD="--adr.python.name=reproducibility"
```

## Install deps

To install dependencies, run:

```bash
cmr "reproduce paper m 2023 87 _install_deps"
```

## Run 

```bash
cmr "reproduce paper m 2023 87 _run"
```

## Plot

To plot the results of the real experiments, run
```bash
cmr "reproduce paper m 2023 87 _plot"
```
