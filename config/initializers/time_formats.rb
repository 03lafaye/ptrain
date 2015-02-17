# Custom conversions for Time objects. Invoked with to_s(:label).
Time::DATE_FORMATS.merge!(
  :date_only => '%b %d %Y',
  :date_time => '%b %d %Y %I:%M'
)
