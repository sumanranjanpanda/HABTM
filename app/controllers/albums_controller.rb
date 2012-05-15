class AlbumsController < ApplicationController

	def new
		@album = Album.new
	end


	def create
	
		puts "------------------------------------------------------------"
		puts params[:album]
		puts "------------------------------------------------------------"

		@album=Album.new(params[:album])
		@album.user_id=session[:user_id]
		respond_to do |format|
			if @album.save
	#		@album.photos.create(:image=>params[:image])
			flash[:notice]="Album name successfully saved..."
			format.html {redirect_to  :action=>:showphoto,:id=>@album.id}
			else
			format.html {render :action=>:new}
			format.xml {render :xml=>@album.errors}
			end
		end

	end



	def showphoto
		@album=Album.find(params[:id])
	
	end


	def editAlbum
		@album=Album.find(params[:id])
		puts params[:id]
		puts "editAlbum-----------------------------------"
	end


	def updateAlbum
		puts params[:id]
		puts "updateAlbum-----------------------------------"
		puts params[:album]

		@album=Album.find(params[:id])
		if @album.update_attributes(params[:album])
				redirect_to :action=>"showphoto",:id=>@album.id
		end

	end


	def editphoto
		@photo=Photo.find(params[:id])
	
	end

	def updatephoto


		@photo=Photo.find(params[:id])
		puts @photo	
	       if @photo.update_attributes(params[:photo])
	         redirect_to :action=>:showphoto,:id=>@photo.album_id
	       end
	

	end



	def showusers
		
		@album=Album.find(params[:id])
		@user=User.find(@album.user_id)
	
	end




	def deletephoto
	
		@photo=Photo.find(params[:id])	
		if @photo.destroy
			@photo.image.clear
			redirect_to :action=>"showphoto",:id=>@photo.album_id
		end

	end

	def deleteAlbum
		@album=Album.find(params[:id])
		if @album.destroy
			redirect_to :action=>:viewalbum
		end

	end


	def showall
		@user=User.all
	
	end



	def viewalbum

		@user=User.find(session[:user_id])

	end


	def theme
	
	end


end

