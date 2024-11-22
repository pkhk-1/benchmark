# Copyright (c) 2024 PaddlePaddle Authors. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

rm -rf llava_bench_data.tar
rm -rf /root/.paddlemix/datasets/llava_bench_data
# dataset
wget https://paddlenlp.bj.bcebos.com/models/community/paddlemix/benchmark/llava_bench_data.tar
tar -xf llava_bench_data.tar
mv llava_bench_data /root/.paddlemix/datasets/
rm -rf llava_bench_data.tar
ln -s /root/.paddlemix/datasets/llava_bench_data ./

#model
wget https://paddlenlp.bj.bcebos.com/models/community/paddlemix/llava_torch/models--lmsys--vicuna-13b-v1.5.tar
wget https://paddlenlp.bj.bcebos.com/models/community/paddlemix/llava_torch/models--lmsys--vicuna-7b-v1.5.tar
wget https://paddlenlp.bj.bcebos.com/models/community/paddlemix/llava_torch/models--liuhaotian--llava-v1.6-vicuna-13b.tar
wget https://paddlenlp.bj.bcebos.com/models/community/paddlemix/llava_torch/models--liuhaotian--llava-v1.6-vicuna-7b.tar
tar -xf models--lmsys--vicuna-13b-v1.5.tar
tar -xf models--lmsys--vicuna-7b-v1.5.tar
tar -xf models--liuhaotian--llava-v1.6-vicuna-7b.tar
tar -xf models--liuhaotian--llava-v1.6-vicuna-13b.tar
rm -rf models--lmsys--vicuna-13b-v1.5.tar
rm -rf models--lmsys--vicuna-7b-v1.5.tar
rm -rf models--liuhaotian--llava-v1.6-vicuna-7b.tar
rm -rf models--liuhaotian--llava-v1.6-vicuna-13b.tar

export http_proxy=agent.baidu.com:8188
export https_proxy=agent.baidu.com:8188

export PYTHONPATH=$(dirname "$PWD"):$PYTHONPATH
python -m pip install --upgrade pip -i https://mirror.baidu.com/pypi/simple
python -m pip install einops -i https://mirror.baidu.com/pypi/simple
python -m pip install -r requirements.txt
pip install flash-attn --no-build-isolation

