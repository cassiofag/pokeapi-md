module Paginable
  def paginate(collection)
    paginate = paginator.call(
      collection,
      params: pagination_params,
      base_url: request.url
    )
  end

  def render_collection(paginated_collection)
    options = {
      meta: paginated_collection.meta.to_h, 
      links: paginated_collection.links.to_h
    
    }
    render json: serializer.new(paginated_collection.items, options), status: :ok
  end

  def pagination_params
    params.permit![:page]
  end

  def paginator
    JSOM::Pagination::Paginator.new
  end
end