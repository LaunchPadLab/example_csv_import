class UserRowImporter < CSVImportable::RowImporter
  def import_row
    user = User.create(
      email: pull_string('email', required: true),
      first_name: pull_string('first_name', required: true),
      last_name: pull_string('last_name', required: true)
    )
  end
end
