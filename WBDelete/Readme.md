# WBDelete

Output the command to delete old backups of Windows Server

## Prompt

指定した日付（Version）より古いバックアップを全て削除する方法を教えてください。

指定した日付（Version）より古いバックアップを全て削除するには、以下の手順を試してみてください：

検索ボックスに「cmd」と入力し、「管理者として実行」を選択します。

コマンドプロンプトウィンドウで以下のコマンドを入力します：

```sh
wbadmin delete backup -keepVersions:0 -backupTarget:D: -machine:<コンピューター名>
```

例えば、 2023/12/31 より古いバックアップを削除する場合は、どの様に入力しますか？

```sh
wbadmin get versions -backupTarget:D: -machine:<コンピューター名>
```

```sh
wbadmin delete backup -version:<バージョン識別子> -backupTarget:D:
```

```sh
wbadmin delete backup -version:12/30/2023-12:00 -backupTarget:D:
```

順調に古いバックアップを削除できることを確認しています。これをスクリプトで実行するときに、「バックアップを削除しますか？」との確認無しで、削除する方法を教えてください。

バックアップを削除する際の確認メッセージをスキップする方法があります。wbadminコマンドで「バックアップを削除しますか？」という確認なしで削除を実行するには、以下のようにスクリプトに /quiet オプションを追加します。

例えば、2023年12月30日のバックアップを削除する場合、以下のコマンドを使用します：

```sh
wbadmin delete backup -version:12/30/2023-12:00 -backupTarget:D: /quiet
```

バッチファイルコマンドスクリプトを年月を指定するだけで、指定パラメータに従って自動作成するを作成してください。呼び出し形式は例えば、WBDelete.cmd 09-2023 とすると、2023年9月のバックアップを削除するスクリプトを以下の様に出力します。時刻やドライブ名、マシン名は固定です。カレンダーの大の付き小の月の最終日は'31' 固定で問題ありません。 例えば、10-2023の出力結果は以下を想定しています。
```
wbadmin delete backup -version:10/01/2023-22:00 -backupTarget:G: -machine:vivian -quiet
wbadmin delete backup -version:10/02/2023-22:00 -backupTarget:G: -machine:vivian -quiet
wbadmin delete backup -version:10/03/2023-22:00 -backupTarget:G: -machine:vivian -quiet
wbadmin delete backup -version:10/04/2023-22:00 -backupTarget:G: -machine:vivian -quiet
（以下略）
```
 可能でしょうか？このスクリプト出力の件で疑問点があれば、作業前に何でも聞いて確認してください。

もちろんです。指定した年月のバックアップを削除するバッチファイルのスクリプトを自動生成する方法をお手伝いします。

以下は指定された年月（例：09-2023）のバックアップを削除するバッチファイルスクリプトです：

