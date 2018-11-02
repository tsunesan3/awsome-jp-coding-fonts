# フォント生成用ansible playbook

## 使い方

ansibleをインストールする

```
sudo apt install ansible-playbook
```

あとは、すべてansibleがやってくれる。

```
ansible-playbook makefonts.yml -K --tags base,font-name
```

* tags
     * base: 基本ソフトのインストール
     * Cica等のフォント名: 特定のフォントのみ生成。フォントのみしている場合は、-Kは不要
