# jnsarticle

このリポジトリはTypst でアブストラクト付きのノートを書く時のテンプレートです．
名前はLatexの`jsarticle`みたいなのがTypstにもあればなということで`jsarticle`を意識してのものですが
おそらく`jsarticle`には遠く及ばないのだろうなということと直接の関係がないのに名前被りはよくないだろうということで少しもじりました．
研究の途中で共同研究者等に共有するようなものを想定しています．

## 方針

- シングルカラム
- 様々なスペースをゆったりととる
- jsarticle in Latex の構成で Typst で実現できそうなことがあれば極力取り入れる．

## その他

Appendix環境と参考文献環境を作りました．
環境でよいのかはTypstをよくわからずにとりあえずで作っているのでよくわかりませんが．

## 使用方法

### local package としてインストール

参考：[typst/packages: Packages for Typst.](https://github.com/typst/packages?tab=readme-ov-file#local-packages)

**Windows**
PowerShell で以下を実行してください．
```PowerShell
mkdir -p env:APPDATA/typst/packages/local
cd env:APPDATA/typst/packages/local
git clone git@github.com:kmitsutani/jnsarticle.git jnsarticle
```

**Mac/Linux** シェルで以下を実行してください．
```sh
datadir=${XDG_DATA_HOME:-$HOME/Library/Application Support}
mkdir -p ${datadir}/typst/packages/local
cd ${datadir}/typst/packages/local
git clone git@github.com:kmitsutani/jnsarticle.git jnsarticle
```

## 参考元

[kimushun1101/typst-jp-conf-template](https://github.com/kimushun1101/typst-jp-conf-template)
もともとこのリポジトリをフォークしていましたが，目的が異なることもありPRを投げたりするつもりはないので独立したリポジトリとして作成し直しました．
ただしMITライセンスに関しては引き継ぎます．

## ライセンス

参考元にならってライセンスを付与しています．  
Typst ファイル : MIT No Attribution  
CSL ファイル : Creative Commons Attribution-ShareAlike 3.0 License
