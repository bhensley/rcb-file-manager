class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_aws_credentials
  
  def index
    @user = current_user
    @files = Hash.new

    if @user.team && @user.team.resources
      @user.team.resources.each do |r|
        s3 = Aws::S3::Resource.new(region: r.bucket_region)
        
        # Does the bucket exist?
        if s3.bucket(r.bucket_name).exists?
          bucket = s3.bucket(r.bucket_name)

          # @files[r.bucket_name] = bucket.objects.reduce {|i| i.key.start_with?(r.album_path)}
          @files[r.name] = Hash.new
          @files[r.name][:album_path] = r.album_path
          @files[r.name][:files] = []

          bucket.objects.select{ |obj| obj.key.starts_with?(r.album_path) && obj.size > 0 }.each do |b|
            @files[r.name][:files] << {file_name: b.key, file_url: b.public_url, file_size: b.size, last_modified: b.last_modified}
          end
        end
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @files }
    end
  end

  private

  def setup_aws_credentials
    Aws.config.update({
      credentials: Aws::Credentials.new('AKIAJRKYXKMGONHSL7ZA', 'u/vmcMU1PEe/dChP5XJx/EZJULlcJfU+uwvCLFaG')
    })
  end
end
