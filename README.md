# プログラミング用フォント

日本語プログラミング用フォントを集めてVIM用のPowerLineとNERDのフォントを当てました。
紹介するフォントは下記の条件に合うものです。

1. 固定幅フォント
2. ゼロと大文字もオー(0O)、数字の1と大文字のアイと小文字のエル(1Il)の区別がつくこと
3. 日本語を含んでいること

PowerLine、NERDのパッチを当てるとフォント名が"for powerline"や"Nerd font"等が付加されますが、空白を含むと設定がややこしくなるので、オリジナルのままになる様にしています。また、固定幅フォントだけとして、プロポーショナル等はあっても勘違いするだけなので削除しています。

|フォント名|英数字|日本語|半角:全角|JIS漢字コード|ライセンス|
|----------|------|------|------------|-------------|----------|
|Cica|Ubuntu Mono|Rounded Mgen+ (M+フォント、源ノ角ゴシックの丸ゴ)|1:2|第四まで|OFL|
|CodeM Font|Source Code Pro|Migu 1M(M+フォント、IPAゴシック)|不定|第二の一部まで|OFL|
|Migu 1M|M+フォント|Migu 1M(M+フォント、IPAゴシック)|1:2|第四まで|M+,IPA|
|Myrica|inconsolata|源真ゴシック(源ノ角ゴシック)|1:2|第四まで|OFL|
|MyricaM|inconsolata|Mgen+(M+フォント、源ノ角ゴシック)|1:2|第四まで|OFL|
|NasuM|Source Code Pro|源真ゴシック(源ノ角ゴシック)|1:2|第四まで|Apache|
|Ricty|inconsolata|Migu 1M(M+フォント、IPAゴシック)|1:2|第四まで|OFL,IPA|
|Ricty Diminished|inconsolata|Circle M+ 1m(M+フォント)|1:2|第二の一部まで|OFL|
|Ricty Diminished with FiraCode|inconsolata|Circle M+ 1m(M+フォント)|1:2|第二の一部まで|OFL?|
|RobotoJ|Roboto Mono|モトヤLシーダ3等幅、源真ゴシック、Migu、M+フォント|1:2|第四まで|Apache|
|Source Han Code JP|Source Code Pro|源ノ角ゴシック|2:3|第四まで|OFL|
|VLゴシック|M+フォント|M+フォント、さざなみ|1:2|第二の一部まで|M+,BSD|

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

git clone https://github.com/tsunesan3/awsome-jp-coding-fonts.git fonts
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

## CodeM Font
バージョン2016/12/19

https://github.com/MasayukiFukada/CodeMFont

### 作成環境

* generate_CodeM.pe  9781a38(2016/12/19)
* SourceCodePro: 2.030R-ro 482adca
* Migu 1M    20150712


## Migu1M
バージョン20150712

http://mix-mplus-ipa.osdn.jp/migu/


## Myrica
バージョン2.012.20180119。Inconsolata＋源真ゴシック。Monospaceのみ抽出

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
バージョン2.012.20180119。Inconsolata＋Mgen+。Monospaceのみ抽出

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

## NasuM
バージョン2014.1215

http://itouhiro.hatenablog.com/entry/20140917/font

### ビルド手順

```bash
cd ~/fonts/NasuM/src
unzip NasuFont-20141215.zip
cd ~/nerd-fonts/
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ~/fonts/NasuM/src/NasuFont20141215/NasuM-Regular-20141215.ttf -c
fontforge -script font-patcher ~/fonts/NasuM/src/NasuFont20141215/NasuM-Bold-20141215.ttf -c
unitettc64 NasuM.ttc NasuM{Regular,Bold}.ttf
mv NasuM.ttc ~/fonts/NasuM/
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

## RobotoJ
バージョン2.05(2016-11-05)。RobotoJ Monoを使用。RegularとBoldにNerdのパッチを適用後、フォント名をRobotoJにして、ttcに変化。

https://ja.osdn.net/projects/robotoj-font/

### ビルド手順

```bash
cd ~/fonts/RobotoJ/src
tar -zxvf RobotoJMono_20161105.tar.gz
cd ~/nerd-fonts/
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ~/fonts/RobotoJ/src/RobotoJMono/TTF/RobotoJ-Mono-Regular.ttf -c
fontforge -script font-patcher ~/fonts/RobotoJ/src/RobotoJMono/TTF/RobotoJ-Mono-Bold.ttf -c
unitettc64 RobotoJ.ttc RobotoJ{Regular,Bold}.ttf
mv RobotoJ.ttc ~/fonts/RobotoJ/
```

## VLGothic
バージョン20141206。等幅のみ。

http://vlgothic.dicey.org

### ビルド手順

```bash
cd ~/fonts/VLGothic/src
unzip VLGothic-20141206.zip
cd ~/nerd-fonts/
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ~/fonts/VLGothic/src/VLGothic/VL-Gothic-Regular.ttf -c
mv VLGothic.ttf ~/fonts/VLGothic/
```
