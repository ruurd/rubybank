#============================================================================
# Application helper. We only add methods here that are universally useable.
# Anything that deals with a specific model is put in decorators
#
module ApplicationHelper

  # Return a gender sign
  # @param gender Male if {mM} otherwise female
  # @return gender sign character
  def gendersign(gender)
    if gender == 'M' || gender == 'm'
      '&#9794;'
    else
      '&#9792;'
    end
  end

  # Return a checkmark character
  def checkmark
    '&#10004;'
  end

  #Return the name of a language
  def language_name(loc)
    t("languages.#{loc}")
  end

  # Build a sortable header
  # @param column the column that must be sortable
  # @param title the title of the column
  # @return a sortable column header
  def thsortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? 'current #{sort_direction}' : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    content_tag(:th, class: css_class) do
      link_to title, { sort: column, direction: direction }
    end
  end

  # Build a sortable tab
  # @param column the column that must be sortable
  # @param title the title of the column
  # @return a sortable tab
  def tabsortable(tab, column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? 'sortable current #{sort_direction}' : 'sortable'
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    link_to title, { tab: tab, sort: column, direction: direction }, { class: css_class }
  end

end
