namespace :import do
  desc "Import uploaded license applicants to users table"
  task uploads: :environment do
    uploads = Upload.all
    uploads.each do |upload|
      upload.csv.download.split("\n").each do |row|
        email, name = row.split(",")
        user = User.create!(email: email, name: name)
        LicenseMailer.with(user: user).new_license_email.deliver_later
      rescue StandardError
        # TODO: some error handling later
      end
    end
  end
end
