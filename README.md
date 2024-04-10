# Common CM interface to make it easier to prepare, run and reproduce experiments from research projects

## About

This CM repository contains a [unified Collective Mind interface (MLCommons CM)](https://github.com/mlcommons/ck) 
to access, run and reproduce experimetns from research projects and papers (ACM, IEEE, NeurIPS, ICML ...)
using artifact evaluation methodology and automation from [MLCommons](https://doi.org/10.5281/zenodo.8105339), 
[ACM/cTuning](https://cTuning.org/ae) and [NeurIPS](https://jmlr.org/papers/volume22/20-303/20-303.pdf).

## Why?

While working with the community to reproduce or replicate [150+ research papers](https://learning.acm.org/techtalks/reproducibility) 
during [artifact evaluation](https://cTuning.org/ae), we have seen that reviewers spend most of their time
at the kick-the-tires phase deciphering various READMEs and scripts to figure out how to prepare and run 
experiments.

This experience motivated us to develop a 
[simple, technology-agnostic and human-friendly interface and automation language (MLCommons Collective Mind)](https://doi.org/10.5281/zenodo.8105339) 
to provide the same common interface to prepare, run and visualize experiments
from any paper or research project.

The goal is to make it easier for the community and evaluators 
to start reproducing/replicating research results 
and even fully automate this process in the future.

Note that it's a pilot project - we are very interested in your feedback to improve this interface
and simplify and automate artifact evaluation. Feel free to contact us via this [Discord server](https://discord.gg/JjWNWXKxwT).

## License

[MIT](LICENSE.md)

## How to use

Install CM automation language as described [here](https://github.com/mlcommons/ck/blob/master/docs/installation.md).

### Install common research automations from MLCommons via CM

```bash
cm pull repo mlcommons@ck
```

### Install this repository

```bash
cm pull repo ctuning@cm4research
```

### List available interfaces for research projects

```bash
cm find script --tags=reproduce,project
```

### Set up virtual environment before running experiments

If you use python, we suggest you to set up Python virtual environment via CM as follows:

```bash
cm run script "install python-venv" --name=reproducibility
export CM_SCRIPT_EXTRA_CMD="--adr.python.name=reproducibility"
```

It will be automatically activated for all further CM commands 
while keeping your Python installation intact.

### Run experiments

Each CM script wrapper should have a CM script with the following variations:
`install_deps`, `run`, `analyze`, `plot`, `validate`, `reproduce`

It's possible to run them as follows:
```bash
cm find script --tags=reproduce,project
cm run script {name from above list} --tags=_{variation}
```

### Check/clean CM cache

Many CM commands download or produce new artifacts that are stored in CM cache 
(including CM Python virtual environments) to avoid polluting user system.

You can view current CM cache as follows:
```bash
cm show cache
cm show cache --tags=python
```

You can clean CM cache and start from scratch at any time using the following command:
```
cm rm cache -f
```

## Add CM interface for new projects and papers

You can just copy any [CM script](https://github.com/ctuning/cm4research/tree/main/script) 
and update `alias` in `_cm.yaml`. You can then extend it based on the following examples:

* [CM script to reproduce MICRO paper](../../cm-mlops/script/reproduce-micro-paper-2023-victima) to reproduce results from a MICRO paper.
* [CM script to reproduce IPOL journal paper](https://github.com/mlcommons/ck/tree/master/cm-mlops/script/reproduce-ipol-paper-2022-439)
  * [CM tutorial](https://github.com/mlcommons/ck/blob/master/docs/tutorials/reproduce-research-paper-ipol.md) to reproduce an IPOL journal paper.
* [_cm.yaml description to download and extract files from Zenodo/Dropbox via CM](https://github.com/mlcommons/ck/tree/master/cm-mlops/script/test-download-and-extract-artifacts)

After manually updating meta description of CM artifacts (`_cm.yaml` or `_cm.json`)
you must reindex them as follows:
```bash
cm reindex repo
```

We are updating [a tutorial](https://github.com/mlcommons/ck/blob/master/docs/tutorials/common-interface-to-reproduce-research-projects.md) 
to add CM interface to new projects and papers and will share it soon!

## Contact us

Don't hesitate to reach the [MLCommons Task Force on Automation and Reproducibility](https://github.com/mlcommons/ck/blob/master/docs/taskforce.md) 
and the [cTuning foundation](https://cTuning.org) (developers of the open-source CM automation language and CK playground)
to provide your feedback, get help or brainstorm ideas using this public [Discord server](https://discord.gg/JjWNWXKxwT).
