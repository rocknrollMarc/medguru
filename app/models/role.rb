class Role < ActiveRecord::Base

  USER = "USER"
  SUPERADMIN="SUPERADMIN"
  ADMIN="ADMIN"
  AUTHOR="AUTHOR"
  TUTOR="TUTOR"
  LOGISTIK="LOGISTIK"
  BUCHHALTUNG="BUCHHALTUNG"

  TEAM = %w(SUPERADMIN ADMIN AUTHOR TUTOR LOGISTIK BUCHHALTUNG)

  belongs_to :user

end
