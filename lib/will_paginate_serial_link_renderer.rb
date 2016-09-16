require "will_paginate_serial_link_renderer/version"
require "will_paginate"
require "will_paginate/view_helpers"
require "will_paginate/view_helpers/link_renderer"

module WillPaginateSerialLinkRenderer
  # Your code goes here...
  class LinkRenderer < ::WillPaginate::ViewHelpers::LinkRenderer
    # * +collection+ is a WillPaginate::Collection instance or any other object
    #   that conforms to that API
    # * +options+ are forwarded from +will_paginate+ view helper
    # * +template+ is the reference to the template being rendered
    def prepare(collection, options, template)
      super(collection, options, template)
      @template = template
      @container_attributes = @base_url_params = nil
    end  
    
    def to_html
      [
        previous_page_tag,
        tag(:div, nil, {:"data-pagination" => represent_pages_as_string(pagination[1..-2])}),
        next_page_tag
      ].join('')
    end
    
    protected
    
    def previous_page
      @collection.current_page > 1 && @collection.current_page - 1
    end
    
    def next_page
      @collection.current_page < total_pages && @collection.current_page + 1
    end
    
    def previous_page_tag
      if previous_page
        tag(:div, "Previous", {:"data-pagination" => "prev:#{previous_page}", :class => "pagination-tag"})
      else
        tag(:div, "Previous", {:"data-pagination" => "prev:nil", :class => "pagination-tag"})
      end
    end
    
    def next_page_tag
      if next_page
        tag(:div, "Next", {:"data-pagination" => "next:#{next_page}", :class => "pagination-tag"})
      else
        tag(:div, "Next", {:"data-pagination" => "next:nil", :class => "pagination-tag"})
      end
    end
    
    def represent_pages_as_string(items)
      items.map(&:to_s).join('+')
    end
  end
end
