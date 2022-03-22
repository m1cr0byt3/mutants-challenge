require "rails_helper"

RSpec.describe "Stats", type: :request do
  
  describe "GET /stats" do
    
    let!(:mutant1) { create(:mutant) }
    let!(:mutant2) { create(:mutant) }
    let!(:human1) { create(:human) }
    let!(:mutant3) { create(:mutant) }

    context "Should be OK" do
      before { get "/stats" }
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  

  end
end
