# プログラミング用フォント

日本語プログラミング用フォントを集めてVIM用のPowerLineとNERDのフォントを当てました。紹介するフォントは下記の条件に合うものです。

1. 固定幅フォント
2. ゼロと大文字もオー(0O)、数字の1と大文字のアイと小文字のエル(1Il)の区別がつくこと
3. 日本語を含んでいること

PowerLine、NERDのパッチを当てるとフォント名が"for powerline"や"Nerd font"等が付加されますが、空白を含むと設定がややこしくなるので、オリジナルのままになる様にしています。また、固定幅フォントだけとして、プロポーショナル等はあっても勘違いするだけなので削除しています。
フォント名は下記のように修正しています。

* ファミリーネーム： 単語の最初は大文字、２文字目以降は小文字、空白は削除
* 正式名称： ファミリーネーム＋ダッシュ＋スタイル名(１文字目だけ大文字)
* PostScript名： 正式名称と同じ
* 日本語フォント名は削除

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

* ubuntu desktop: 17.10
* fontforge: 20170921
* NERD Fonts: https://github.com/ryanoasis/nerd-fonts/tree/1.2.0
* UniteTTC http://yozvox.web.fc2.com/556E697465545443.html

```bash
sudo apt install python-fontforge fontforge git
cd
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
git checkout -f v1.2.0

cd
wget http://yozvox.web.fc2.com/unitettc.zip
unzip -o unitettc.zip
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
unzip -o Cica_v2.0.5.zip
unitettc64 Cica.ttc Cica-{Regular,Bold,RegularItalic,BoldItalic}.ttf
mv Cica.ttc ../
```

## CodeM Font
バージョン2016/12/19。行間が通常、やや広め(Wide)、広め(Expanded)の3種類が作られるます。

https://github.com/MasayukiFukada/CodeMFont

### 作成環境

* generate_CodeM.pe  9781a38(2016/12/19)
* SourceCodePro: 2.030R-ro 482adca
* Migu 1M    20150712

### ビルド手順

```bash
cd ~/fonts/Migu1M/src/
unzip -o migu-1m-20150712.zip
cd ~/fonts/CodeM/src
cp ../../Migu1M/src/migu-1m-20150712/migu-*.ttf .
fontforge -script generate_CodeM.pe
cd ~/nerd-fonts/
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/CodeM/src/CodeM-Regular-Expanded.ttf -c
fontforge -script font-patcher ../fonts/CodeM/src/CodeM-Bold-Expanded.ttf -c
fontforge -script font-patcher ../fonts/CodeM/src/CodeM-Regular-Wide.ttf -c
fontforge -script font-patcher ../fonts/CodeM/src/CodeM-Bold-Wide.ttf -c
fontforge -script font-patcher ../fonts/CodeM/src/CodeM-Regular.ttf -c
fontforge -script font-patcher ../fonts/CodeM/src/CodeM-Bold.ttf -c
unitettc64 CodeM.ttc CodeM-{Regular,Bold}.ttf
unitettc64 CodeMWide.ttc CodeMWide-{Regular,Bold}.ttf
unitettc64 CodeMExpanded.ttc CodeMExpanded-{Regular,Bold}.ttf
mv CodeM*.ttc ../fonts/CodeM/
```

## Migu1M
バージョン20150712

http://mix-mplus-ipa.osdn.jp/migu/


### ビルド手順

```bash
cd ~/fonts/Migu1M/src/
unzip -o migu-1m-20150712.zip
cd ~/nerd-fonts/
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/Migu1M/src/migu-1m-20150712/migu-1m-regular.ttf -c
fontforge -script font-patcher ../fonts/Migu1M/src/migu-1m-20150712/migu-1m-bold.ttf -c
unitettc64 Migu1M.ttc Migu1M-{Regular,Bold}.ttf
mv Migu1M.ttc ../fonts/Migu1M/
```

## Myrica
バージョン2.012.20180119。Inconsolata＋源真ゴシック。Monospaceのみ抽出

https://myrica.estable.jp/myricahistry/

### ビルド手順

```bash
cd ~/fonts/Myrica/src
unitettc64 Myrica*.TTC
cd ~/nerd-fonts/
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/Myrica/src/Myrica001.ttf -c
mv Myrica-Book.ttf Myrica.ttf
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
git checkout .
patch -p1 < ~/fonts/tools/font-patcher-myricamm.diff
fontforge -script font-patcher ../fonts/MyricaM/src/MyricaM001.ttf -c
mv MyricaM-Book.ttf MyricaM.ttf
mv MyricaM.ttf ~/fonts/MyricaM/MyricaM.ttf
```

## NasuM
バージョン2014.1215

http://itouhiro.hatenablog.com/entry/20140917/font

### ビルド手順

```bash
cd ~/fonts/NasuM/src
unzip -o NasuFont-20141215.zip
cd ~/nerd-fonts/
git checkout .
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
cd ~/fonts/Migu1M/src/
unzip -o migu-1m-20150712.zip
cd ~/fonts/Ricty/src/
cp ../../Migu1M/src/migu-1m-20150712/migu-*.ttf .
./ricty_generator.sh  -Z 2591 Inconsolata-{Regular,Bold}.ttf migu-1m-{regular,bold}.ttf
cd ~/nerd-fonts
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/Ricty/src/Ricty-Regular.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/Ricty-Bold.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/Ricty-Oblique.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/Ricty-BoldOblique.ttf -c
unitettc64 Ricty.ttc Ricty-{Regular,Bold,Oblique,Bold-Oblique}.ttf
rm Ricty*.ttf
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-Regular.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-Bold.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-Oblique.ttf -c
fontforge -script font-patcher ../fonts/Ricty/src/RictyDiscord-BoldOblique.ttf -c
unitettc64 RictyDiscord.ttc RictyDiscord-{Regular,Bold,Oblique,BoldOblique}.ttf
rm Ricty*.ttf
mv Ricty*.ttc ../fonts/Ricty/
```

## RictyDiminished
バージョン4.1.1。

http://www.rs.tus.ac.jp/yyusa/ricty_diminished.html

### 作成環境

* ubuntu desktop: 17.10
* fontforge: 20170921

### ビルド手順

```bash
cd ~/fonts/Migu1M/src/
unzip -o migu-1m-20150712.zip
cd ~/fonts/CodeM/src
cp ../../Migu1M/src/migu-1m-20150712/migu-*.ttf .
fontforge -script generate_CodeM.pe


cd ~/nerd-fonts
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-Bold.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-Oblique.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminished-BoldOblique.ttf -c
unitettc64 RictyDiminished.ttc RictyDiminished-{Regular,Bold,Oblique,BoldOblique}.ttf
rm Ricty*.ttf
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-Bold.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-Oblique.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished/src/RictyDiminishedDiscord-BoldOblique.ttf -c
unitettc64 RictyDiminishedDiscord.ttc RictyDiminishedDiscord-{Regular,Bold,Oblique,BoldOblique}.ttf
rm Ricty*.ttf
mv RictyDiminished*.ttc ../fonts/RictyDiminished/
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
rm -fr FiraCode RictyDiminished
git clone https://github.com/tonsky/FiraCode.git
ln -s ../../RictyDiminished/src RictyDiminished
make
rm -f Ricty*unlinked.ttf
cd ~/nerd-fonts/
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminished-with-FiraCode-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminished-with-FiraCode-Bold.ttf -c
unitettc64 RictyDiminishedWithFiraCode.ttc RictyDiminishedwithFiraCode-{Regular,Bold}.ttf
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminishedDiscord-with-FiraCode-Regular.ttf -c
fontforge -script font-patcher ../fonts/RictyDiminished-with-FiraCode/src/RictyDiminishedDiscord-with-FiraCode-Bold.ttf -c
unitettc64 RictyDiminishedDiscordWithFiraCode.ttc RictyDiminishedDiscordwithFiraCode-{Regular,Bold}.ttf
rm Ricty*.ttf
mv RictyDiminished*.ttc ../fonts/RictyDiminished-with-FiraCode/
```

## RobotoJ
バージョン2.05(2016-11-05)。RobotoJ Monoを使用。RegularとBoldにNerdのパッチを適用後、フォント名をRobotoJにして、ttcに変化。

https://ja.osdn.net/projects/robotoj-font/

### ビルド手順

```bash
cd ~/fonts/RobotoJ/src
tar -zxvf RobotoJMono_20161105.tar.gz
cd ~/nerd-fonts/
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ~/fonts/RobotoJ/src/RobotoJMono/TTF/RobotoJ-Mono-Regular.ttf -c
fontforge -script font-patcher ~/fonts/RobotoJ/src/RobotoJMono/TTF/RobotoJ-Mono-Bold.ttf -c
unitettc64 RobotoJ.ttc RobotoJ-{Regular,Bold}.ttf
mv RobotoJ.ttc ~/fonts/RobotoJ/
```

## VLGothic
バージョン20141206。等幅のみ。

http://vlgothic.dicey.org

### ビルド手順

```bash
cd ~/fonts/VLGothic/src
unzip -o VLGothic-20141206.zip
cd ~/nerd-fonts/
git checkout .
patch -p1 < ~/fonts/tools/font-patcher.diff
fontforge -script font-patcher ~/fonts/VLGothic/src/VLGothic/VL-Gothic-Regular.ttf -c
mv VLGothic-Regular.ttf VLGothic.ttf
mv VLGothic.ttf ~/fonts/VLGothic/
```

## Tips
OSXでフォントのキャッシュファイルを削除する

```bash
sudo atsutil databases -remove
atsutil server -shutdown
atsutil server -ping
```
