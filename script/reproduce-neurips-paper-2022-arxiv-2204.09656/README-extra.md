## About

This reproducibility study is a part of this open Collective Knowledge challenge 
to make it easier to reproduce experimental results from research papers 
using the [MLCommons CM scripting language](https://github.com/mlcommons/ck):
* https://access.cknowledge.org/playground/?action=challenges&name=76885addc4c64f82
* https://github.com/mlcommons/ck/tree/master/cm-mlops/challenge/reproduce-and-automate-neurips-2022-paper-arxiv-2204.09656

The goal is to reproduce and automate [NeurIPS 2022 paper "A Fast Post-Training Pruning Framework for Transformers"](https://arxiv.org/abs/2204.09656)
using the CM automation language and plug it into MLPerf BERT inference benchmark.

## Authors

* [Anandu S](https://access.cknowledge.org/playground/?action=contributors&name=457012971d334b25)
* [Arjun Suresh](https://www.linkedin.com/in/arjunsuresh)
* [Grigori Fursin](https://cKnowledge.org/gfursin)

## Outcome

[Anandu S](https://access.cknowledge.org/playground/?action=contributors&name=457012971d334b25) 
added basic CM support for this BERT pruner and connected it with the CM-MLPerf workflow.
While the basic MLPerf workflow works with this BERT pruner and the community MLPerf result
was submitted via the [cTuning fundation](https://cTuning.org), the pruner seems to produce unpruned model
at this stage. We need to check it with the authors.

## CM automation

Install MLCommmons CM using [this guide](https://github.com/mlcommons/ck/blob/master/docs/installation.md).

Install reusable MLCommons automations: 

```bash
cm pull repo mlcommons@ck
```

Install this repository with CM interface for reproduced experiments:
```bash
cm pull repo ctuning@cm-reproduce-research-projects
```

### Run pruner

Generate pruned model:

```bash
cmr "reproduce neurips paper 2022 bert-pruner" (--contraint=...) --output_dir=$HOME/BERT-PRUNER
```

### Run MLPerf with pruned model

We can now use the following script with the CM command to run MLPerf and prepare submission:

```bash
cm run script --tags=run,mlperf,inference,generate-run-cmds,_find-performance  \
   --adr.python.version_min=3.8 \
   --adr.compiler.tags=gcc \
   --implementation=reference \
   --model=bert-99 \
   --precision=int8 \
   --backend=onnxruntime \
   --device=cpu \
   --scenario=Offline \
   --test_query_count=15000 \
   --adr.mlperf-inference-implementation.max_batchsize=384 \
   --results_dir=$HOME/results_dir \
   --env.CM_MLPERF_CUSTOM_MODEL_PATH=$HOME/BERT-PRUNER/model.onnx \
   --env.CM_ML_MODEL_FULL_NAME=pruned-bert-99

cm run script --tags=run,mlperf,inference,generate-run-cmds,_submission  \
   --adr.python.version_min=3.8 \
   --adr.compiler.tags=gcc \
   --implementation=reference \
   --model=bert-99 \
   --precision=int8 \
   --backend=onnxruntime \
   --device=cpu \
   --scenario=Offline \
   --mode=performance \
   --execution_mode=valid \
   --adr.mlperf-inference-implementation.max_batchsize=384 \
   --power=yes --adr.mlperf-power-client.power_server=192.168.0.15
   --results_dir=$HOME/results_dir \
   --env.CM_MLPERF_CUSTOM_MODEL_PATH=$HOME/BERT-PRUNER/model.onnx \
   --env.CM_ML_MODEL_FULL_NAME=pruned-bert-99
```

It is based on [this script]( https://github.com/mlcommons/ck/blob/master/docs/mlperf/inference/bert/run_custom_onnx_models.sh ).


### View MLPerf inference v3.1 result

We submitted test result to MLPerf inference edge open (result ID 3.1.0717):
* https://mlcommons.org/en/inference-edge-31/
* https://github.com/mlcommons/ck_mlperf_results/blob/main/experiment/mlperf-inference--v3.1--edge--open--language-processing--offline/2023-09-12.12-35-31.360011/cm-result.json#L3028
* https://access.cknowledge.org/playground/?action=experiments&tags=mlperf,v3.1,language-processing,offline,edge,open&result_uid=0fd595b91f304486

Accuracy is good and performance is worse than the reference model.

We plan to continue improving it via our open MLPerf and reproducibility challenges.

