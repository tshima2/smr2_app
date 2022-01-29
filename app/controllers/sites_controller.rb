class SitesController < ApplicationController

  # GET /sites
  def index
    @sites = Site.all

    #output site location(json) for googlemap
    _points = []
    @sites.each do |site|
      _item = []
      _item.push(site.title)
      _item.push(site.geom.x)
      _item.push(site.geom.y)
      _item.push(site.address)
      _item.push(site.description)
      _item.push("<a href='" + site_path(site.id) + "'>" + site.title + "</a>")
      _points.push(_item)
    end
    @points = _points.to_json

  end

  # GET /sites/1
  def show 
    set_site
  end

private
  def set_site
    @site = Site.find(params[:id])
  end

end
