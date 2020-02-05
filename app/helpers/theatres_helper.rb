module TheatresHelper
  def group_name(grouping)
    case grouping
    when '1'
      'Major principally presenting performance space'
    when '2'
      'Large principally presenting performance space'
    when '3'
      'Medium principally presenting performance space'
    when '4'
      'Principally producing performance space'
    when '5'
      'Smaller performance space'
    when '6'
      'Miscellaneous performance space'
    end
  end

  def count_af_venue_mappings(theatre)
    AfVenueMapping.joins(:performance_space)
                  .where(performance_spaces: { theatre_id: theatre.id }).count
  end

  def status(theatre)
    if count_af_venue_mappings(theatre) > 0 && all_venues_mapped?(theatre)
      '<span style="color: green">Ready for reporting</span>'.html_safe
    elsif theatre.performance_spaces.present?
      '<span style="color: orange">Performance spaces require mapping</span>'.html_safe
    elsif theatre.source_org.present?
      '<span style="color: orange">Performance spaces require defining</span>'.html_safe
    else
      '<span style="color: red">Theatre requires onboarding</span>'.html_safe
    end
  end

  def all_venues_mapped?(theatre)
    theatre.af_venues.count == count_af_venue_mappings(theatre)
  end
end
