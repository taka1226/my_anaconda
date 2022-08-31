### インストール

1. イメージ作成
```bash
docker build ./ -t my_anaconda
```

2. コンテナ作成
```bash
docker run --gpus all --name machine_learning -d -it -p 8888:8888 -p 22:22 -v ${PWD}:/root/work my_anaconda
```

3. Anaconda のインストールシェル を実行。https://www.anaconda.com/products/distribution のlinux のところからシェルスクリプトをダウンロードしてくる

4. `pip install tensorflow-gpu`


以下は anaconda を使用する場合  
5. jupyter notebook --generate-config で config ファイルを作成

6. 作成された $HOME/.jupyter/jupyter_notebook_config.py に `c.NotebookApp.ip = '0.0.0.0'` を追加
