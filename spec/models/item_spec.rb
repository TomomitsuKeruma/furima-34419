require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品が成功した時' do

    it "データが全て入力されている場合" do
      expect(@item).to be_valid
    end

    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = 111111
      @item.valid?
      expect(@item).to be_valid
    end
  end  
    
  context '商品出品に失敗した時' do
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
  
    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
  
    it "商品の説明が必須であること" do 
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
  
    it "カテゴリーの情報が必須であること" do
      @item.category_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください", "カテゴリーを入力してください")
    end
  
    it "商品の状態についての情報が必須であること" do
      @item.status_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください", "商品の状態を入力してください")
    end
  
    it "配送料の負担についての情報が必須であること" do
      @item.burden_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料は数値で入力してください", "配送料を入力してください")
    end
  
    it "発送元の地域についての情報が必須であること" do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("地域は数値で入力してください", "地域を入力してください")
    end
  
    it "発送までの日数についての情報が必須であること" do
      @item.days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("日数は数値で入力してください", "日数を入力してください")
    end
  
    it "販売価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください")
    end
  
    it "販売価格は、¥299以下だと保存できないこと" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
    end
    
    it "10,000,000以上では登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
    end

    it "半角英語だけでは登録できないこと" do
      @item.price = "aaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end

    it "全角文字では登録できないこと" do
      @item.price = "１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end

    it "categoryカラムのidが1の場合保存できない" do
      @item.category_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
    end

    it "statusカラムのidが1の場合保存できない" do
      @item.status_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
    end

    it "burdenカラムのidが1の場合保存できない" do
      @item.burden_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料は1以外の値にしてください")
    end

    it "areaカラムのidが1の場合保存できない" do
      @item.area_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("地域は1以外の値にしてください")
    end

    it "daysカラムのidが1の場合保存できない" do
      @item.days_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("日数は1以外の値にしてください")
    end

  end

end