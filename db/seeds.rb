require 'csv'

categories = Rails.root.to_s+"/categories.txt"

CSV.foreach(categories) do |row|
  category_path = row[0].split(" > ")

  parent = nil
  for path in category_path
    @category = Category.where(scope: 'questions').where(name: path)
    if parent.present?
      @category = @category.where(category_id: parent.id)
    end
    parent = @category.first_or_create
  end

end


ROLES = %w(USER SUPERADMIN ADMIN AUTHOR LEKTOR ANSPRECHPARTNER KURSMANAGER TUTOR LOGISTIK BUCHHALTUNG)

for role in ROLES
  Role.where(name: role).first_or_create
end

default_password = "changeme"

user = User.where(email: "superadmin@medgurus.de").first_or_initialize
user.email_confirmation="superadmin@medgurus.de"
user.password=default_password
user.password_confirmation=default_password
user.add_role "SUPERADMIN"
user.skip_confirmation!
user.save!
