namespace :import do
  desc "Import uploaded licence applicants to users table"
  task uploads: :environment do
    uploads = Upload.all
    uploads.each do |upload|
      upload.csv.download.split("\n").each do |row|
        email, name = row.split(",")
        User.create!(email: email, name: name)
      rescue StandardError
        # TODO: some error handling later
      end
    end
  end
end
