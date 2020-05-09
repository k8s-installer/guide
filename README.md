# k8s-installer: Install guide

Install guide for [k8s-installer](https://github.com/k8s-installer/k8s-installer)

## How to build html and pdf

You need ruby.

First, install asciidoctor, asciidoctor-pdf, etc.

    $ bundle install --system

Download fonts for PDF:

    $ make download-font

Generate html:

    $ make

Generate pdf:

    $ make pdf
