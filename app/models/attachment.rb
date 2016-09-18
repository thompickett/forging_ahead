class Attachment < ApplicationRecord
  belongs_to :project

  has_attached_file :image
  #                   storage: :s3,
  #                   url: ENV["s3_domain_url"],
  #                   s3_credentials: Proc.new{|a| a.instance.s3_credentials}

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # def s3_credentials
  #   {bucket: ENV["BUCKET"],
  #    access_key_id: ENV["ACCESS_KEY_ID"],
  #    secret_access_key: ENV["SECRET_ACCESS_KEY"]}
  # end
end
