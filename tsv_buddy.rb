# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    temp = tsv.split("\n").map { |x| x.split("\t") }
    column_name = temp[0]
    @data = temp.drop(1).map { |y| column_name.zip(y).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv_temp = pre_to_csv(@data)
    tsv_temp.map { |row| "#{row.join("\t")}\n" }.join
  end

  def pre_to_csv(data)
    col_names = [data[0].keys]
    value = data.map(&:values)
    col_names.concat(value)
  end
end
