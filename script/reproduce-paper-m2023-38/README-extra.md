# CM script to run and reproduce experiments

Original repository: https://github.com/HieronZhang/G10-Artifact


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

### Run G10 via CM interface

Perform the following steps to evaluate Photon with MLCommons CM automation language:

1) This command will install system dependencies for Docker and require sudo (skip it if you have Docker installed):

```bash
cmr "reproduce project micro-2023 G10 _install_deps"
```

2) This command will prepare and run all experiments:

```bash
cmr "reproduce project micro-2023 G10 _run" --max_process_num=[nthreads]
```

- The variable `max_process_num` is the maximum allowed number of parallel experiments in the script. Note that user may have to change the `max_process_num` based on their machine's main memory capacity (Each experiment requires a peak memory of about 28.5 GB). Please modify this number based on your machine's main memory capacity. One experiment process will need a peak memory of 28.5 GB. (We recommend reserving 30 GB for each process to ensure that the program won't crash. For example, if your machine has 128 GB of main memory, `max_process_num` can be set as 4).

3) In case of successful execution of a previous command, this command will generate plots to help you validate results from the article:

```bash
cmr "reproduce project micro-2023 G10 _plot"
```
