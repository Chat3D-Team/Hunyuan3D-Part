uv pip install torch==2.4.0 torchvision==0.19.0 --index-url https://download.pytorch.org/whl/cu121


git clone https://github.com/facebookresearch/sonata
cd sonata
export CUDA_VERSION=121
export TORCH_VERSION=2.4.0
uv pip install spconv-cu${CUDA_VERSION}
uv pip install torch-scatter -f "https://data.pyg.org/whl/torch-${TORCH_VERSION}+cu${CUDA_VERSION}.html" 
uv pip install setuptools psutil
uv pip install git+https://github.com/Dao-AILab/flash-attention.git --no-build-isolation
uv pip install huggingface_hub timm

# (optional, or directly copy the sonata folder to your project)
uv run python setup.py install


cd ..

uv pip install viser fpsample trimesh numba gradio
cd utils/chamfer3D
sudo apt update
sudo apt install gcc-12 g++-12 -y
export CC=/usr/bin/gcc-12
export CXX=/usr/bin/g++-12
export NVCC_APPEND_FLAGS="-allow-unsupported-compiler"
# uv run python setup.py install
uv pip install . --no-build-isolation
cd ../..

uv pip install scikit-learn addict omegaconf

# export HF_HOME="/home/ubuntu/.cache/huggingface"
# Dans model.py
# # self.sonata = sonata.load("sonata", repo_id="facebook/sonata", download_root='/root/sonata')
# self.sonata = sonata.load("sonata", repo_id="facebook/sonata", download_root='~/.cache/sonata')


# # ckpt_path = hf_hub_download(repo_id="tencent/Hunyuan3D-Part", filename="p3sam/p3sam.safetensors", local_dir=os.path.join(os.path.expanduser('~'), '/.cache/p3sam/weights'))
# ckpt_path = hf_hub_download(repo_id="tencent/Hunyuan3D-Part", filename="p3sam/p3sam.safetensors", local_dir=os.path.join(os.path.expanduser('~'), '.cache/p3sam/weights'))

