class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

 accepts_nested_attributes_for :roles, allow_destroy: true
  after_initialize :check_role

  attr_accessor :email_confirmation


  mount_uploader :avatar, AvatarUploader

  validate :email_has_to_be_validated, on: :create

  def email_has_to_be_validated
    errors.add(:email_confirmation, I18n.t("user.identical")) unless email_confirmation == email
  end


  def check_role
    if self.roles.blank?
      add_role 'USER'
    end
  end

  def is_team?
    %w(SUPERADMIN ADMIN AUTHOR LEKTOR ANSPRECHPARTNER KURSMANAGER TUTOR LOGISTIK BUCHHALTUNG).map{|x| has_role? (x)}.any?
  end



end
