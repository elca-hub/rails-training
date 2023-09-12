require 'rails_helper'

RSpec.describe Subject, type: :model do
  subject { subject }

  let(:subject) {build(:subject)}

  describe "バリデーション" do
    context "完璧で究極のバリデーションの場合" do
      it "有効" do
        expect(subject).to be_valid
      end
    end

    describe "name" do
      context "50文字以内の場合" do
        it "有効" do
          subject.name = "a" * 50
          expect(subject).to be_valid
        end
      end

      context "51文字以上の場合" do
        it "無効" do
          subject.name = "a" * 51
          expect(subject).to be_invalid
        end
      end

      context "空白の場合" do
        it "無効" do
          subject.name = " "
          expect(subject).to be_invalid
        end
      end

      context "nilの場合" do
        it "無効" do
          subject.name = nil
          expect(subject).to be_invalid
        end
      end

      context "値が重複している場合" do
        duplicate_name = 'duplicate'
        before { create(:subject, name: duplicate_name) }

        it '無効' do
          subject.name = duplicate_name

          expect(subject).to be_invalid
        end
      end
    end

    describe "evaluation" do
      describe "適切な評価の場合" do
        context "Sの場合" do
          it "有効" do
            subject.evaluation = "S"
            expect(subject).to be_valid
          end
        end

        context "Aの場合" do
          it "有効" do
            subject.evaluation = "A"
            expect(subject).to be_valid
          end
        end

        context "Bの場合" do
          it "有効" do
            subject.evaluation = "B"
            expect(subject).to be_valid
          end
        end

        context "Cの場合" do
          it "有効" do
            subject.evaluation = "C"
            expect(subject).to be_valid
          end
        end

        context "Dの場合" do
          it "有効" do
            subject.evaluation = "D"
            expect(subject).to be_valid
          end
        end

        context "Eの場合" do
          it "有効" do
            subject.evaluation = "E"
            expect(subject).to be_valid
          end
        end

        context "Fの場合" do
          it "有効" do
            subject.evaluation = "F"
            expect(subject).to be_valid
          end
        end
      end

      describe "適用外の値の場合" do
        context "空白の場合" do
          it "無効" do
            subject.evaluation = " "
            expect(subject).to be_invalid
          end
        end

        context "nilの場合" do
          it "無効" do
            subject.evaluation = nil
            expect(subject).to be_invalid
          end
        end
      end
    end

    describe "unit_value" do
      context "1の場合" do
        it "有効" do
          subject.unit_value = 1
          expect(subject).to be_valid
        end
      end

      context "0の場合" do
        it "有効" do
          subject.unit_value = 0
          expect(subject).to be_valid
        end
      end

      context "負数の場合" do
        it "無効" do
          subject.unit_value = -1
          expect(subject).to be_invalid
        end
      end

      context "空白の場合" do
        it "無効" do
          subject.unit_value = " "
          expect(subject).to be_invalid
        end
      end

      context "nilの場合" do
        it "無効" do
          subject.unit_value = nil
          expect(subject).to be_invalid
        end
      end
    end
  end
end
