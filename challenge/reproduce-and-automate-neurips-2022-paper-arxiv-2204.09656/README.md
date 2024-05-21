### Added CM interface

* https://github.com/ctuning/cm4research/blob/main/script/reproduce-neurips-paper-2022-arxiv-2204.09656/README-extra.md

### Challenge

Reproduce and automate NeurIPS 2022 paper "A Fast Post-Training Pruning Framework for Transformers" 
using the [CM automation language](https://doi.org/10.5281/zenodo.8105339).

Convert models to ONNX format acceptable by the MLPerf BERT inference benchmark.

Create multiple BERT variations in ONNX format for the MLPerf inference v3.1 submission
with different levels of sparsity.

Upload to the [cTuning space at Hugging Face](https://huggingface.co/ctuning).

Run MLPerf inference v3.1 with all BERT variations on any platform and submit results to MLPerf inference v3.1.

Read [this documentation](https://github.com/mlcommons/ck/blob/master/docs/mlperf/inference/README.md) 
to run reference implementations of MLPerf inference benchmarks 
using the CM automation language and use them as a base for your developments.

Check [this ACM REP'23 keynote](https://doi.org/10.5281/zenodo.8105339) to learn more about our open-source project and long-term vision.

### Prizes

* *All contributors will receive 1 point for submitting valid results for 1 complete benchmark on one system.*
* *All contributors will receive an official MLCommons Collective Knowledge contributor award (see [this example](https://ctuning.org/awards/ck-award-202307-zhu.pdf)).*


#### Organizers

* [cTuning foundation](https://cTuning.org)
* [cKnowledge Ltd](https://cKnowledge.org)

### Initial discussion and materials

* [ArXiv](https://arxiv.org/abs/2204.09656)
* [Code](https://github.com/WoosukKwon/retraining-free-pruning)

