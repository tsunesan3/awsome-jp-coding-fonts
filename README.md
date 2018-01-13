# プログラミング用フォント

日本語プログラミング用フォントを集めてVIM用のPowerLineとNERDのフォントを当てました。
PowerLine、NERDのパッチを当てるとフォント名が"for powerline"や"Nerd font"等が
付加されますが、空白を含むと設定がややこしくなるので、オリジナルのままになる様に
しています。また、固定幅フォントだけとして、プロポーショナル等はあっても
勘違いするだけなので削除しています。

|フォント名|英数字|日本語|半角:全角|JIS漢字コード|ライセンス|
|----------|------|------|------------|-------------|----------|
|Ricty|inconsolata|Migu 1M(M+フォント、IPAゴシック)|1:2|第四まで|OFL,IPA|
|Ricty Diminished|inconsolata|Circle M+ 1m(M+フォント)|1:2|第二の一部まで|OFL|
|Ricty Diminished with FiraCode|inconsolata|Circle M+ 1m(M+フォント)|1:2|第二の一部まで|OFL?|
|Myrica|inconsolata|源真ゴシック(源ノ角ゴシック)|1:2|第四まで|OFL|
|MyricaM|inconsolata|Mgen+(M+フォント、源ノ角ゴシック)|1:2|第四まで|OFL|
|Source Han Code JP|Source Code Pro|源ノ角ゴシック|2:3|第四まで|OFL|
|Cica|Ubuntu Mono|Rounded Mgen+ (M+フォント、源ノ角ゴシックの丸ゴ)|1:2|第四まで|OFL|

## 共通の作成環境

* NERD Fonts: https://github.com/ryanoasis/nerd-fonts/tree/1.2.0
* UniteTTC http://yozvox.web.fc2.com/556E697465545443.html
* ubuntu desktop: 17.10
* fontforge: 20170921

```bash
cd
git clone https://github.com/ryanoasis/nerd-fonts.git
git checkout 1.2.0

wget http://yozvox.web.fc2.com/unitettc.zip
unzip unitettc.zip
chmod 755 unitettc/unitettc64
sudo mv unitettc/unitettc64 /usr/local/bin/

git clone https://github.com/tsunesan3/fonts.git
```

## Ricty
バージョン4.1.1。空白文字はunicodeの2591 (░)に変更。
レギュラー、ボールド、オブリーク、ボールドオブリークはttcにて一つのフォントにしてます。
OSXにインストールするとフォントの検証中に"nameテーブルの使用性"の問題が見つかりますが、
使用に問題ないのでそのまままインストールしてください。

http://www.rs.tus.ac.jp/yyusa/ricty.html

### 作成環境

* ricty_generator.sh  4.1.1
* inconsolata: v2.001 efcbdc5
* Migu 1M    20150712

### ビルド手順

```bash
cd ~/fonts/Ricty/src/
./ricty_generator.sh  -Z 2591 Inconsolata-{Regular,Bold}.ttf migu-1m-{regular,bold}.ttf
cd ~/nerd-fonts
git checkout -f v1.2.0
patch -p1 < ~/fonts/tools/font-patcher.diff

fontforge -script font-patcher ../fonts/Ricty/src/Ricty-Regular.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/Ricty-Bold.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/Ricty-Oblique.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/Ricty-BoldOblique.ttf -c
unitettc64 ../fonts/Ricty/Ricty.ttc Ricty{Regular,Bold,Oblique,BoldOblique}.ttf
rm Ricty*.ttf
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-Regular.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-Bold.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-Oblique.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-BoldOblique.ttf -c
unitettc64 ../fonts/Ricty/RictyDiscord.ttc RictyDiscord{Regular,Bold,Oblique,BoldOblique}.ttf
rm Ricty*.ttf
```

## RictyDiminished
バージョン4.1.1。

http://www.rs.tus.ac.jp/yyusa/ricty_diminished.html

### 作成環境

* ubuntu desktop: 17.10
* fontforge: 20170921

### ビルド手順

```bash
cd ~/nerd-fonts
git checkout -f v1.2.0
patch -p1 < ~/fonts/tools/font-patcher.diff

fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-Bold.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-Oblique.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-BoldOblique.ttf -c
unitettc64 ../fonts/RictyDiminished/RictyDiminished.ttc RictyDiminished{Regular,Bold,Oblique,BoldOblique}.ttf
rm Ricty*.ttf
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-Bold.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-Oblique.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-BoldOblique.ttf -c
unitettc64 ../fonts/RictyDiminished/RictyDiminishedDiscord.ttc RictyDiminishedDiscord{Regular,Bold,Oblique,BoldOblique}.ttf
rm Ricty*.ttf
```

## RictyDiminished with FiraCode
バージョン0.0.1。==などをFira Codeの合字にしたもの。

PowerLineの文字の挿入は最初からされているはずですが、当方の環境では文字が崩れたことと、
Nerd Font等のために改めてパッチを当ててます。

http://slides.com/hakatashi/ricty-fira-code#/16

### 作成環境

* RictyDiminished: 4.1.1
* Fira Code e68b88d

### ビルド手順

```bash
cd ~/fonts/RictyDiminished-with-FiraCode/src
git clone https://github.com/tonsky/FiraCode.git
ln -s ../../RictyDiminished/src RictyDiminished
make
rm -f Ricty*unlinked.ttf
cd ~/nerd-fonts/
git checkout -f v1.2.0
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminished-with-FiraCode-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminished-with-FiraCode-Bold.ttf -c
unitettc64 ../fonts/RictyDiminished-with-FiraCode/RictyDiminishedWithFiraCode.ttc RictyDiminishedwithFiraCode{Regular,Bold}.ttf
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminishedDiscord-with-FiraCode-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminishedDiscord-with-FiraCode-Bold.ttf -c
unitettc64 ../fonts/RictyDiminished-with-FiraCode/RictyDiminishedDiscordWithFiraCode.ttc RictyDiminishedDiscordwithFiraCode{Regular,Bold}.ttf
rm Ricty*.ttf
```

## Myrica
バージョン2.010.20160103。

https://myrica.estable.jp/myricahistry/

### ビルド手順

```bash
cd ~/fonts/Myrica/src
unitettc64 Myrica*.TTC
cd ~/nerd-fonts/
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/Myrica/src/Myrica001.ttf -c
mv Myrica.ttf ~/fonts/Myrica/Myrica.ttf
```


## MyricaM
バージョン2.011.20160403。Monospaceのみ抽出

https://myrica.estable.jp/myricamhistry/

### ビルド手順

```bash
cd ~/fonts/MyricaM/src
unitettc64 Myrica*.TTC
cd ~/nerd-fonts/
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/MyricaM/src/MyricaM001.ttf -c
mv MyricaM.ttf ~/fonts/MyricaM/MyricaM.ttf
```

## Cica
バージョン2.0.5。NERD FontやPowerLineのフォントが最初から適用されいるので、
4つのファイルをttcに変換だけ実施。

https://tmnm.tech/2017/10/14/cica-v-204/


### ビルド手順

```bash
cd ~/fonts/Cica/src
unzip Cica_v2.0.5.zip
unitettc64 Cica.ttc Cica-{Regular,Bold,RegularItalic,BoldItalic}.ttf
mv Cica.ttc ../
```
