class UsersDatatable
  
  def initialize(params)
    @params = params
  end
  
  def as_json(options = {})
    {
        total_items: total_items,
        number_of_items: number_of_items,
        items: items
    }
  end

  private

  def items
    users
  end

  def total_items
    users
    @total_items
  end

  def number_of_items
    users.length
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = lookup_users.page(page).per_page(limit)
  end

  def lookup_users
    users = User.filter(@params.slice(:short_name, :starts_with))
                .order("#{sort_column} #{sort_direction}")
    @total_items = users.length
    users
  end
  
  def page
    @params[:page] && @params[:page].to_i > 0 ?  @params[:page].to_i : 1
  end

  def limit
    @params[:limit] && @params[:limit].to_i > 0 ? @params[:limit].to_i : 10
  end

  def sort_column
    @params[:sort_column] ? @params[:sort_column] : "short_name"
  end

  def sort_direction
    @params[:sort_direction] == "desc" ? "desc" : "asc"
  end

end