# modelers_log

### プラモデルの制作過程&手順書（レシピ）公開アプリ
<br>


## ・サービス概要
プラモデルの制作手順をカード型のタスクにして管理。<br>
消化中のタスクの内容、進捗状況をwipとしてsnsに投稿できる。<br>
タスク完了後はそのカードが手順書（レシピ）となり、ネットに公開できる
## ・メインのターゲットユーザー
- 20〜50代のSNSを使うプラモデル好き
  - SNSを通じて作品を発信をしたい人
  - SNSでモデラーの情報を収集をしたい人
- 日々の学業や業務により、プラモデル作りにまとまった時間が取れていない
## ・ユーザーが抱える課題
1. 似たような嗜好を持つ仲間と「プラモデルづくり」の楽しさを共有したいが、SNSだけでは物足りない。
    - 制作の過程で工夫した点やそのとき使用したツールを語りたいが、SNSでは文字の制限や写真の枚数制限がある。
    - SNSでフォローしているモデラーの作品を見たときに、その作品に使用したツールやノウハウを知りたくなるが、リプライやDMで聞くのは気が引ける。
    - Twitter等はタイムラインを注視していないとすぐに流れてしまうので、見逃すことがある。
2. 終日プラモデル作りに費やす時間はないので、隙間時間にちょっとづつ作りたいがうまくいってない。
    - 隙間時間を有効活用したいが、作業にかかる時間を細分化、可視化していないので時間の管理ができず、
    キリのいいところで止めることができない。また、それを懸念し作業に取りかかれず、積みプラモになっている。
    - 制作に使用するツール、消耗品、制作手順をその都度メモしていないので、準備の段階で時間がかかってしまう。

## ・解決方法
1. SNSの投稿に興味を持ってもらった人にアプリを通じて自分のタスク、作品を公開する
    - SNSでは書ききれなかったポイント等を見てもらうことができ、それに共感してくれる人と深く繋がれることができる。
    - そこからSNSのフォロワーにアプリに登録してもらうことができれば、以降その人の作品のノウハウを見ることができる。
    - アプリ内ではtwitterのように流れることがなく、ストックされた情報を見ることができる。

2. プラモデルをアプリに登録して、プラモデルの作成をタスク管理する。
    - プラモデルの種類に応じて用意されている、テンプレートタスク（ex. ガンプラ: 体の部位、武器ごとにタスクカードが用意される など）があるので、それに沿って作成すると、簡単にタスク管理表を作れる。
    - タスクカードには自分の普段使っている道具やメモ等を記録できるので、作業に数日の期間が空いてもいちいち思い出す必要がなく、すぐに作業に取り掛かれる。

## ・実装予定の機能
- ### 会員未登録のユーザー
  - 登録済みのユーザーに対して
    - 作ったプロジェクト(作品)の閲覧
    - プロジェクト内のタスクの閲覧
    - プロジェクト、タスクのシェア
- ### 登録済みのユーザー
  - プロジェクト（タスクの入れ物）の作成、編集、削除
  - プロジェクト内でカードタスクの作成、編集、削除
  - 完成後のプロジェクトの編集、SNSでのシェア
  - 他のユーザーに対して、
      - ユーザーをフォロー **(After MVPリリース)**
      - プロジェクトをお気に入り登録 **(After MVPリリース)**
      - プロジェクトのタスクをコピーして自分のタスクに転用 **(After MVPリリース)**
  - お知らせ（通知）
      - 他のユーザーからのフォロー、お気に入り **(After MVPリリース)**
- ### 管理ユーザー
  - 登録者ユーザーの検索、一覧、詳細、編集
  - プロジェクトの検索、一覧、詳細、編集、削除
  - プロジェクト内タスクの一覧、詳細、編集、削除
  - 管理ユーザーの一覧、詳細、作成、編集、削除
<details>
<summary>私はなぜこのサービスを作りたいのか？</summary>
私のような社会人のアマチュアモデラーの課題を解決したかった。<br>
プラモデル作りに対する情熱をぶつけたいが、自分でそれ用のサイトを作ったり、ブログサイトにまとめたりするほどの手間はかけたくない。<br>
クックパッドのように、テンプレートに沿って作業手順を書くと、それが一つのレシピのように成形されて、その中に自分のこだわりをうまく表現できるアプリがあればいいなと思ったのがきっかけ。
</details>


<br>

## ・画面遷移図 : https://www.figma.com/file/HTWQFDq9GtqVvmCUoCfoNW/modelers_log?node-id=0%3A1
## ・ER図： https://gyazo.com/866930335342d01c4c1bf09b140d0d1b
***
## ・スケジュール
企画〜技術調査：6/26〆切 <br>
README〜ER図作成：7/2 〆切 <br>
メイン機能実装：7/2 - 7/24 <br>
β版をRUNTEQ内リリース（MVP）：7/25〆切 <br>
本番リリース：8月末