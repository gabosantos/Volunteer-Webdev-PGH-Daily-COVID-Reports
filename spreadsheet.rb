require "bundler"
Bundler.require

session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# if using sheets "id"
#spreadsheet = session.spreadsheet_by_key("1mPRHYq-lLRJmRJtDs2uOrtY6IRe0lHK4lamRWaWsfZs")

# if using sheets name
spreadsheet = session.spreadsheet_by_title("PGH COVID Data")
# get the first worksheet with name
worksheet = spreadsheet.worksheets.detect {|ws| ws.title == "Sheet5" }

# get row and print
worksheet.rows.first(10).each { |row| puts row.first(12).join("\t|\t") }

# add lines
#worksheet.insert_rows(worksheet.num_rows + 1,
#[
#    ["Testing", "to", "add", 2, "line"],
#    ["Testing", "to", "add", "this", "line"]
#])
#worksheet.save

# access per cell
# puts worksheet[4,2]

# reload in case some other person changes while working here
# worksheet.reload

# more reference https://github.com/gimite/google-drive-ruby#use