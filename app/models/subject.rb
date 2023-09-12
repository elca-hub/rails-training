class Subject < ApplicationRecord
    MAX_NAME_LENGTH = 50

    enum :evaluation, {A: "A", B: "B", C: "C", D: "D", E: "E", F: "F", S: "S"}

    validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }, uniqueness: true
    validates :evaluation, presence: true
    validates :unit_value, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
