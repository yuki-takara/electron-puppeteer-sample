# electron-puppeteer-sample

## インストール方法

```bash
# クローンし、ディレクトリに移動
$ cd /repo/to/path

# ライブラリインストール
$ npm install
```

## 実行方法

```bash
$ npm run start
# => electron ./
```

## Mac用アプリとしてビルドする

### dmg形式

Macで実行するdmg形式としてビルドする  
（ビルド時に signing が実行されているからもしかしたら誰もが実行出来ないかも？）

```bash
$ npm run pack:osx
# => electron-builder --mac --x64

  • electron-builder  version=22.8.0 os=19.6.0
  • loaded configuration  file=package.json ("build" field)
  • description is missed in the package.json  appPackageFile=/Users/yuu/src/github.com/yuki-takara/electron-puppeteer-sample/package.json
  • writing effective config  file=dist/builder-effective-config.yaml
  • packaging       platform=darwin arch=x64 electron=9.2.0 appOutDir=dist/mac
  • default Electron icon is used  reason=application icon is not set
  • signing         file=dist/mac/electron-puppeteer-sample.app identityName=Apple Development: Yuki Takara (xxxxxxx) identityHash=xxxxxxx provisioningProfile=none
```

### app形式

PuppeteerSample.appとしてビルドする  
（この方法だとURLスキーマが設定されない模様）

```bash
$ npm run build
# => electron-packager ./ PuppeteerSample --platform=darwin --arch=x64 --overwrite
```
