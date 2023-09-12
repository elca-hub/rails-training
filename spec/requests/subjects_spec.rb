require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/subjects", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Subject. As you add validations to Subject, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:subject).attributes
  }

  let(:invalid_attributes) {
    build(:subject, :invalid).attributes
  }

  describe "GET /index" do
    it "renders a successful response" do
      Subject.create! valid_attributes
      get subjects_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_subject_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      subject = Subject.create! valid_attributes
      get edit_subject_url(subject)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Subject" do
        expect {
          post subjects_url, params: { subject: valid_attributes }
        }.to change(Subject, :count).by(1)
      end

      it "redirects to the created subject" do
        post subjects_url, params: { subject: valid_attributes }
        expect(response).to redirect_to(subjects_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Subject" do
        expect {
          post subjects_url, params: { subject: invalid_attributes }
        }.to change(Subject, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post subjects_url, params: { subject: invalid_attributes }
        expect(response).to redirect_to(new_subject_path)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:subject, name: "new_name").attributes
      }

      it "updates the requested subject" do
        subject = Subject.create! valid_attributes
        patch subject_url(subject), params: { subject: new_attributes }
        subject.reload
        expect(subject.name).to eq("new_name")
      end

      it "redirects to the subject" do
        subject = Subject.create! valid_attributes
        patch subject_url(subject), params: { subject: new_attributes }
        subject.reload
        expect(response).to redirect_to(subjects_path)
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        subject = Subject.create! valid_attributes
        patch subject_url(subject), params: { subject: invalid_attributes }
        expect(response).to redirect_to(edit_subject_path(subject))
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested subject" do
      subject = Subject.create! valid_attributes
      expect {
        delete subject_url(subject)
      }.to change(Subject, :count).by(-1)
    end

    it "redirects to the subjects list" do
      subject = Subject.create! valid_attributes
      delete subject_url(subject)
      expect(response).to redirect_to(subjects_url)
    end
  end
end
