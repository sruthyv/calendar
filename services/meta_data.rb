class MetaData
  MONTHS = [
    {
      name: 'January',
      days: 31,
      start_day_index: 5
    },
    {
      name: 'February',
      days: 30,
      start_day_index: 1
    },
    {
      name: 'March',
      days: 30,
      start_day_index: 1
    },
    {
      name: 'April',
      days: 30,
      start_day_index: 4
    },
    {
      name: 'May',
      days: 30,
      start_day_index: 6
    },
    {
      name: 'June',
      days: 30,
      start_day_index: 2
    },
    {
      name: 'July',
      days: 30,
      start_day_index: 4
    },
    {
      name: 'August',
      days: 30,
      start_day_index: 0
    },
    {
      name: 'September',
      days: 30,
      start_day_index: 3
    },
    {
      name: 'October',
      days: 30,
      start_day_index: 5
    },
    {
      name: 'November',
      days: 30,
      start_day_index: 1
    },
    {
      name: 'December',
      days: 30,
      start_day_index: 3
    }
  ]

  WEEK_SIZE = 7
  CURRENT_YEAR = Date.today.strftime("%Y")
  CURRENT_DAY = Date.today.strftime("%d")
end