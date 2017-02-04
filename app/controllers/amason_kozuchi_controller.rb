require 'capybara/dsl'
require 'capybara/mechanize'

class AmasonKozuchiController < ApplicationController
  include Capybara::DSL
  skip_before_action :require_login

  def show
    init_capybara
    
    login unless loged_in?
    unless loged_in?
      # 画像認証の可能性あり
      # page.driver.browser.cookies
      page.save_page 'page.html'
      render html: page.html and return
      # render json: {result: false, name:'', message:'loged_in 失敗'} and return
    end
    item = wish_list_any_one_click
    
    if item[:button].present?
      item[:button].click
      # break_through_confirm
      render json: {result: true, name:item[:name], message:''} and return
    else
      render html: page.html and return
      # raise
      # render json: {result: false, name:'', message:'商品がないっぽい',} and return
    end
  end

private
  def init_capybara
    Capybara.app=""
    Capybara.app_host = "https://www.amazon.co.jp/"
    Capybara.run_server = false
    Capybara.register_driver :mechanize do |app|
      driver = Capybara::Mechanize::Driver.new(app)
      driver.configure do |agent|
        # Configure other Mechanize options here.
        # agent.log = Logger.new "mech.log"
        agent.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36'
      end
      driver
    end
    Capybara.current_driver = :mechanize
  end


  def login
    top_url = 'https://www.amazon.co.jp/'
    page.visit top_url
    sleep 1
    page.all("a[data-nav-role='signin']").first.click

    # ログイン画面に遷移
    page.find('#ap_email').set ENV['AMAZON_ID']
    page.find('#ap_password').set ENV['AMAZON_PW']
    sleep 1
    page.find('#signInSubmit').click
  end

  def loged_in?
    top_url = 'https://www.amazon.co.jp/'
    page.visit top_url unless current_url == top_url
    has_content?(ENV['AMAZON_NAME'])
  end

  # ほしいものリストのどれかを取得
  def wish_list_any_one_click
    id = '2IRVDPYI99EDT'
    url = "https://www.amazon.co.jp/gp/registry/wishlist/#{id}/"
    page.visit url
    
    # ワンクリックボタンのあるアイテム
    items = page.all("div[id^='item_']").select{|i| i.has_text? '1-Clickで今すぐ買う'}
    item = items.sample

    # アイテムがある場合は名前とボタンを取得
    if item.present?
      {name: item.find("a[id^='itemName_']").text ,button:item.find("a",:text => '1-Clickで今すぐ買う' )}
    else
      {name: '',button: nil}
    end
  end

  # ボタンクリック後の確認画面を突破する
  def break_through_confirm
    # 多分画面遷移した
    page.within("form[name='buyItem']")do
      find("input[type='image']").click
    end
    page.has_content?("#{ENV['AMAZON_NAME']}様、ありがとうございます！")
  end

end
