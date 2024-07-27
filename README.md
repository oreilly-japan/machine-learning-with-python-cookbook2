# Python機械学習 クックブック 第2版

Python機械学習 クックブック 第2版 の内容を実行するための環境とJupyterノートブックです。
このレポジトリをクローンしてください。

環境はDockerfileとして提供しています。この環境を実行するにはDockerが必要です。
Dockerのインストールについては環境によって異なりますので、公式サイトを参照してください。

## コンテナのビルド
まずは、コンテナをビルドします。これにはかなりの時間がかかります。

```bash
> docker  build -t mlwpcb2 .
```

## コンテナの起動

コンテナを起動するには以下のようにします。`-e JUPYTER_TOKEN=token` でJupyterのトークンを設定しています。

```bash
> docker run -it -p 8888:8888 -e JUPYTER_TOKEN=token mlwpcb2
```

これでDockerコンテナの内部にJupyterサーバが起動します。

## Jupyterへのアクセス
ブラウザから`http://localhost:8888` にアクセスしてください。
トークンを求められますので、`token` と入力してください。

