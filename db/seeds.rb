require 'csv'

categories = Rails.root.to_s + '/categories.txt'

CSV.foreach(categories) do |row|
  category_path = row[0].split(' > ')

  parent = nil
  for path in category_path
    @category = Category.where(scope: 'questions').where(name: path)
    @category = @category.where(category_id: parent.id) if parent.present?
    parent = @category.first_or_create
  end
end

ROLES = %w(USER SUPERADMIN ADMIN AUTHOR LEKTOR ANSPRECHPARTNER KURSMANAGER TUTOR LOGISTIK BUCHHALTUNG).freeze

for role in ROLES
  Role.where(name: role).first_or_create
end

default_password = 'changeme'

emails = ['superadmin@medgurus.de', 'alex.hetzel@medgurus.de', 'lena.wurst@uni-oldenburg.de']

for email in emails
  user = User.where(email: email).first_or_initialize
  user.email_confirmation = email
  user.password = default_password
  user.password_confirmation = default_password
  if email == 'lena.wurst@uni-oldenburg.de'
    user.add_role 'LEKTOR'
    user.add_role 'AUTHOR'
  else
    user.add_role 'SUPERADMIN'
  end
  user.skip_confirmation!
  user.save!
end
