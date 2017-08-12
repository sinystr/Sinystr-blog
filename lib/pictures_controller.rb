class PicturesController
    def upload_picture(picture)
        temporary_file = picture[:tempfile] 
        filename = "#{unique_filename}#{ File.extname(temporary_file)}"
        Magick::Image.read(temporary_file.path)
            .first.resize_to_fill(240, 150).write("public/article_pictures/#{filename}")
        filename
    end

    def unique_filename
        SecureRandom.uuid
    end
end
