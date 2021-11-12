# Calendar of Year 2021

require 'time'
require 'date'
require 'pry'
require_relative 'services/meta_data'

def calendar_month
  return ARGV[0] unless ARGV[0].nil?

  Date.today.strftime("%B")
end

def is_calendar_month_is_current?
  return true if ARGV[0].nil?

  ARGV[0] == Date.today.strftime("%B")
end

def current_month_meta_data
  month = 
  MetaData::MONTHS.select do |month|
    month[:name].eql?(calendar_month)
  end.first
end

def start_day
  current_month_meta_data[:start_day_index]
end

def days
  current_month_meta_data[:days]
end

def start_week_day
  (1..days).to_a.first(MetaData::WEEK_SIZE - start_day).map do |day|
    "%02d" % day
  end.map do |day|
    if MetaData::CURRENT_DAY == day && is_calendar_month_is_current?
      "\e[32m%02d\e[0m" % day
    else
      day
    end
  end
end

def rest_of_the_days_array
  (1..days).to_a.last(days - MetaData::WEEK_SIZE + start_day).map do |day|
    "%02d" % day
  end.map do |day|
    if MetaData::CURRENT_DAY == day && is_calendar_month_is_current?
      "\e[32m%02d\e[0m" % day
    else
      day
    end
  end
end

def calendar
  heading
  first_row
  remaining_rows
end

def heading
  puts "     #{current_month_meta_data[:name]}  #{MetaData::CURRENT_YEAR}"
  puts "Su  Mo  Tu  We  Th  Fr  Sa"
end

def first_row
  case start_day
  when 0
    puts "#{start_week_day.join('  ')}"
  when 1
    puts "    #{start_week_day.join('  ')}"
  when 2
    puts "        #{start_week_day.join('  ')}"
  when 3
    puts "            #{start_week_day.join('  ')}"
  when 4
    puts "                #{start_week_day.join('  ')}"
  when 5
    puts "                    #{start_week_day.join('  ')}"
  when 6
    puts "                        #{start_week_day.join('  ')}"
  end
end

def remaining_rows
  rest_of_the_days_array.each_slice(MetaData::WEEK_SIZE).to_a.each do |rest_of_the_days|
    puts "#{rest_of_the_days.join('  ')}"
  end
end

calendar
