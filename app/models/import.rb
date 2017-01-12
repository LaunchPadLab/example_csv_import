class Import < ApplicationRecord
  include CSVImportable::Importable

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: ['text/csv', 'text/plain']}, message: "is not in CSV format"

  def read_file
    Paperclip.io_adapters.for(file).read
  end

  def after_async_complete
    puts 'process completed'
  end

  def save_to_db
    save
  end

  def big_file_threshold
    100
  end
end
