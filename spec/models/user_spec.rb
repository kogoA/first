require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザテーブルが使用可能チェック" do
    # user = build(:user)
    user = build(:user)
    expect(user).to be_valid    
   end

   it "名前が空の場合エラーとなること" do
    user = User.new(name: "   ",email: "example@test.com")
    expect(user).to_not be_valid    
   end

   it "emailが空の場合エラーとなること" do
    user = User.new(name: "araki",email: "    ")
    expect(user).to_not be_valid    
   end

   it "名前が51文字以上の場合エラーになること" do
    user = build(:user)
    user.name = "a" * 51 
    expect(user).to_not be_valid    
   end

   it "名前が51文字以下の場合エラーにならない" do
    user = build(:user)
    user.name = "a" * 50 
    expect(user).to be_valid    
   end


   it "emailが245文字以上の場合エラーになること" do
    user = build(:user)
    user.email = "a" * 245 + "@yahooo.com"
    expect(user).to_not be_valid    
   end

   it "emailが245文字以下の場合エラーになること" do
    user = build(:user)
    user.email = "a" * 244 + "@yahooo.com"
    expect(user).to be_valid    
   end

   it "有効なメールフォーマットの検証" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    user = build(:user)
    user.email = valid_addresses
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
   end

  #  it "emailアドレスがユニークであること" do
  #   User.create(mail: 'foo@example.com')
  #   user = User.new(mail: 'foo@example.com')
  #   expect(user).not_to be_valid       #include("has already been taken")
  #  end

  it "emailはlower caseで保存されること" do
    user = build(:user, email:"Foo@ExAMPle.CoM")
    user.save
    expect(user.email).to eq "foo@example.com" 
  end



end