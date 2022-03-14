#   Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
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

from common_import import *


class MatrixRankConfig(APIConfig):
    def __init__(self):
        super(MatrixRankConfig, self).__init__("matrix_rank")
        self.feed_spec = [{"range": [-1, 1]}]


class PaddleMatrixRank(PaddleDynamicAPIBenchmarkBase):
    def build_graph(self, config):
        x = self.variable(name='x', shape=config.x_shape, dtype=config.x_dtype)
        result = paddle.linalg.matrix_rank(
            x=x, tol=config.tol, hermitian=config.hermitian)
        self.feed_list = [x]
        self.fetch_list = [result]


class TorchMatrixRank(PytorchAPIBenchmarkBase):
    def build_graph(self, config):
        x = self.variable(name='x', shape=config.x_shape, dtype=config.x_dtype)
        result = torch.linalg.matrix_rank(
            input=x, tol=config.tol, hermitian=config.hermitian)
        self.feed_list = [x]
        self.fetch_list = [result]


if __name__ == '__main__':
    test_main(
        pd_dy_obj=PaddleMatrixRank(),
        torch_obj=TorchMatrixRank(),
        config=MatrixRankConfig())