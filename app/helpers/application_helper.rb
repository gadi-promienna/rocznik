module ApplicationHelper
  include SimpleFormRansackHelper

  def destroy_button(object,confirmation="")
    link_to raw("<i class=\"fa fa-trash-o\"></i>"), object, :method => :delete,
      :class => %w{btn btn-outline btn-danger}, :"data-confirm" => confirmation
  end

  def edit_button(object,path,title="")
    link_to raw("<i class=\"fa fa-pencil-square-o\"></i>"), path, class: %w{btn btn-outline btn-default},
      title: title
  end

  def icon_to(klass,path,options={})
    link_to(raw("<i class='fa #{klass}'></i>"), path, {class: %w{btn btn-outline btn-default}}.merge(options))
  end

  def active?(url)
    if URI.parse(request_uri).path == URI.parse(url).path
      "active"
    else
      ""
    end
  end

  def acronym(short,long)
    raw("<acronym title='#{long}'>#{short}</acronym>")
  end

  def reset_filters(f)
    f.button :button, 'x', type: 'reset', class: 'btn btn-danger btn-sm', onclick: 'reload(); return false'
  end
end
