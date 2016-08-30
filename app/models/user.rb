class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  after_initialize :check_role

  attr_accessor :email_confirmation


  mount_uploader :avatar, AvatarUploader

  validate :email_has_to_be_validated, on: :create

  def email_has_to_be_validated
    errors.add(:email_confirmation, I18n.t("user.identical")) unless email_confirmation == email
  end


  def check_role
    if self.role.blank?
      self.role = Role.find_by_name(Role::USER)
    end
  end

  def is_team?
    Role::TEAM.include?(self.role.name)
  end



end
