# README

# アプリ名 #
Site Information Tool (現場情報共有ツール v2)  

# URL #
https://smooth-running2.org

# 画面イメージ #
![無題](https://user-images.githubusercontent.com/76857613/162597504-53994cf4-1a41-482c-bb80-720d5b45009b.png)

# 概要 #
記録したい場所を地図ベースで登録し、気づきなどを蓄積・共有

# 機能一覧 #
- 地図上で位置を指定することで現場情報を作成	
- 地図上から現場情報の参照、編集、削除
- 現場情報をグループ内で共有し、コメントや画像の追加

# 利用技術 #
- (backend) Ruby 2.7.5, Rails 6.0.4, AmazonRDS（MySQL）, Nginx, Unicorn
- (front) jQuery, GoogleMapAPI

# デプロイ先
- AWS (EC2, S3, RDS, ELB+ACM)
- 動作環境/構成　（構築コードリポジトリ）https://github.com/tshima2/smr2_iac.git
