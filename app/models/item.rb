class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  include ApplicationHelper

  require 'rqrcode'

  has_one_attached :qr_code
  after_create :generate_qr

  def generate_qr
    qr_url = url_for(controller: 'items', 
                      action: 'show',
                      id: self.id,
                      only_path: false,
                      host: 'localhost:3000')

    qrcode = RQRCode::QRCode.new(qr_url)

    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    image_name = SecureRandom.hex

    IO.binwrite("tmp/#{image_name}.png", png.to_s)

    blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )

    self.qr_code.attach(blob)
  end

  
end
