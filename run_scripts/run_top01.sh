#  CUDA_VISIBLE_DEVICES=0 \
python method_tvr/train.py \
    --model_name ReLoCLNet \
    --model_config_path ./configs/ReLoCLNet.yaml \
    --dset_name TVR-Ranking \
    --eval_split_name val \
    --nms_thd -1 \
    --results_root results/tvr_ranking \
    --train_path data/TVR_Ranking/train_top01.jsonl \
    --val_path data/TVR_Ranking/val.jsonl \
    --test_path data/TVR_Ranking/test.jsonl \
    --clip_length 1.5 \
    --vid_feat_size 1024 \
    --ctx_mode video_sub_tef \
    --no_norm_vfeat \
    --max_pred_l 16\
    --sub_feat_size 768\
    --video_duration_idx_path ./data/common_data/video_name_duration_id.json \
    --desc_bert_path ./data/common_data/query_bert.h5 \
    --vid_feat_path PATH/TVR/TVR_feature/video_feature/tvr_i3d_rgb600_avg_cl-1.5.h5 \
    --sub_bert_path PATH/TVR/TVR_feature/bert_feature/sub_query/tvr_sub_pretrained_w_sub_query_max_cl-1.5.h5\
    --eval_num_per_epoch 0.1 \
    --n_epoch 1000 \
    --exp_id top01
    # qsub -I -l select=1:ngpus=1 -P gs_slab -q slab_gpu8
    # cd 11_TVR-Ranking/ReLoCLNet/; conda activate py11; sh run_top01.sh 