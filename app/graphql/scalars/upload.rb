# frozen_string_literal: true

module Scalars
  class Upload < Scalars::BaseScalar
    graphql_name 'Upload'
    description 'action_dispatch_uploaded_file'

    def self.coerce_input(file, _context)
      return nil if file.nil?

      ActionDispatch::Http::UploadedFile.new(
        filename: file.original_filename,
        type: file.content_type,
        head: file.headers,
        tempfile: file.tempfile
      )
    end
  end
end
