# coding: utf-8
# CarrierWaveの設定呼び出し
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 保存先の分岐
CarrierWave.configure do |config|
  if Rails.env.production? # 本番環境:AWS使用
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: 'ap-northeast-1',
      path_style: true
    }
    #config.fog_public  = true
    config.fog_public  = false
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
    config.fog_directory  = ENV["SMR2_APP_BUCKET_NAME"]
    config.asset_host = ENV["SMR2_APP_BUCKET_HOST"]
  else
    config.storage :file # 開発環境:public/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end  
end
