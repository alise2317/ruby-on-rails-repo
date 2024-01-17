# frozen_string_literal: true

require 'json'
require 'selenium-webdriver'
require 'rspec/rails'
include RSpec::Expectations
describe 'NewTest' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    #@base_url = 'https://www.google.com/'
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  it 'test_incorrect_data_entry_when_logging_in' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:xpath, "//form[@id='new_user']/div[2]").click
    @driver.find_element(:name, 'user[email]').click
    @driver.find_element(:name, 'user[email]').clear
    @driver.find_element(:name, 'user[email]').send_keys 'user29@mail.ru'
    @driver.find_element(:name, 'user[password]').click
    @driver.find_element(:name, 'user[password]').clear
    @driver.find_element(:name, 'user[password]').send_keys '1234567'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='']/parent::*").click
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalize-space(.)='Automorphic numbers'])[1]/preceding::p[1]").click
  end
  it 'test_incorrect_data_entry_during_registration' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:link, 'Sign Up').click
    @driver.find_element(:id, 'user_email').clear
    @driver.find_element(:id, 'user_email').send_keys 'user29@mail.ru'
    @driver.find_element(:id, 'user_password').click
    @driver.find_element(:id, 'user_password').clear
    @driver.find_element(:id, 'user_password').send_keys '123456'
    @driver.find_element(:id, 'user_password_confirmation').click
    @driver.find_element(:id, 'user_password_confirmation').clear
    @driver.find_element(:id, 'user_password_confirmation').send_keys '1234566'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='Email has already been taken']/parent::*").click
    @driver.find_element(:xpath, "//div[@id='error_explanation']/ul/li ").click
  end
  it 'test_entering_already_used_mail' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:link, 'Sign up').click
    @driver.find_element(:id, 'user_email').clear
    @driver.find_element(:id, 'user_email').send_keys 'user1@mail.ru'
    @driver.find_element(:id, 'user_password').click
    @driver.find_element(:id, 'user_password').clear
    @driver.find_element(:id, 'user_password').send_keys '123456'
    @driver.find_element(:id, 'user_password_confirmation').click
    @driver.find_element(:id, 'user_password_confirmation').clear
    @driver.find_element(:id, 'user_password_confirmation').send_keys '123456'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='Email has already been taken']/parent::*").click
    @driver.find_element(:xpath, "//div[@id='error_explanation']/ul/li").click
  end
  it 'test_correct_log_in_and_out' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:name, 'user[email]').click
    @driver.find_element(:name, 'user[email]').clear
    @driver.find_element(:name, 'user[email]').send_keys 'user1@mail.ru'
    @driver.find_element(:name, 'user[password]').click
    @driver.find_element(:name, 'user[password]').clear
    @driver.find_element(:name, 'user[password]').send_keys '123456'
    @driver.find_element(:id, 'new_user').submit
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalize-space(.)=concat('', '\"', 'Welcome ', '\"', 'user1@mail.ru')])[1]/following::button[1]").click
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalize-space(.)='Sign Up'])[1]/following::h2[1]").click
  end
  it 'test_updating_data' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:name, 'user[email]').click
    @driver.find_element(:name, 'user[email]').clear
    @driver.find_element(:name, 'user[email]').send_keys 'user1@mail.ru'
    @driver.find_element(:name, 'user[password]').click
    @driver.find_element(:name, 'user[password]').clear
    @driver.find_element(:name, 'user[password]').send_keys '123456'
    @driver.find_element(:id, 'new_user').submit
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalize-space(.)='See all users'])[1]/following::button[1]").click
    @driver.find_element(:id, 'user_password').click
    @driver.find_element(:id, 'user_password').clear
    @driver.find_element(:id, 'user_password').send_keys '123456'
    @driver.find_element(:id, 'user_password_confirmation').click
    @driver.find_element(:id, 'user_password_confirmation').clear
    @driver.find_element(:id, 'user_password_confirmation').send_keys '123456'
    @driver.find_element(:id, 'user_current_password').click
    @driver.find_element(:id, 'user_current_password').clear
    @driver.find_element(:id, 'user_current_password').send_keys '123456'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:xpath,
                         "//*/text()[normalize-space(.)='Your account has been updated successfully.']/parent::*").click
  end
  it 'test_see_all_users_and_your_profile' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:name, 'user[email]').clear
    @driver.find_element(:name, 'user[email]').send_keys 'user1@mail.ru'
    @driver.find_element(:name, 'user[password]').click
    @driver.find_element(:name, 'user[password]').clear
    @driver.find_element(:name, 'user[password]').send_keys '123456'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Log
out'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='All users:']/parent::*").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Show
profile'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Edit
profile'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='Information about profile:']/parent::*").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='updated
at'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)=concat('', '\"', 'Welcome ', '\"',
'user1@mail.ru')])[1]/following::button[1]").click
  end
  it 'test_calc/input_without_log_in' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:xpath, '//body').click
    @driver.find_element(:xpath, "//button[@type='submit']").click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='Log in']/parent::*").click
  end
  it 'test_new' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:name, 'user[email]').click
    @driver.find_element(:name, 'user[email]').clear
    @driver.find_element(:name, 'user[email]').send_keys 'user1@mail.ru'
    @driver.find_element(:name, 'user[password]').click
    @driver.find_element(:name, 'user[password]').clear
    @driver.find_element(:name, 'user[password]').send_keys '123456'
    @driver.find_element(:id, 'new_user').submit
    @driver.find_element(:id, 'num').click
    @driver.find_element(:id, 'num').clear
    @driver.find_element(:id, 'num').send_keys '100'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='Result:']/parent::*").click
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalizespace(.)='N^2'])[1]/following::td[9]").click
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalizespace(.)='N^2'])[1]/following::td[10]").click
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalizespace(.)='N^2'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)=concat('', '\"', 'Welcome ', '\"',
'user1@mail.ru')])[1]/following::button[1]").click
  end
  it 'test_new' do
    @driver.get 'http://127.0.0.1:3000/users/sign_in'
    @driver.find_element(:xpath, '//body').click
    @driver.find_element(:link, 'Sign up').click
    @driver.find_element(:id, 'user_email').clear
    @driver.find_element(:id, 'user_email').send_keys 'user6@mail.ru'
    @driver.find_element(:id, 'user_password').click
    @driver.find_element(:id, 'user_password').clear
    @driver.find_element(:id, 'user_password').send_keys '123456'
    @driver.find_element(:id, 'user_password_confirmation').click
    @driver.find_element(:id, 'user_password_confirmation').clear
    @driver.find_element(:id, 'user_password_confirmation').send_keys '123456'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:xpath, "//*/text()[normalize-space(.)='Welcome! You have signed up
successfully.']/parent::*").click
    @driver.find_element(:id, 'num').click
    @driver.find_element(:id, 'num').clear
    @driver.find_element(:id, 'num').send_keys '10'
    @driver.find_element(:id, 'num').send_keys :enter
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalizespace(.)='N^2'])[1]/following::td[5]").click
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalizespace(.)='N^2'])[1]/following::td[6]").click
    @driver.find_element(:xpath,
                         "(.//*[normalize-space(text()) and normalizespace(.)='N^2'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='See all
users'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Cancel my
account'])[1]/following::button[1]").click
  end
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NotFound
    false
  end

  def verify
    yield
  rescue ExpectationNotMetError => e
    @verification_errors << e
  end

  def close_alert_and_get_its_text(_how, _what)
    alert = @driver.switch_to.alert
    alert_text = alert.text
    if @accept_next_alert
      alert.accept
    else
      alert.dismiss
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
