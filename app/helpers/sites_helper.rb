module SitesHelper
  def choose_new_or_edit
    if action_name=="new" || action_name=="create"
      # POST-->#create (POST)
      # OR 
      # PATCH/PUT-->#update (PATCH/PUT)
      confirm_sites_path
    elsif action_name=="edit"
      site_path  
    end
  end
end
