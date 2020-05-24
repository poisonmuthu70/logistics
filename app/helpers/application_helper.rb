module ApplicationHelper
	def randomized_background_image
  			images = ["assets/header-bg.jpg", "assets/header-bg-1.jpg", "assets/original.jpg"]
  			images[rand(images.size)]
	end
end
