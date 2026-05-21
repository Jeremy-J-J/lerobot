# LeRobot 中文项目说明

这是一个基于 LeRobot 的机器人学习项目代码仓库，主要用于真实机器人和仿真环境中的模仿学习、强化学习、数据集处理、模型训练与评估。

本仓库只管理源码、配置、文档和测试代码。训练输出、中间文件、缓存文件、模型权重和媒体素材已通过 `.gitignore` 排除，避免 Git 仓库体积过大。

## 项目内容

- `src/lerobot/`：核心 Python 包，包含机器人、相机、数据集、策略模型、训练与评估工具。
- `examples/`：数据集读取、训练、评估、遥操作等示例脚本。
- `tests/`：单元测试和集成测试。
- `docs/`：项目文档源码。
- `docker/`：容器环境配置。
- `benchmarks/`：性能测试脚本。
- `requirements-ubuntu.txt` / `requirements-macos.txt`：不同系统的依赖列表。
- `pyproject.toml`：Python 项目配置。

## 环境准备

建议使用 Python 3.10 以上版本。

```bash
conda create -y -n lerobot python=3.10
conda activate lerobot
```

安装 `ffmpeg`：

```bash
conda install ffmpeg -c conda-forge
```

安装项目：

```bash
pip install -e .
```

如果需要在 Ubuntu 上安装完整依赖，可以使用：

```bash
pip install -r requirements-ubuntu.txt
```

如果需要在 macOS 上安装完整依赖，可以使用：

```bash
pip install -r requirements-macos.txt
```

## 常用命令

查看数据集信息：

```bash
lerobot-info --help
```

可视化数据集：

```bash
lerobot-dataset-viz --help
```

训练策略模型：

```bash
lerobot-train --help
```

评估策略模型：

```bash
lerobot-eval --help
```

查找相机：

```bash
lerobot-find-cameras
```

遥操作机器人：

```bash
lerobot-teleoperate --help
```

也可以直接参考仓库根目录下的脚本：

```bash
./run_train_act.sh
./run_eval.sh
./run_replay_dataset.sh
./run_get_datasets.sh
```

## 数据、输出与模型文件

以下内容不会纳入 Git 管理：

- `output/`
- `outputs/`
- `data/`
- `downloads/`
- `wandb/`
- `logs/`
- `tmp/`
- `media/`
- Python 缓存和测试缓存
- 模型权重与检查点文件，例如 `*.safetensors`、`*.pt`、`*.pth`、`*.ckpt`、`*.onnx`、`*.bin`

如需保存训练结果或模型权重，请放在上述目录中，或使用外部存储、对象存储、Hugging Face Hub 等方式管理。

## Git 管理说明

当前仓库只追踪轻量文件，适合推送到 GitHub：

- Git 管理的文件总大小控制在 6M 以内。
- `.gitignore` 已排除训练产物、临时文件、缓存、模型权重和大媒体文件。
- 不包含原始目录 `lerobot-main` 中的 `.git` 信息。

提交前可以用以下命令检查 Git 管理文件大小：

```bash
git ls-files -z | du -cb --files0-from=- | tail -n 1
```

检查是否有大文件被误纳入 Git：

```bash
git ls-files | grep -E '(^output/|^outputs/|^media/|\.safetensors$|\.pt$|\.pth$|\.ckpt$|\.onnx$|\.bin$)'
```

如果第二条命令没有输出，说明这些大文件没有被 Git 跟踪。

## 快速开始建议

1. 创建并激活 Python 环境。
2. 安装项目依赖。
3. 使用示例脚本确认数据集、相机或机器人连接正常。
4. 将训练输出放到 `output/` 或 `outputs/`。
5. 提交前检查 Git 管理文件大小，确认没有误提交权重或中间文件。
