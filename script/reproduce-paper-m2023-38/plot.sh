#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

echo "Changing to G10 repo: ${CM_GIT_REPO_G10_CHECKOUT_PATH}"
cd "${CM_GIT_REPO_G10_CHECKOUT_PATH}"

cd src/resources

# Collect all the numbers, store it in raw_output/data.json
python3 gatherKernelInfo.py

# Gather data for figure 11
python3 figureDrawingDataPrepOverallPerformance.py  # The gathered data is stored in figure_drawing/overall_performance

# Gather data for figure 12
python3 figureDrawingDataPrepBreakdown.py  # The gathered data is stored in figure_drawing/overall_breakdown

# Gather data for figure 13
./figureDrawingDataPrepKernelCDF.sh  # The gathered data is stored in figure_drawing/overall_slowdown_cdf

# Gather data for figure 14
python3 figureDrawingDataPrepTraffic.py  # The gathered data is stored in figure_drawing/overall_traffic

# Gather data for figure 15
python3 figureDrawingDataPrep.py  # The gathered data is stored in figure_drawing/overall_batchsize

# Gather data for figure 16
python3 figureDrawingDataPrepCPUsensitivity.py  # The gathered data is stored in figure_drawing/sensitivity_cpumem

# Gather data for figure 17
python3 figureDrawingDataPrepCPUSensitivityCombined.py  # The gathered data is stored in figure_drawing/sensitivity_cpumem_combined

# Gather data for figure 18
python3 figureDrawingDataPrepSSD.py  # The gathered data is stored in figure_drawing/sensitivity_ssdbw

# Gather data for figure 19
python3 figureDrawingDataPrepVariation.py  # The gathered data is stored in figure_drawing/sensitivity_variation

cd figure_drawing

# Plot figures for Figure 2-4, and Figure 20-21 (Appendix)

python3 plot_mem_consumption.py  # Figure 2 is output/dnn_memconsumption.pdf

python3 plot_tensor_time_cdf.py  # Figure 3 is output/tensor_time_cdf.pdf

python3 plot_tensor_period_distribution.py  # Figure 4 is output/tensor_periods_distribution.pdf

python3 plot_detail_mem_breakdown_live.py  # Figure 20 is output/dnn_mem_consumption_breakdown_live.pdf

python3 plot_detail_mem_breakdown_active.py  # Figure 21 is output/dnn_mem_consumption_breakdown_active.pdf

# Draw Figure 11
python3 overallPerf.py  # Figure 11 is output/OverallPerfNew.pdf

# Draw Figure 12
python3 overallBreakdown.py  # Figure 12 is output/Breakdown.pdf

# Draw Figure 13
python3 overallSlowdownCDF.py  # Figure 13 is output/KernelTimeCDF.pdf

# Draw Figure 14
python3 overallTraffic.py  # Figure 14 is output/OverallTraffic.pdf

# Draw Figure 15
python3 overallBatchSize.py  # Figure 15 is output/OverallPerfBatchSize.pdf

# Draw Figure 16
python3 sensitivityCPUMem.py  # Figure 16 is output/OverallPerfCPUMem.pdf

# Draw Figure 17
python3 sensitivityCPUMemCombined.py  # Figure 17 is output/OverallPerfCPUMemCombined.pdf

# Draw Figure 18 
python3 sensitivitySSDbw.py  # Figure 18 is output/OverallPerfSSDBW.pdf 

# Draw Figure 19
python3 SensitivityKernelVariation.py # Figure 19 is output/SensitivityVariation.pdf
