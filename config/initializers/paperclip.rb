if Rails.env.production?
  Paperclip::Attachment.default_options.update(
    storage: :fog,
    fog_credentials: {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_KEY'],
      aws_secret_access_key: ENV['S3_SECRET']
    },
    fog_directory: ENV["S3_BUCKET"],
  )
end
