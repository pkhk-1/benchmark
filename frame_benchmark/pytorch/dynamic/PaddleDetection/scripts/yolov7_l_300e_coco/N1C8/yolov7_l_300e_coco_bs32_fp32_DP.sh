model_item=yolov5_l_300e_coco
bs_item=32
fp_item=fp32
run_process_type=MultiP
run_mode=DP
device_num=N1C8
max_epochs=12
num_workers=4

sed -i '/set\ -xe/d' run_benchmark.sh
bash PrepareEnv.sh;
bash run_benchmark.sh ${model_item} ${bs_item} ${fp_item} ${run_process_type} ${run_mode} ${device_num} ${max_epochs} ${num_workers} 2>&1;