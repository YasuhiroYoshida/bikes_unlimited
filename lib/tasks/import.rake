namespace :import do
  desc "Import uploaded license applicants to users table"
  task uploads: :environment do
    success_count = 0
    failed_user_names = []

    uploads = Upload.all
    uploads.each do |upload|
      upload.csv.download.split("\n").each do |row|
        email, name = row.split(",")
        user = User.create!(email: email, name: name)
        LicenseMailer.with(user: user).new_license_email.deliver_later
        success_count += 1
      rescue StandardError
        failed_user_names << user.name
      end
    end

    ReportMailer.with(success_count: success_count, failed_user_names: failed_user_names).report_email.deliver_later
  end
end
