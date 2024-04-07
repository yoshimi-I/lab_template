<div align="center">

<samp>

# python research environment

**Welcome to python research environment!!**

</samp>

</div>

## 概要
こちらは研究で使うpythonの環境になっております

## ディレクトリ構成
```md
.
│
├── .devcontainer/            # Devcontainer設定ファイル
│   └── devcontainer.json     # VS CodeのDevcontainer設定
│
├── .github/                  # GitHub Actions CI/CDワークフロー
│   └── workflows/            # CI/CDの定義ファイル
│       └── main.yml
│
├── data/                     # データセット
│   ├── raw/                  # 生データ
│   ├── processed/            # 前処理済みデータ
│   └── .dvc/                 # DVC管理ファイル
│
├── models/                   # 訓練済みモデルやモデルのアーティファクト
│
├── notebooks/                # Jupyterノートブック
│
├── src/                      # ソースコード
│   ├── __init__.py
│   ├── data_preparation.py   # データ前処理スクリプト
│   ├── train_model.py        # モデル訓練スクリプト
│   └── evaluate_model.py     # モデル評価スクリプト
│
├── tests/                    # テストコード
│   ├── __init__.py
│   └── test_data_preparation.py
│
├── Dockerfile                # Dockerコンテナ設定ファイル
├── Makefile                  # Makeコマンド定義ファイル
├── .env                      # 環境変数ファイル
├── .ruff.toml                # Ruff設定ファイル
├── requirements.txt          # Python依存関係リスト
└── README.md                 # プロジェクト説明書

```
