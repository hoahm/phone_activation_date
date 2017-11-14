class ActivationDate
  def initialize(my_arr)
    @my_arr = my_arr
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable  Metrics/MethodLength
  def find
    return my_arr[0][:activation_date] if length == 1

    activation_date = my_sorted_arr[0][:activation_date]

    i = length - 1
    while i >= 1
      if date_diff(my_sorted_arr[i][:activation_date], my_sorted_arr[i - 1][:deactivation_date])
        activation_date = my_sorted_arr[i][:activation_date]
        break
      end

      i -= 1
    end

    activation_date
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable  Metrics/MethodLength

  private

  attr_reader :my_arr

  def length
    my_arr.count
  end

  def my_sorted_arr
    @my_sorted_arr ||= my_arr.sort_by { |k, _v| k[:activation_date] }
  end

  def date_diff(from_date, to_date)
    return true if from_date.prev_month >= to_date
    false
  end
end
