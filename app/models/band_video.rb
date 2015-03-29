class BandVideo < ActiveRecord::Base
  validates :video_link, presence: true,
                         format: {
                          multiline: true,
                          with: /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
                         }
  validates :video_name, presence: true
  belongs_to :band

 #For youtube video embedding
	auto_html_for :video_link do
  	html_escape
  	image
  	youtube(width: 400, height: 250, autoplay: false)
  	link target: "_blank", rel: "nofollow"
  end

end
