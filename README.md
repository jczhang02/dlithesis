---

<div align="center">

# DliThesis

</div>

该宏包旨在建立一个简单易用的大连理工大学莱斯特国际学院学位论文（设计）LaTeX 模板。

## 声明

使用 GNU General Public License v3.0 授权。

该宏包由我个人维护，不保证该模板可以完美适应您的需要。
因此产生的任何问题由您个人承担。

## 如何使用

文件结构如下图所示：

```bash
├── README.md
├── body
│   ├── abstract.tex
│   ├── acknowledgement.tex
│   ├── appendix.tex
│   ├── chapter1.tex
│   ├── preamble.tex
│   ├── ref.bib
│   └── revision.tex
├── build
├── dlithesis.cls
├── figures
│   └── transformer1.png
├── fonts
│   └── STXingKai.TTF
├── latexmkrc
└── thesis.tex
```

其中 `README.md` 即为本说明文档，在确保您已经认真完整的阅读完本说明文档且清楚使用方法后，可以直接删除（自然，也可以保留该文件，该文件存在与否不会影响编译和编写）。

`thesis.tex` 为主文件，其中引用了 `body` 文件里的 `tex` 子文件。

需注意的是，`body/ref.bib` 文件用来放置您的参考文献 `bib` 列表，`figures` 文件夹用来放置您要在论文中插入的图片。

## 如何编译

建议下载和安装最新版本的 `texlive`，并需要 `XeLaTeX` 进行编译。

建议使用 `latexmkrc` 编译，具体教程请自行搜寻。

## 问题与联系

如果您使用模板时有任何问题，请通过如下方式联系我：

- e-mail: [jczhang@live.it](mailto:jczhang@live.it).
