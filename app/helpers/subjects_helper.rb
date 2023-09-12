module SubjectsHelper
    def calc_gpa(subjects)
        sum = 0
        subjects.each do |subject|
            point = case subject.evaluation
            when "S"
                4
            when "A"
                3
            when "B"
                2
            when "C"
                1
            else
                0
            end

            sum += point * subject.unit_value
        end
        # 小数第2位で四捨五入
        (sum / subjects.sum(:unit_value).to_f * 100).round / 100.0
    end
end
