# インストール
## Android Studio 
https://developer.android.com/studio?hl=ja

- インストーラー
- 不足している SDK を Android Studio > SDK Manager でインストール
- Emulator

## Flutter SDK
https://docs.flutter.dev/get-started/install/windows

- 環境パスの設定
- VSCodeプラグイン

### 診断
```bash
flutter doctor
```

##### Android toolchain
- 使用許諾
- すべて y で答える

```bash
flutter doctor --android-licenses
```

### パッケージインストール
```bash
flutter pub get
```

### Build
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 起動
1. Android Studio でエミュレータ起動
2. VSCodeで Flutter 起動

```bash
flutter run
```