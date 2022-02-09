# coding: utf-8
class SitesController < ApplicationController
  before_action  :check_guest_user, only: [:new, :edit, :destroy]
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites                
  def index
    @sites = current_user.keep_team.sites.includes([:user])
    @sites = @sites.order(updated_at: :DESC).page(params[:page]).per(8)

    # output site location (hash -> json) for googlemap
    # プルリク指摘の反映（map使用によるメモリ使用効率化）, いったん中間形式配列を生成してから to_hで受け渡し用hashに変換
    ar_points = @sites.map do |site|
      [site.id, 
        [site.title, 
          site.geom.x, 
          site.geom.y, 
          site.address, 
          site.description, 
          "<a href=\"" + site_path(site.id)  + "\">" + "<i class=\"fas fa-info-circle\"></i>" + "</a>&nbsp;", 
          current_user.guest? ? "" : "<a href=\"" + edit_site_path(site.id) + "\">" + "<i class=\"fas fa-edit\"></i>"   + "</a>&nbsp;", 
          current_user.guest? ? "" : "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete'" + " href='" + site_path(site.id) + "'>" + "<i class=\"fas fa-trash-alt\"></i>" + "</a>&nbsp;", 
          site.id]
        ]
    end
    @points = ar_points.to_h.to_json
  end

  # GET /sites/1
  def show 
  end
  
  # GET /sites/new
  def new
    @site = current_user.sites.build(team_id: current_user.keep_team_id)
    if(params[:geom])
      @site.geom = params[:geom]
    end
  end

  # POST /sites/confirm
  def confirm
    @site = Site.new(site_params)
  end

  # GET /sites/1/edit
  def edit
    if !(site_creator_or_team_owner?)
      flash[:alert]="Unauthorized Request."
      redirect_to statics_top_path
    end
  end

  # POST /sites
  def create
    @site = current_user.sites.build(site_params)
    @site.team_id ||= current_user.keep_team_id

    if params[:back]
      render :new
    else
      if(@site.save)
        flash[:notice] = "Site was successfully created."
        redirect_to site_path(@site)
      else
        flash.now[:alert] = 'create site failed.';
        render :new;
      end
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      flash[:notice] = "Site was successfully updated."      
      redirect_to site_path(@site)
    else
      flash.now[:alert] = 'update site failed.';
      render :edit;      
    end
  end

  # DELETE /sites/1
  def destroy
    if !(site_creator_or_team_owner?)
      flash[:alert]="Unauthorized Request."
      redirect_to statics_top_path
    else
      @site.destroy
      flash[:notice] = "Site was successfully destroyed."          
      redirect_to sites_url
    end
end
    
  private
  def set_site
    @site = Site.find(params[:id])
  end
  
  def site_params
    # viewから受け取るx, y(lat/lon)はモデルのプロパティではないため, geomプロパティに変更する
    sp = params.require(:site)
    if( !sp[:geom] )
      sp[:geom] = Point.from_x_y( sp[:y], sp[:x] )
      sp.delete(:x); sp.delete(:y)
    end
    sp.permit(:team_id, :title, :geom, :address, :description)
  end

  def site_creator_or_team_owner?
    ((current_user.id == @site.user_id) || (current_user.id == @site.team.owner.id)) ? true : false
  end
  
  # Geometry型に緯度経度を設定するためのPointクラス
  class Point
    def self.from_x_y(x, y)
      x.present? && y.present? ? "POINT(#{x} #{y})" : nil
    end
  end

end

