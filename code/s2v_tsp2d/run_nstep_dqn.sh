#!/bin/bash

g_type=vrp

result_root=results/dqn-$g_type

# max belief propagation iteration
max_bp_iter=8

# embedding size
embed_dim=1024

# gpu card id
dev_id=1

# max batch size for training/testing
batch_size=64

net_type=QNet
decay=0.1

# set reg_hidden=0 to make a linear regression
reg_hidden=32

# learning rate
learning_rate=0.001

# init weights with rand normal(0, w_scale)
w_scale=0.01

# nstep
n_step=20

knn=10

min_n=101
#actual number of nodes(+depot)
#20+1=21
max_n=101

num_env=1
mem_size=100000

max_iter=200000

# folder to save the trained model
save_dir=$result_root/ntype-$net_type-embed-$embed_dim-nbp-$max_bp_iter-rh-$reg_hidden

if [ ! -e $save_dir ];
then
    mkdir -p $save_dir
fi

python main.py \
    -net_type $net_type \
    -n_step $n_step \
    -data_root ../../data/vrp \
    -decay $decay \
    -knn $knn \
    -min_n $min_n \
    -max_n $max_n \
    -num_env $num_env \
    -max_iter $max_iter \
    -mem_size $mem_size \
    -g_type $g_type \
    -learning_rate $learning_rate \
    -max_bp_iter $max_bp_iter \
    -net_type $net_type \
    -max_iter $max_iter \
    -save_dir $save_dir \
    -embed_dim $embed_dim \
    -batch_size $batch_size \
    -reg_hidden $reg_hidden \
    -momentum 0.9 \
    -l2 0.00 \
    -w_scale $w_scale \
    2>&1 | tee $save_dir/log-$min_n-${max_n}.txt
