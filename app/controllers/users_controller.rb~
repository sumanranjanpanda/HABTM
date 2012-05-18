class UsersController < ApplicationController
before_filter :check ,:except=>[:signin,:signup,:create,:forgetpassword,:contactUs,:aboutUs]
#before_filter :checkuser, :except=>[:signin,:signup,:create,:forgetpassword]


	def index
		
		@user=User.find(params[:id])
		if @user.roles.collect{|rolename| rolename.name }.include?("Admin")
			redirect_to :action=>"showall"
		else
			redirect_to :action=>"profile",:id=>@user.id
		end
	
	
	end



	def signin
			@time_now=Time.now.to_s
	if @time_now =~/ (\d\d:\d\d)/
		@time_now=$1
	end
		if request.post?
			@user=User.new(params[:user])		
			user=User.find_by_username_and_password(@user.username,@user.password)
			if user
				session[:user_name]=user.username
				session[:user_id]=user.id
				if (params[:remember])
					cookies[:username]={:value=>user.username,:expire=>1.hour.from_now}
					cookies[:password]={:value=>user.password, :expire=>1.hour.from_now}
				end
				if user.roles.collect{|rolename| rolename.name }.include?("Admin")
					flash[:notice]="Welcome Admin "+session[:user_name]
					redirect_to :action=>"showall"
				else
					flash[:notice]="Welcome "+session[:user_name]
					redirect_to :action=>"profile",:id=>user.id
				end
			else
				if (@user.username == "")
				flash[:notice]="Username or Password can't be blank "
				else
				flash[:notice]="Username or Password is incorrect"
				end
			end
		end
	end

	def showall
		
		@admin=User.find(session[:user_id])
		#@users=User.find(:all, :conditions => ["id !=(?)", session[:user_id] ] )	
		#@admin=User.find_by_id(1)
		@users=User.paginate :page => params[:page] , :per_page => 3 ,:order => 'created_at DESC'
	end

	def signout
		reset_session
		flash[:notice]="Signned out successfully..."
		redirect_to :action=>"signin"
	end


	def signup
		@user=User.new
	end	

	def create

		@user=User.new(params[:user])
#		return if params[:attachment].blank?
#      		@user.uploaded_file = params[:attachment]
		if @user.save
			flash[:notice]=" successfully registered........."
			redirect_to :action=>"signin"
		else
			respond_to do |format|
				format.html {render :action=>"signup"}
				format.xml {render :xml=>@user.errors}
			end
		end
	end

	def download
 	  	send_file "#{params[:file_name]}", :type=>"application/zip"
	 end


	def profile
		@user=User.find(params[:id])
		if !@user
			redirect_to :action=>"signin"
		end	

	end


	def edit

		#@user=User.find_by_id(params[:id])
		#@admin=User.find(session[:user_id])
		
		
	end

 	def update
		@user=User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:notice]="Profile is updated Successfully........."
			if @user.roles.collect{|rolename| rolename.name }.include?("Admin")
				redirect_to :action=>"showall"
			else
				redirect_to :action=>"profile",:id=>@user.id
			end
		else
			respond_to do |format|
				format.html {render :action=>"edit"}
				format.xml {render :xml=>@user.errors}
			end
		end

	end



	def changepassword
		@user=User.find(params[:id])
		if request.post?
			if params[:newpassword]==params[:cnewpassword]	
					if @user.password == params[:oldpassword]
						@user.update_attribute(:password,params[:newpassword] )
						flash[:notice]="Password changed successfully..."
					else
						flash[:notice]="Entered correct old password .."
						redirect_to :action=>"changepassword"
					end
					if @user.roles.collect{|rolename| rolename.name }.include?("Admin")
						redirect_to :action=>"showall"
					else
						redirect_to :action=>"profile",:id=>@user.id
					end
			else
				flash[:notice]="Confirm New password must be same as New password"
				redirect_to :action=>:changepassword
			end
		end
	end



	def forgetpassword
		if request.post?
			@user=User.find_by_email(params[:email])
			if @user
				UserMailer::deliver_welcome_mail(@user)
				flash[:notice]="Username and Password has been sent to your mail id..."
				redirect_to :action=>:signin
			else
				flash[:notice]="Please enter your correct email id..."
			
			end
		end
	end

	def delete
		@user = User.find_by_id(params[:id])
		if (@user.id == 1)
			flash[:notice]="Head of Admin can't be deleted...ask to your DBA..."
			redirect_to :action=>"profile", :id=>@user.id
		else
			#@x = @user
			@usr = User.find_by_id(session[:user_id])
			@admin = @usr.roles.collect{|rolename| rolename.name }.include?("Admin")
			if @user 
				if @user.destroy

					if @admin
			puts "1----------------------------------------------------------------"
			puts @user
			puts @usr
			puts @admin		
			puts "1----------------------------------------------------------------"
						if (@user.id != @usr.id)
						flash[:notice]="Profile of " +@user.username+" deleted successfully"
						redirect_to :action=>"showall"
						else
						flash[:notice]="Your Profile deleted successfully..."
						redirect_to :action=>"signin"
						end
					else
						flash[:notice]="Your Profile deleted successfully..."
						redirect_to :action=>"signin"
					end
				end
			else
				if @admin
					redirect_to :action=>"showall"
				else
					reset_session
					redirect_to :action=>"signin"
				end
			end	
		end
	end


	def contactUS

	end

	def aboutUs
	
	end


private

	def check
		unless session[:user_name]
		flash[:notice]="Please Login to continue......"
		redirect_to :controller=>"users",:action=>"signin"
		end
	
	end
	

end








#send_file "#{RAILS_ROOT}/public/notes/contacts/#{@note_file.id}/original_#{@note_file.attached_file_name}", :filename => "#{@note_file.attached_file_name}", :type=>"#{@note_file.attached_content_type}"

#inside create method
#		puts "----------------------------------------------------------"
#		puts params[ :user ][ :role_ids ].flatten
#		puts "----------------------------------------------------------"
#		@roleids=params[ :user ][ :role_ids ]
#		@roleids.each do |roleid|
#		@user.roles << roleid
#		end

