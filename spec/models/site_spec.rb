require 'rails_helper'

RSpec.describe Site, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  #タイトルが無ければ無効
  it "is invalid without a title" do
    site = Site.new(title: '', geom: 'POINT(0 0)')
    #byebug
    expect(site).not_to be_valid
  end

  #タイトルが一意で無ければ無効
  it "is invalid with a deplicate title"  do
     Site.create(title: 'title', geom: 'POINT(0 0)')
     site = Site.new(title: 'title', geom: 'POINT(0 0)')
     site.valid?
     expect(site.errors[:title]).to include('has already been taken')
  end

  #タイトルの長さが100文字より大きければ無効
  it "is invalid with title is 101 or more characters" do
    site = Site.new(title: 'a'*101, geom: 'POINT(0 0)')
    site.valid?
    expect(site.errors[:title]).to include('is too long (maximum is 100 characters)')
  end

  #緯度経度が無ければ無効
  it "is invalid without a geom" do 
    site = Site.new(title: 'title', geom: '')
    expect(site).not_to be_valid
  end

  #所在地の長さが100文字より大きければ無効
  it "is invalid with address is 101 or more characters" do
    site = Site.new(title: 'title', geom: 'POINT(0 0)', address: 'a'*101)
    site.valid?
    expect(site.errors[:address]).to include('is too long (maximum is 100 characters)')
  end
  
  #説明の長さが1000文字より大きければ無効
  it "is invalid with description is 1001 or more characters" do
    site = Site.new(title: 'title', geom: 'POINT(0 0)', description: 'a'*1001)
    site.valid?
    expect(site.errors[:description]).to include('is too long (maximum is 1000 characters)')
  end
  
end