class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name,                     presence: true               
         validates :family_name,              presence: true        
         validates :first_name,               presence: true       
         validates :family_name_kana,         presence: true   
         validates :first_name_kana,          presence: true   
         validates :birth_day,                presence: true  

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password,        with: PASSWORD_REGEX,          message: 'には英字と数字の両方を含めて設定してください' 
         FAMILY_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/                .freeze
         validates_format_of :family_name,     with: FAMILY_NAME_REGEX,       message: 'には半角英数字は使えません' 
         FIRST__NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/                .freeze
         validates_format_of :first_name,      with: FIRST__NAME_REGEX,       message: 'には半角英数字は使えません' 
         FAMILY_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/             .freeze
         validates_format_of :family_name_kana, with: FAMILY_NAME_KANA_REGEX, message: 'カタカナのみ設定できます' 
         FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/              .freeze
         validates_format_of :first_name_kana, with: FIRST_NAME_KANA_REGEX,   message: 'カタカナのみ設定できます' 
        
         has_many   :items    
         has_many   :orders 
         
end

