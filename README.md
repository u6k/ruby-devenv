# Ruby開発環境Dockerイメージ _(ruby-devenv)_

[![Travis](https://img.shields.io/travis/u6k/ruby-devenv.svg)](https://travis-ci.org/u6k/ruby-devenv) [![license](https://img.shields.io/github/license/u6k/ruby-devenv.svg)](https://github.com/u6k/ruby-devenv/blob/master/LICENSE) [![GitHub release](https://img.shields.io/github/release/u6k/ruby-devenv.svg)](https://github.com/u6k/ruby-devenv/releases) [![Website](https://img.shields.io/website-up-down-green-red/https/redmine.u6k.me%2Fprojects%2Fruby-devenv?label=u6k.Redmine)](https://redmine.u6k.me/projects/ruby-devenv) [![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Ruby開発環境のDockerイメージ

## Background

PCやスマホなど様々な環境でアプリケーション開発作業を進めたいと考えています。が、各端末に開発環境をセットアップするのはメンドウですし、なるべくホストOSに影響しないようにしたいと考えます。

そこで、当プロジェクトはRuby開発環境をDockerコンテナとして構築します。この開発環境は、次の機能を持ちます。

- vim + 各種プラグインでソースコードを編集できます
- Rubocop、textlint、RedPenなど各種チェックツールでソースコードやドキュメントをチェックできます
- ホストOSのDocker、docker-composeを利用して、アプリケーションのビルド、動作確認を行えます
- Git、git-flow、tigなどのバージョン管理ツールでソースコードやドキュメントを管理できます
- Dockerコンテナなので、ホストOSの種類(Windows、Linux、macOS)によらず同様に動作します

次のことは、この開発環境ではサポートしません。

- 開発サーバーへのssh接続…ホストOSの役割とする
- tmuxなどのスクリーン制御…ホストOSの役割とする

## Install

当リポジトリを`git clone`します。

```
$ git clone git@github.com:u6k/ruby-devenv.git
```

Dockerイメージをビルドします。

```
$ docker build -t ruby-devenv .
```

`ruby-devenv.sh`のリンクをパスが通っているフォルダに配置します。

```
$ ln -s ruby-devenv.sh /usr/local/bin/ruby-devenv.sh
```

## Usage

RubyやRailsのプロジェクト・フォルダで`ruby-devenv.sh`を実行します。`ruby-devenv`コンテナが起動して、`bash`プロンプトが表示されます。

textlintで文書チェックする場合、次のコマンドを実行します。

```
$ textlint --preset ja-technical-writing README.md
```

RedPenで文書チェックする場合、次のコマンドを実行します。

```
$ redpen README.md
```

Rubocopでソースコードをチェックする場合、次のコマンドを実行します。

```
$ rubocop
```

## Maintainer

- u6k
  - [Twitter](https://twitter.com/u6k_yu1)
  - [GitHub](https://github.com/u6k)
  - [Blog](https://blog.u6k.me/)

## Contributing

当プロジェクトに興味を持っていただき、ありがとうございます。[新しいチケットを作成](https://redmine.u6k.me/projects/ruby-devenv/issues)していただくか、プルリクエストをサブミットしていただけると幸いです。

当プロジェクトは、[Contributor Covenant](https://www.contributor-covenant.org/version/1/4/code-of-conduct)に準拠します。

## License

[MIT License](https://github.com/u6k/ruby-devenv/blob/master/LICENSE)
